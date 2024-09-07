//
//  ProjectMamApp.swift
//  ProjectMam
//
//  Created by SAMU on 29/08/24.
//

import SwiftUI

@main
struct ProjectMamApp: App {
    
    @StateObject private var languageManager = LanguageManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(languageManager) // Pasamos el LanguageManager a toda la app
                        
        }
    }
}
