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

// MARK: - AppMenuView
struct AppMenuView: View {
	var body: some View {
		contents
	}
	@MainActor @ViewBuilder var contents: some View {
		if isAccessibilityEnabled(withPrompt: false) {
		} else {
		}
	}

    @discardableResult
    func isAccessibilityEnabled(withPrompt: Bool) -> Bool {
        let checkOptionPromptKey = kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String
        let options = [checkOptionPromptKey: withPrompt] as CFDictionary
        return AXIsProcessTrustedWithOptions(options)
    }
    func showAccessibilityAlert() -> Bool {
        let alert = NSAlert()
        alert.messageText = "AXMenu Needs Accessibility Permissions"
        alert.informativeText = "Please grant access in Privacy & Security Preferences in System Preferences"
		alert.addButton(withTitle: "Continue")
		alert.addButton(withTitle: "Cancel")
        NSApp.activate(ignoringOtherApps: true)

        if alert.runModal() == NSApplication.ModalResponse.alertFirstButtonReturn {
			isAccessibilityEnabled(withPrompt: true)
			return true
        }
        return false
    }
}
