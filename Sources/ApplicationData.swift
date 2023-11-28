//
//  ApplicationData.swift
//  AXMenu
//
//  Created by Robert Geifman on 27/11/2023.
//

import Foundation
import FoundationAdditions
import SwiftUI
import SwiftUIAdditions

final class ApplicationData: ObservableObject {
	@Published var applications: [NSRunningApplication]

	init() {
		applications = NSWorkspace.shared.runningApplications.filter {
			$0.bundleIdentifier != nil
		}.mapKeysToValues { ($0.bundleIdentifier!, $0) }.values
		.sorted { $0.bundleIdentifier! < $1.bundleIdentifier! }
	}

    @discardableResult
    static func isAccessibilityEnabled(withPrompt: Bool) -> Bool {
        let checkOptionPromptKey = kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String
        let options = [checkOptionPromptKey: withPrompt] as CFDictionary
        return AXIsProcessTrustedWithOptions(options)
    }
}
