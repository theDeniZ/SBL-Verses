//
//  SaveView.swift
//  SBL Verses
//
//  Created by Denis Dobanda on 11.10.20.
//

import SwiftUI

struct SaveView: View {
    
    let saveAction: (URL?) -> Void
    let logsAction: () -> Void
    let originalURL: URL
    
    var body: some View {
        HStack {
//            Button("Save as new file") {
//                let panel = NSSavePanel()
//                panel.nameFieldLabel = "File with Verses"
//                panel.nameFieldStringValue = "SBL with verses.html"
//                panel.canCreateDirectories = true
//                panel.directoryURL = originalURL.deletingLastPathComponent()
//                if panel.runModal() == .OK, let url = panel.url {
//                    saveAction(url)
//                }
//            }
            Button("Replace original file") {
                saveAction(nil)
            }
                .font(.headline)
            Button("Copy logs") {
                logsAction()
            }
                .font(.subheadline)
        }
    }
}

struct SaveView_Previews: PreviewProvider {
    static var previews: some View {
        SaveView(saveAction: { _ in return }, logsAction: {}, originalURL: URL(fileURLWithPath: "/"))
    }
}
