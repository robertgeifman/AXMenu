//
//  Application.swift
//  SpeakableCommands
//
//  Created by Robert Geifman on 26/11/2023.
//

import Foundation
// import FoundationAdditions
import SwiftUI
// import SwiftUIAdditions
import Cocoa

// MARK: - SpeakableCommandsApp
@main struct SpeakableCommandsApp: App {
	@NSApplicationDelegateAdaptor private var appDelegate: AppDelegate
	var body: some Scene {
		ApplicationScene()
	}
}

// MARK: - AppDelegate
class AppDelegate: NSObject, NSApplicationDelegate {
	func applicationDidFinishLaunching(_ notification: Notification) {}
}
