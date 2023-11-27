//
//  All_About_TypeApp.swift
//  All About Type
//
//  Created by Robert Geifman on 18/06/2022.
//

import Foundation

// import FoundationAdditions
import SwiftUI
import Cocoa

// import SwiftUIAdditions
import UniformTypeIdentifiers
import AXEssibility

// MARK: - AppDelegate
class AppDelegate: NSObject, NSApplicationDelegate {
    @discardableResult
    func isAccessibilityEnabled(withPrompt: Bool) -> Bool {
        let checkOptionPromptKey = kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String
        let opts = [checkOptionPromptKey: withPrompt] as CFDictionary
        return AXIsProcessTrustedWithOptions(opts)
    }
    func showAccessibilityAlert() -> Bool {
        let alert = NSAlert()
        alert.messageText = "Please allow Accessibility"
        alert.informativeText = "in Privacy & Security Preferences in System Preferences"
		alert.addButton(withTitle: "Open System Preferences")
		alert.addButton(withTitle: "Cancel")
        NSApp.activate(ignoringOtherApps: true)

        if alert.runModal() == NSApplication.ModalResponse.continue {
            guard !openAccessibilitySettingWindow() else { return false }
			isAccessibilityEnabled(withPrompt: true)
			return true
        }
        return false
    }
    func openAccessibilitySettingWindow() -> Bool {
        guard let url = URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility") else {
        	return false
		}
        return NSWorkspace.shared.open(url)
    }

	func applicationDidFinishLaunching(_ notification: Notification) {
		// Check that we have permission
		var isEnabled = isAccessibilityEnabled(withPrompt: true)
		while !isEnabled {
			guard showAccessibilityAlert() else {
				return NSApp.terminate(self)
			}
			isEnabled = isAccessibilityEnabled(withPrompt: false)
		}

		if let app = AXApplication("com.apple.dt.Xcode") {
			NSLog("xcode: \(app)")
			do {
				try app.menuBar.menuItems.forEach {
					try $0.forEach {
						print($0.title)
					}
				}
			} catch {
				NSLog("error caught trying to set title of window: \(error)")
			}
		}
		NSApp.terminate(self)
	}
}
