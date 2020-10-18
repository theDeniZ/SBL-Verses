//
//  ContentView.swift
//  SBL Verses
//
//  Created by Denis Dobanda on 11.10.20.
//

import SwiftUI

struct MainView: View {
    
    @State private var originalURL: URL?
    @State private var settings: VerseSettings = {
        let settings = VerseSettings()
        settings.load(.german)
        return settings
    }()
    
    @State private var isProcessing = false
    
    @State private var verseManager: VerseManager?
    
    private var isDetailsDisabled: Bool {
        verseManager == nil || isProcessing
    }
    
    private let queue = DispatchQueue.global(qos: .userInitiated)
    
    @State private var statusString: String?
    
    @State private var hasFinished = false
    
    var body: some View {
        
        VStack {
            Text("To start please select a file. Adjust the settings as needed. Process at the end. Don't forget to save")
                .font(.headline)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
            Divider()
            Spacer()
            
            Group {
            
                PathView(url: $originalURL.onChange(startEngine)).disabled(isProcessing)

                SettingsView(settings: $settings)
                    .disabled(isDetailsDisabled)
                
                Button("Process!") {
                    startProcessing()
                }
                    .font(.headline)
                    .padding()
                    .disabled(isDetailsDisabled)

                originalURL.flatMap { SaveView(saveAction: saveAction, originalURL: $0).disabled(!hasFinished) }
                statusString.flatMap { Text($0) }
                
            }
            
            Spacer()
            Divider()
            
            HStack {
                Text("if you have bugs or questions feel free to contact me at").font(.footnote)
                Button("the.DeniZ@icloud.com") {
                    NSWorkspace.shared.open(URL(string: "mailto:the.DeniZ@icloud.com")!)
                }
                .font(.footnote)
            }
        }
            .padding()
    }
    
    private func startEngine(_ url: URL?) {
        guard let existingUrl = url else { return }
        guard let string = (try? Data(contentsOf: existingUrl))?.stringValue else {
            originalURL = nil
            return
        }
        verseManager = VerseManager(originalString: string)
    }
    
    private func startProcessing() {
        guard verseManager != nil else { return }
        isProcessing = true
        statusString = nil
        queue.async {
            do {
                try verseManager?.replace(settings: settings, progress: updateProgress(to:overall:))
                stopProcessing(error: nil)
            } catch VerseManager.VerseManagerError.wrongRegex {
                stopProcessing(error: "Wrong regex detected. Processing aborted. Check the Regex")
            } catch {
                stopProcessing(error: "Unknown error is encounted")
            }
        }
    }
    
    private func updateProgress(to number: Int, overall: Int) {
        DispatchQueue.main.async {
            statusString = "Processing \(number) of \(overall)"
        }
    }
    
    private func stopProcessing(error: String? = nil) {
        DispatchQueue.main.async {
            isProcessing = false
            statusString = error
            if error == nil {
                hasFinished = true
                statusString = "Success!"
            }
        }
    }
    
    private func saveAction(url: URL?) {
        guard let vm = verseManager, let urlToWrite = url ?? originalURL else { resetProgress(); return }
        if vm.write(to: urlToWrite) {
            resetProgress()
        } else {
            statusString = "Error saving file! Try other one"
        }
    }
    
    private func resetProgress() {
        statusString = nil
        hasFinished = false
        originalURL = nil
        verseManager = nil
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
