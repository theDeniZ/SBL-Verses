//
//  RegexSettingsView.swift
//  SBL Verses
//
//  Created by Denis Dobanda on 11.10.20.
//

import SwiftUI

struct RegexSettingsView: View {
    
    @ObservedObject var settings: VerseSettings
//
//    @State private var questions: String
//    @State private var verse: String
//    @State private var book: String
//
//    init(regex: Binding<RegexSettings>) {
//        self._regex = regex
//        self._questions = State<String>(wrappedValue: regex.wrappedValue.questionsRegex)
//        self._verse = State<String>(wrappedValue: regex.wrappedValue.versesRegex)
//        self._book = State<String>(wrappedValue: regex.wrappedValue.bookRegex)
//        print(self.questions)
//    }
    
    var body: some View {
        VStack {
            Text("Regex Settings")
            HStack {
                Text("Questions Regex")
                TextField("Questions Regex", text: $settings.regexSettings.questionsRegex)
            }
            HStack {
                Text("Verses Regex")
                TextField("Verses Regex", text: $settings.regexSettings.versesRegex)
            }
            HStack {
                Text("Book Regex")
                TextField("Book Regex", text: $settings.regexSettings.bookRegex)
            }
        }
        .padding()
    }
}

struct RegexSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        RegexSettingsView(settings: VerseSettings())
    }
}
