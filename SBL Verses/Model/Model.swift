//
//  Midel.swift
//  convertVerses
//
//  Created by Dobanda, Denis on 26.03.20.
//  Copyright © 2020 theDeniZ. All rights reserved.
//

import Foundation

enum AvailableSettings {
    case english
    case german
    case russian
}

class VerseSettings: ObservableObject {
    @Published var bibleVersion: BibleVersion = .luther1912
    @Published var mappingVersion: MappingVersion = .german
    @Published var regexSettings: RegexSettings = .init(
        questionsRegex: #"<p class="calibre1"><b class="calibre2">[abcdefghijk]\.\ (.*)</b></p>\n"#,
        versesRegex: #"(?:\ (?:\d+\.\s)?[A-Za-zöüä]+(?:\s?\d+\,(?:\ (?:(?:\d+\-\d+)|(?:\d+))\.?)+\;?)+\;?)+"#,
        bookRegex: #"((?:\d\.\ )?[A-za-züöä]+)"#
    )
    @Published var verseFormattingSettings: VerseFormattingSetting = .init(
        containerPrefix: "<div class=\"verses\">\n",
        containerSuffix: "</div>\n",
        versePrefix: "<p class=\"calibre1a\">",
        verseSuffix: "</p>\n",
        verseLocationPredicate: "<span class=\"verse-location\">%@</span>"
    )
    
    func load(_ availableSetting: AvailableSettings) {
        switch availableSetting {
        case .english:
            bibleVersion = .kjv
            mappingVersion = .noMapping
            regexSettings = AvailableRegex.english.settings
            verseFormattingSettings = VerseFormattingSetting(
                containerPrefix: "<div class=\"verses\">\n",
                containerSuffix: "</div>\n",
                versePrefix: "<p class=\"calibre1a\">",
                verseSuffix: "</p>\n",
                verseLocationPredicate: "<span class=\"verse-location\">%@</span>"
            )
        case .german:
            bibleVersion = .luther1912
            mappingVersion = .german
            regexSettings = AvailableRegex.german.settings
            verseFormattingSettings = VerseFormattingSetting(
                containerPrefix: "<div class=\"verses\">\n",
                containerSuffix: "</div>\n",
                versePrefix: "<p class=\"calibre1a\">",
                verseSuffix: "</p>\n",
                verseLocationPredicate: "<span class=\"verse-location\">%@</span>"
            )
        case .russian:
            bibleVersion = .synodal
            mappingVersion = .russian
            regexSettings = AvailableRegex.russian.settings
            verseFormattingSettings = VerseFormattingSetting(
                containerPrefix: "<div class=\"verses\">\n",
                containerSuffix: "</div>\n",
                versePrefix: "<p class=\"calibre1a\">",
                verseSuffix: "</p>\n",
                verseLocationPredicate: "<span class=\"verse-location\">%@</span>"
            )
        }
    }
}

enum BibleVersion: String, CaseIterable, Identifiable {
    case kjv
    case luther1912
    case synodal
//    case ukranian
    
    var id: String { return self.rawValue }
    
    var displayTitle: String {
        switch self {
        case .kjv: return "English KJV"
        case .luther1912: return "German Luther 1912"
        case .synodal: return "Russian Synodal"
//        case .ukranian: return "Ukrainian Kulish 1871"
        }
    }
}

struct VerseFormattingSetting {
    var containerPrefix: String
    var containerSuffix: String
    var versePrefix: String
    var verseSuffix: String
    var verseLocationPredicate: String
}
