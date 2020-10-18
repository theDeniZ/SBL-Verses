//
//  CollapsedSettingsView.swift
//  SBL Verses
//
//  Created by Denis Dobanda on 18.10.20.
//

import SwiftUI

struct CollapsedSettingsView: View {
    
    @Binding var settings: VerseSettings
    
    @State private var currentSettings: AvailableSettings = .german
    
    var body: some View {
        VStack {
            Picker("Template to use:", selection: $currentSettings.onChange(currentPresetChanged(to:))) {
                Text("English").tag(AvailableSettings.english)
                Text("German").tag(AvailableSettings.german)
                Text("Russian").tag(AvailableSettings.russian)
            }
                .pickerStyle(SegmentedPickerStyle())
        }
    }
    
    private func currentPresetChanged(to preset: AvailableSettings) {
        settings.load(preset)
    }
}

struct CollapsedSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        CollapsedSettingsView(settings: .constant(VerseSettings()))
    }
}
