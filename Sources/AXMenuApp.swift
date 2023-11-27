//
//  AXMenuApp.swift
//  AXMenu
//
//  Created by Robert Geifman on 26/11/2023.
//

import SwiftUI

@main
struct AXMenuApp: App {
	@NSApplicationDelegateAdaptor
	private var appDelegate: AppDelegate
	
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
