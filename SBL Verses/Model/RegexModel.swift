//
//  RegexModel.swift
//  SBL Verses
//
//  Created by Denis Dobanda on 18.10.20.
//

import Foundation

struct RegexSettings {
    var questionsRegex: String
    var versesRegex: String
    var bookRegex: String
}

enum AvailableRegex {
    case german
    case russian
    case english
    
    var settings: RegexSettings {
        switch self {
        case .german:
            return RegexSettings(
                questionsRegex: #"<p class="calibre1"><b class="calibre2">[abcdefghijk]\.\ (.*)</b></p>\n"#,
                versesRegex: #"(?:\ (?:\d\.\s)?[A-Za-zöüäß]+(?:\s?\d+\,(?:\ (?:(?:\d+\-\d+)|(?:\d+))\.?)+\;?)+\;?)+"#,
                bookRegex: #"((?:\d\.\s)?[A-za-züöäß]+)"#
            )
        case .russian:
            return RegexSettings(
                questionsRegex: #"<p class="вопросы">[а-з]\.\ (.*)</p>\n"#,
                versesRegex: #"(?:\ (?:\d\s)?[А-Яа-я ]+(?:\s?\d+:(?:\ ?(?:(?:\d+-\d+)|(?:\d+)),?)+;?)+;?)+"#,
                bookRegex: #"((?:\d\s)?[А-Яа-я ]+)"#
            )
        case .english:
            return RegexSettings(
                questionsRegex: #"<p class="question">[abcdefghijk]\.\ (.*)</p>\n"#,
                versesRegex: #"(?:\ (?:\d\s)?[A-Za-z ]+(?:\s?\d+:(?:\ ?(?:(?:\d+-\d+)|(?:\d+)),?)+;?)+;?)+"#,
                bookRegex: #"((?:\d\s)?[A-Za-z ]+)"#
            )
        }
    }
}
