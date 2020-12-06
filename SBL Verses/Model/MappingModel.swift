//
//  Mappings.swift
//  SBL Verses
//
//  Created by Denis Dobanda on 11.10.20.
//

import Foundation

let germanMapping = [
    "1.Mose": "Genesis",
    "2.Mose": "Exodus",
    "3.Mose": "Leviticus",
    "4.Mose": "Numbers",
    "5.Mose": "Deuteronomy",
    "Josua": "Joshua",
    "Richter": "Judges",
    "Ruth": "Ruth",
    "1.Samuel": "1Samuel",
    "2.Samuel": "2Samuel",
    "1.Könige": "1Kings",
    "2.Könige": "2Kings",
    "1.Chronik": "1Chronicles",
    "2.Chronik": "2Chronicles",
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
    "1.Korinther": "1Corinthians",
    "2.Korinther": "2Corinthians",
    "Galater": "Galatians",
    "Epheser": "Ephesians",
    "Philipper": "Philippians",
    "Kolosser": "Colossians",
    "1.Thessalonicher": "1Thessalonians",
    "2.Thessalonicher": "2Thessalonians",
    "1.Timotheus": "1Timothy",
    "2.Timotheus": "2Timothy",
    "Titus": "Titus",
    "Philemon": "Philemon",
    "Hebräer": "Hebrews",
    "Jakobus": "James",
    "1.Petrus": "1Peter",
    "2.Petrus": "2Peter",
    "1.Johannes": "1John",
    "2.Johannes": "2John",
    "3.Johannes": "3John",
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
    "1Царств": "1Samuel",
    "2Царств": "2Samuel",
    "3Царств": "1Kings",
    "4Царств": "2Kings",
    "1Паралипоменон": "1Chronicles",
    "2Паралипоменон": "2Chronicles",
    "Ездры": "Ezra",
    "Неемии": "Nehemiah",
    "Есфирь": "Esther",
    "Иова": "Job",
    "Псалтирь": "Psalms",
    "Притчи": "Proverbs",
    "Екклесиаста": "Ecclesiastes",
    "ПесньПесней": "Song of Solomon",
    "Исаии": "Isaiah",
    "Иеремии": "Jeremiah",
    "ПлачИеремии": "Lamentations",
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
    "ОтМатфея": "Matthew",
    "ОтМарка": "Mark",
    "ОтЛуки": "Luke",
    "ОтИоанна": "John",
    "Деяние": "Acts",
    "КРимлянам": "Romans",
    "1Коринфянам": "1Corinthians",
    "2Коринфянам": "2Corinthians",
    "КГалатам": "Galatians",
    "КЕфесянам": "Ephesians",
    "КФилиппийцам": "Philippians",
    "ККолоссянам": "Colossians",
    "1Фессалоникийцам": "1Thessalonians",
    "2Фессалоникийцам": "2Thessalonians",
    "1Тимофею": "1Timothy",
    "2Тимофею": "2Timothy",
    "КТиту": "Titus",
    "КФилимону": "Philemon",
    "КЕвреям": "Hebrews",
    "Иакова": "James",
    "1Петра": "1Peter",
    "2Петра": "2Peter",
    "1Иоанна": "1John",
    "2Иоанна": "2John",
    "3Иоанна": "3John",
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
