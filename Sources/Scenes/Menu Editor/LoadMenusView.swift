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

// MARK: - LoadMenusView
struct LoadMenusView: View {
	var application: Application
	@State var lastError: Error? = nil
	@State var accessibilityEnabled = AXIsProcessTrusted()

	var body: some View {
		if accessibilityEnabled {
			Button {
			} label: {
				Text("Load Application Menus")
			}
			.alert(error: $lastError, dismissButton: "OK") { lastError = nil }
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
	}

	@discardableResult
	func isAccessibilityEnabled(withPrompt: Bool) -> Bool {
		let checkOptionPromptKey = kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String
		let options = [checkOptionPromptKey: withPrompt] as CFDictionary
		return AXIsProcessTrustedWithOptions(options)
	}
}
