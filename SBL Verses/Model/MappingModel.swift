//
//  Mappings.swift
//  SBL Verses
//
//  Created by Denis Dobanda on 11.10.20.
//

import Foundation

let germanMapping = [
    "1. Mose": "Genesis",
    "2. Mose": "Exodus",
    "3. Mose": "Leviticus",
    "4. Mose": "Numbers",
    "5. Mose": "Deuteronomy",
    "Josua": "Joshua",
    "Richter": "Judges",
    "Ruth": "Ruth",
    "1. Samuel": "1Samuel",
    "2. Samuel": "2Samuel",
    "1. Könige": "1Kings",
    "2. Könige": "2Kings",
    "1. Chronik": "1Chronicles",
    "2. Chronik": "2Chronicles",
    "Esra": "Ezra",
    "Nehemia": "Nehemiah",
    "Esther": "Esther",
    "Hiob": "Job",
    "Psalm": "Psalm",
    "Sprüche": "Proverbs",
    "Prediger": "Ecclesiastes",
    "Hohelied": "Song of Solomon",
    "Jesaja": "Isaiah",
    "Jeremia": "Jeremiah",
    "Klagelieder": "Lamentations",
    "Hesekiel": "Ezekiel",
    "Daniel": "Daniel",
    "Hosea": "Hosea",
    "Joel": "Joel",
    "Amos": "Amos",
    "Obadja": "Obadiah",
    "Jona": "Jonah",
    "Micha": "Micah",
    "Nahum": "Nahum",
    "Habakuk": "Habakkuk",
    "Zephanja": "Zephaniah",
    "Haggai": "Haggai",
    "Sacharja": "Zechariah",
    "Maleach": "Malachi",
    "Matthäus": "Matthew",
    "Markus": "Mark",
    "Lukas": "Luke",
    "Johannes": "John",
    "Apostelgeschichte": "Acts",
    "Römer": "Romans",
    "1. Korinther": "1Corinthians",
    "2. Korinther": "2Corinthians",
    "Galater": "Galatians",
    "Epheser": "Ephesians",
    "Philipper": "Philippians",
    "Kolosser": "Colossians",
    "1. Thessalonicher": "1Thessalonians",
    "2. Thessalonicher": "2Thessalonians",
    "1. Timotheus": "1Timothy",
    "2. Timotheus": "2Timothy",
    "Titus": "Titus",
    "Philemon": "Philemon",
    "Hebräer": "Hebrews",
    "Jakobus": "James",
    "1. Petrus": "1Peter",
    "2. Petrus": "2Peter",
    "1. Johannes": "1John",
    "2. Johannes": "2John",
    "3. Johannes": "3John",
    "Judas": "Jude",
    "Offenbarung": "Revelation"
]

let russianMapping = [
    "Бытие": "Genesis",
    "Исход": "Exodus",
    "Левит": "Leviticus",
    "Числа": "Numbers",
    "Второзаконие": "Deuteronomy",
    "Иисуса Навина": "Joshua",
    "Судей": "Judges",
    "Руфь": "Ruth",
    "1 Царств": "1Samuel",
    "2 Царств": "2Samuel",
    "3 Царств": "1Kings",
    "4 Царств": "2Kings",
    "1 Паралипоменон": "1Chronicles",
    "2 Паралипоменон": "2Chronicles",
    "Ездры": "Ezra",
    "Неемии": "Nehemiah",
    "Есфирь": "Esther",
    "Иова": "Job",
    "Псалтирь": "Psalm",
    "Притчи": "Proverbs",
    "Екклесиаста": "Ecclesiastes",
    "Песнь Песней": "Song of Solomon",
    "Исаии": "Isaiah",
    "Иеремии": "Jeremiah",
    "Плач Иеремии": "Lamentations",
    "Иезекииля": "Ezekiel",
    "Даниила": "Daniel",
    "Осии": "Hosea",
    "Иоиля": "Joel",
    "Амоса": "Amos",
    "Авдия": "Obadiah",
    "Ионы": "Jonah",
    "Михея": "Micah",
    "Наума": "Nahum",
    "Аввакума": "Habakkuk",
    "Софонии": "Zephaniah",
    "Аггея": "Haggai",
    "Захарии": "Zechariah",
    "Малахии": "Malachi",
    "От Матфея": "Matthew",
    "От Марка": "Mark",
    "От Луки": "Luke",
    "От Иоанна": "John",
    "Деяние": "Acts",
    "К Римлянам": "Romans",
    "1 Коринфянам": "1Corinthians",
    "2 Коринфянам": "2Corinthians",
    "К Галатам": "Galatians",
    "К Ефесянам": "Ephesians",
    "К Филиппийцам": "Philippians",
    "К Колоссянам": "Colossians",
    "1 Фессалоникийцам": "1Thessalonians",
    "2 Фессалоникийцам": "2Thessalonians",
    "1 Тимофею": "1Timothy",
    "2 Тимофею": "2Timothy",
    "К Титу": "Titus",
    "К Филимону": "Philemon",
    "К Евреям": "Hebrews",
    "Иакова": "James",
    "1 Петра": "1Peter",
    "2 Петра": "2Peter",
    "1 Иоанна": "1John",
    "2 Иоанна": "2John",
    "3 Иоанна": "3John",
    "Иуды": "Jude",
    "Откровение": "Revelation"
]

enum MappingVersion: CaseIterable {
    case noMapping
    case german
    case russian
    //    case ukrainian
    
    var map: [String: String]? {
        switch self {
        
        case .noMapping: return nil
        case .german: return germanMapping
        case .russian: return russianMapping
        //        case .ukrainian: return nil
        }
    }
    
    var displayTitle: String {
        switch self {
        case .noMapping: return "English"
        case .german: return "German"
        case .russian: return "Russian"
        //        case .ukrainian: return "Ukrainian Verses"
        }
    }
}
