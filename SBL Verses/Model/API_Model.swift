//
//  API_Model.swift
//  SBL Verses
//
//  Created by Denis Dobanda on 18.10.20.
//

import Foundation

struct BibleResponse: Decodable, CustomStringConvertible {
    let book: [Book]
    
    var description: String {
        book.map { $0.description }.joined(separator: "\n\n")
    }
    
    var descriptionForDebug: String {
        book.map { $0.descriptionForDebug }.joined(separator: ";")
    }
    
    func formattedVerses(
        withPrefix prefix: String,
        andSuffix suffix: String,
        predicateForLocation: String,
        backwardsMapping: [String: String]? = nil
    ) -> String {
        book.map { prefix + $0.formattedVerses(with: predicateForLocation, backMap: backwardsMapping) + suffix }.joined(separator: "\n")
    }
}

struct Book: Decodable, CustomStringConvertible {
    let book_name: String
    let chapter_nr: String
    let chapter: Verses
    
    var description: String {
        "Book: '\(book_name)', chapter '\(chapter_nr)', verses: \(chapter.description)"
    }
    
    var descriptionForDebug: String {
        book_name + " " + chapter_nr + ":" + chapter.descriptionForDebug
    }
    
    func formattedVerses(with predicate: String, backMap: [String: String]? = nil) -> String {
        guard predicate.contains("%@") else { fatalError() }
        let location = String(format: predicate, "(\(backMap?[book_name] ?? book_name) \(chapter_nr))")
        let verses = chapter.formatterVerses()
        return verses + " " + location
    }
}

class Verses: Decodable, CustomStringConvertible {
    let verses: [Verse]
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let verses = try container.decode([String: Verse].self)
        let list: [(Int, Verse)] = verses.compactMap { if let num = Int($0.key) { return (num, $0.value) } else { return nil } }.sorted { $0.0 < $1.0 }
        self.verses = list.map { $0.1 }
    }
    
    var description: String {
        verses.map { $0.description }.joined(separator: "; ")
    }
    
    var descriptionForDebug: String {
        verses.map { String($0.number) }.joined(separator: ", ")
    }
    
    func formatterVerses() -> String {
        verses.map { "\($0.number) \($0.verse)" }.joined(separator: " ")
    }
}

class Verse: Decodable, CustomStringConvertible {
    
    private enum CodingKeys: String, CodingKey {
        case verse_nr, verse
    }
    
    let number: Int
    let verse: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let num = try? container.decode(Int.self, forKey: .verse_nr) {
            number = num
        } else if let string = try? container.decode(String.self, forKey: .verse_nr), let num = Int(string) {
            number = num
        } else {
            number = try container.decode(Int.self, forKey: .verse_nr)
        }
        verse = try container.decode(String.self, forKey: .verse)
    }
    
    var description: String {
        "\n\(number): `\(verse.trimmingCharacters(in: .whitespacesAndNewlines))`"
    }
}
