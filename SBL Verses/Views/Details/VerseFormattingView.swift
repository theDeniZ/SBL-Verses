//
//  VerseFormattingView.swift
//  SBL Verses
//
//  Created by Denis Dobanda on 11.10.20.
//

import SwiftUI

struct VerseFormattingView: View {
    
    @ObservedObject var settings: VerseSettings
    
    var body: some View {
        VStack {
            Text("Verse Formatting")
            HStack {
                Text("Container Prefix")
                TextField("Container Prefix", text: $settings.verseFormattingSettings.containerPrefix)
            }
            HStack {
                Text("Container Suffix")
                TextField("Container Suffix", text: $settings.verseFormattingSettings.containerSuffix)
            }
            HStack {
                Text("Verse Prefix")
                TextField("Verse Prefix", text: $settings.verseFormattingSettings.versePrefix)
            }
            HStack {
                Text("Verse Suffix")
                TextField("Verse Suffix", text: $settings.verseFormattingSettings.verseSuffix)
            }
            HStack {
                Text("Verse Location Predicate (contains '%@')")
                TextField("Verse Location Predicate (contains '%@')", text: $settings.verseFormattingSettings.verseLocationPredicate, onCommit:  {
                    if !settings.verseFormattingSettings.verseLocationPredicate.contains("%@") {
                        settings.verseFormattingSettings.verseLocationPredicate = VerseSettings().verseFormattingSettings.verseLocationPredicate
                    }
                })
            }
        }
        .padding()
    }
    
}

struct VerseFormattingView_Previews: PreviewProvider {
    static var previews: some View {
        VerseFormattingView(settings: VerseSettings())
    }
}
