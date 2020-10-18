//
//  MappingSettingsView.swift
//  SBL Verses
//
//  Created by Denis Dobanda on 11.10.20.
//

import SwiftUI

struct MappingSettingsView: View {
    
    @Binding var mapping: MappingVersion
    
    var body: some View {
        VStack {
            Picker("File language", selection: $mapping) {
                Text(MappingVersion.noMapping.displayTitle).tag(MappingVersion.noMapping)
                Text(MappingVersion.german.displayTitle).tag(MappingVersion.german)
                Text(MappingVersion.russian.displayTitle).tag(MappingVersion.russian)
//                Text(MappingVersion.ukrainian.displayTitle).tag(MappingVersion.ukrainian)
            }
        }
        .padding()
    }
}

struct MappingSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        MappingSettingsView(mapping: .constant(.german))
    }
}
