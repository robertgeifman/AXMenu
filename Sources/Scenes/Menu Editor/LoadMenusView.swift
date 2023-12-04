//
//  Created by Robert Geifman on 27/11/2023.
//  
//
//	"Telling a programmer there’s already a library to do X
// 		is like telling a songwriter there’s already a song about love.”
//																		 				- Pete Cordell
//

import Foundation
import FoundationAdditions
import SwiftUI
import SwiftUIAdditions
import AXEssibility

// MARK: - LoadMenusView
struct LoadMenusView: View {
	@EnvironmentObject var scene: SceneState
	var application: Application
	@State var lastError: Error? = nil
	@State var accessibilityEnabled = AXIsProcessTrusted()

	var workspace: NSWorkspace { .shared }
	var body: some View {
		content
		.alert(error: $lastError, dismissButton: "OK") { lastError = nil }
	}
	
	@ViewBuilder var content: some View {
		if accessibilityEnabled {
			Button {
				perform(error: $lastError) {
					try loadApplicationMenus()
				}
			} label: {
				Text("Load Application Menus")
			}
		} else {
			Button {
				isAccessibilityEnabled(withPrompt: true)
			} label: {
				Text("Request Accessibility Permissions")
			}
			.onReceive(NotificationCenter.default.publisher(for: NSApplication.didBecomeActiveNotification)) { _ in
				accessibilityEnabled = AXIsProcessTrusted()
			}
		}
	}

	func loadApplicationMenus() throws {
		guard let url = workspace.urlForApplication(withBundleIdentifier: application.id) else {
			throw UnexpectedNilError("Error launching \(application.name)")
		}
		Task {
			let app = try await workspace.openApplication(at: url, configuration: configure(.init()) {
				$0.hides = true
				$0.activates = false
				$0.addsToRecentItems = false
				$0.allowsRunningApplicationSubstitution = false
			})
			guard let runningApp = RunningApplication(app) else {
				throw UnexpectedNilError("Error launching \(application.name)")
			}
			let menus = try AXMenuBar.menuBar(for: runningApp)
			scene.setMenus(menus, forApplication: application.id)
			application.menus = menus
		}
	}

	@discardableResult
	func isAccessibilityEnabled(withPrompt: Bool) -> Bool {
		let checkOptionPromptKey = kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String
		let options = [checkOptionPromptKey: withPrompt] as CFDictionary
		return AXIsProcessTrustedWithOptions(options)
	}
}
