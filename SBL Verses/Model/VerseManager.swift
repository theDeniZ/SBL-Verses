//
//  VerseManager.swift
//  SBL Verses
//
//  Created by Denis Dobanda on 11.10.20.
//

import Foundation
import Regex

struct LogRecord {
    let question: String
    let foundQuestionLocations: String
    let translatedQuestionLocations: String
    let response: String
    
    var descrciption: String {
        "Question '\(question)'\nFound locations: [\(foundQuestionLocations)], translated into [\(translatedQuestionLocations)]\n\nResponse:\n\(response)\n"
    }
}

class VerseManager {
    
    enum VerseManagerError: Error {
        case wrongRegex
    }
    
    // API
    let originalString: String
    var replaced: String?
    private var logs: [LogRecord] = []
    
    init(originalString: String) {
        self.originalString = originalString
    }
    
    func replace(settings: VerseSettings, progress: ((Int, Int) -> Void)? = nil) throws {
        guard
            let questionRegex = settings.regexSettings.questionsRegex.r,
            let verseRegex = settings.regexSettings.versesRegex.r,
            let bookRegex = settings.regexSettings.bookRegex.r
        else { throw VerseManagerError.wrongRegex }
        
        logs = []
        
        let overall = questionRegex.allMatches(in: originalString).count
        var current = 0
        replaced = questionRegex.replaceAll(in: originalString) {
            current += 1
            progress?(current, overall)

            let verses = verseRegex.allMatches(in: $0.matched)
            let translated = verses
                .map {
                    bookRegex.replaceAll(in: $0) {
                        settings.mappingVersion.map?[$0.matched.trimmingCharacters(in: .newlines).replacingOccurrences(of: " ", with: "")] ?? $0.matched
                    }
                }
                .map {
                    let first = $0.replacingOccurrences(of: " ", with: "")
                    if !first.contains(":") {
                        return first.replacingOccurrences(of: ",", with: ":").replacingOccurrences(of: ".", with: ",")
                    } else {
                        return first
                    }
                }
                .map { str in str.hasSuffix(",") || str.hasSuffix(".") || str.hasSuffix(";") ? String(str.dropLast()) : str }

            let requestString = translated.joined(separator: ";")
            let response = callSyncApi(with: requestString, bibleVersion: settings.bibleVersion)

            let formattedVerses = response?.formattedVerses(
                withPrefix: settings.verseFormattingSettings.versePrefix,
                andSuffix: settings.verseFormattingSettings.verseSuffix,
                predicateForLocation: settings.verseFormattingSettings.verseLocationPredicate
            )

            logs.append(
                LogRecord(
                    question: $0.matched.trimmingCharacters(in: .whitespacesAndNewlines),
                    foundQuestionLocations: verses.joined(separator: "; "),
                    translatedQuestionLocations: requestString,
                    response: response?.description ?? "No response"
                )
            )
            if let allFormattedVerses = formattedVerses, !allFormattedVerses.isEmpty {

                return $0.matched + settings.verseFormattingSettings.containerPrefix + allFormattedVerses + settings.verseFormattingSettings.containerSuffix
            } else {
                return $0.matched
            }
        }
    }
    
    func write(to url: URL) -> Bool {
        if let replactedData = replaced?.data(using: .utf8) {
            do {
                FileManager.default.createFile(atPath: url.path, contents: nil, attributes: nil)
                try replactedData.write(to: url)
                return true
            } catch {
                print("Failed writing with \(error.localizedDescription)")
                return false
            }
        }
        return false
    }
    
    func getLogs() -> String {
        logs.enumerated().map({"Record \($0 + 1):\n\($1.descrciption)\n----------"}).joined(separator: "\n")
    }
    
    // Private
    private func callApi(on path: String, bibleVersion: BibleVersion, callback: ((Data?, Error?) -> Void)? = nil) {
        guard let url = URL(string: "http://getbible.net/json?scrip=\(path)&v=\(bibleVersion.rawValue)") else {
            callback?(nil, URLError(.badURL))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let data = data {
                callback?(data, nil)
            } else {
                callback?(nil, err)
            }
        }.resume()
    }
    
    private func callSyncApi(with call: String, bibleVersion: BibleVersion) -> BibleResponse? {
        var response: BibleResponse?
        
        let group = DispatchGroup()
        group.enter()
        callApi(on: call, bibleVersion: bibleVersion) { (data, err) in
            guard var data = data else { print("Fail"); group.leave(); return }
            data = data.dropFirst()
            data = data.dropLast(2)
            do {
                let res = try JSONDecoder().decode(BibleResponse.self, from: data)
                response = res
            } catch {
                //            print(error.localizedDescription)
                //            print("The data: \(data.stringValue ?? "NIL")")
            }
            group.leave()
        }
        group.wait()
        
        return response
    }
    
}
