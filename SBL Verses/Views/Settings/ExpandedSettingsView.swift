//
//  ExpandedSettingsView.swift
//  SBL Verses
//
//  Created by Denis Dobanda on 18.10.20.
//

import SwiftUI

struct ExpandedSettingsView: View {
    
    @ObservedObject var settings: VerseSettings
        
    var body: some View {
        VStack {
            HStack {
                BibleVersionSettingsView(bibleSettings: $settings.bibleVersion)
                MappingSettingsView(mapping: $settings.mappingVersion)
            }
            RegexSettingsView(settings: settings)
            VerseFormattingView(settings: settings)
        }
    }
}

struct ExpandedSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandedSettingsView(settings: VerseSettings())
    }
}
