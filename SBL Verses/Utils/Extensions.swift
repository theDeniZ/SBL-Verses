//
//  Extensions.swift
//  SBL Verses
//
//  Created by Denis Dobanda on 11.10.20.
//

import SwiftUI
import Regex

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        return Binding(
            get: { self.wrappedValue },
            set: { selection in
                self.wrappedValue = selection
                handler(selection)
            })
    }
}

extension Data {
    var stringValue: String? {
        String(data: self, encoding: .utf8)
    }
}

extension Regex {
    func allMatches(in string: String) -> [String] {
        let iterator = self.findAll(in: string).makeIterator()
        var matches = [String]()
        while let match = iterator.next() {
            matches.append(match.matched)
        }
        return matches
    }
}
