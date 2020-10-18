//
//  PathView.swift
//  SBL Verses
//
//  Created by Denis Dobanda on 11.10.20.
//

import SwiftUI

struct PathView: View {
    
    @Binding var url: URL?
    
    var body: some View {
        HStack {
            Text(url.flatMap { "Selected file: " + $0.path } ?? "Please select a file").font(.subheadline)
            Button(url == nil ? "Select a file" : "Select another file") {
                let panel = NSOpenPanel()
                panel.allowsMultipleSelection = false
                panel.canChooseDirectories = false
                if panel.runModal() == .OK {
                    self.url = panel.url
                }
            }
        }
    }
}

struct PathView_Previews: PreviewProvider {
    static var previews: some View {
        PathView(url: .constant(nil))
    }
}
