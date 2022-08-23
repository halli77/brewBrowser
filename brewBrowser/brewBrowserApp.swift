//
//  brewBrowserApp.swift
//  brewBrowser
//
//  Created by Michael Hallmann on 19.08.22.
//

import SwiftUI

@main
struct brewBrowserApp: App {
    @StateObject private var formulaVm = BrewFormulaViewModel()
    @StateObject private var caskVm = BrewCaskViewModel()
    @StateObject private var statVm = BrewStatViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(formulaVm)
                .environmentObject(caskVm)
                .environmentObject(statVm)
        }
    }
}
