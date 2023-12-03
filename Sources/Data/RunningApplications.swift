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
