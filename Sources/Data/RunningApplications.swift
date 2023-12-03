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
import SQLite

// MARK: - RunningApplications
final class RunningApplications: ObservableObject {
	@Published var applications: [RunningApplication]

	init() {
		applications = NSWorkspace.shared.runningApplications
			.compactMap(RunningApplication.init)
			.sorted { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending }
	}

	func reload() {
		applications = NSWorkspace.shared.runningApplications
			.compactMap(RunningApplication.init)
			.sorted { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending }
	}
}

// MARK: - RunningApplication
struct RunningApplication: Hashable {
	let id: String
	let name: String
	let pid: pid_t

	init?(_ application: NSRunningApplication) {
		guard let identifier = application.bundleIdentifier,
			let url = application.bundleURL,
			let bundle = Bundle(url: url) else { return nil }

		let plist = bundle.infoDictionary ?? [:]
		if let value = plist["LSBackgroundOnly"] as? Bool, value == true { return nil }
		if let value = plist["LSUIElement"] as? Bool, value == true { return nil }
		if let value = plist["CFBundlePackageType"] as? String, value != "APPL" { return nil }
		if let value = plist["LSUIPresentationMode"] as? Int, value != 0 { return nil }

		id = identifier
		pid = application.processIdentifier
		name = plist[kCFBundleNameKey as String] as? String ?? id
	}

	func commandSelected(_ id: String) -> Binding<Bool> {
		.init {
			UserDefaults.standard.bool(forKey: id)
		} set: {
			let defaults = UserDefaults.standard
			defaults.set($0, forKey: id)
			defaults.synchronize()
		}
	}

	func groupSelected(_ id: String) -> Binding<Bool> {
		.init {
			UserDefaults.standard.bool(forKey: id)
		} set: {
			let defaults = UserDefaults.standard
			defaults.set($0, forKey: id)
//			for item in items {
//				defaults.set($0, forKey: item.id)
//			}
			defaults.synchronize()
		}
	}
}
