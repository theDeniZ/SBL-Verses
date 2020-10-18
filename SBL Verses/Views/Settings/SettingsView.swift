//
//  SettingsView.swift
//  SBL Verses
//
//  Created by Denis Dobanda on 18.10.20.
//

import SwiftUI
import Combine

struct SettingsView: View {
    
    @Binding var settings: VerseSettings
    
    @State private var isExpanded = false
    
    var body: some View {
        VStack {
            CollapsedSettingsView(settings: $settings)
            Button(isExpanded ? "Hide details" : "Show details") {
                isExpanded.toggle()
            }
            if isExpanded {
                ExpandedSettingsView(settings: $settings.wrappedValue)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(settings: .constant(VerseSettings()))
    }
}
