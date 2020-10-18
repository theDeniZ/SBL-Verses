//
//  BibleVersionSettingsView.swift
//  SBL Verses
//
//  Created by Denis Dobanda on 11.10.20.
//

import SwiftUI

struct BibleVersionSettingsView: View {
    
    @Binding var bibleSettings: BibleVersion
    
    var body: some View {
        VStack {
            Picker("Bible", selection: $bibleSettings) {
                Text(BibleVersion.kjv.displayTitle).tag(BibleVersion.kjv)
                Text(BibleVersion.luther1912.displayTitle).tag(BibleVersion.luther1912)
                Text(BibleVersion.synodal.displayTitle).tag(BibleVersion.synodal)
//                Text(BibleVersion.ukranian.displayTitle).tag(BibleVersion.ukranian)
            }
        }
        .padding()
    }
}

struct BibleVersionSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BibleVersionSettingsView(bibleSettings: .constant(.kjv))
            BibleVersionSettingsView(bibleSettings: .constant(.luther1912))
        }
    }
}
