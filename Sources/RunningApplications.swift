//
//  RunningApplications.swift
//  AXMenu
//
//  Created by Robert Geifman on 27/11/2023.
//

import Foundation
import FoundationAdditions
import SwiftUI
import SwiftUIAdditions

final class RunningApplications: ObservableObject {
	struct Application: Hashable {
		let id: String
//		let plist: [String: Any]
		let name: String
		let pid: pid_t
//		let runningApplication: NSRunningApplication
	}
	@Published var applications: [Application]

	init() {
		applications = NSWorkspace.shared.runningApplications
		.compactMap(Application.init)
		.sorted { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending }
	}

    @discardableResult
    static func isAccessibilityEnabled(withPrompt: Bool) -> Bool {
        let checkOptionPromptKey = kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String
        let options = [checkOptionPromptKey: withPrompt] as CFDictionary
        return AXIsProcessTrustedWithOptions(options)
    }
}

extension RunningApplications.Application {
	init?(_ application: NSRunningApplication) {
		guard
			let identifier = application.bundleIdentifier,
			let url = application.bundleURL,
			let bundle = Bundle(url: url) else { return nil }

		let plist = bundle.infoDictionary ?? [:]
		if let value = plist["LSBackgroundOnly"] as? Bool, value  == true { return nil }
		if let value = plist["LSUIElement"] as? Bool, value == true { return nil }
		if let value = plist["CFBundlePackageType"] as? String, value != "APPL" { return nil }
		if let value = plist["LSUIPresentationMode"] as? Int, value != 0 { return nil }

		id = identifier
		pid = application.processIdentifier
		name = plist[kCFBundleNameKey as String] as? String ?? id
	}
}
