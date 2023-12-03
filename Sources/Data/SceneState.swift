//
//  Created by Robert Geifman on 19/08/2022.
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
import Combine

// MARK: - SceneState
@MainActor
final class SceneState: ObservableObject {
	@Published var applications: [Application]
	var cancellables: Set<AnyCancellable> = []

	@MainActor
	convenience init() {
		do {
			let snapshot = Snapshot(from: UserDefaults.standard, key: "applications")
			try self.init(snapshot: snapshot)
		} catch {
			log("error loading StateScene.Snapshot", error)
			self.init(_applications: [])
		}
		NotificationCenter.default.publisher(for: NSApplication.willTerminateNotification)
			.sink { _ in self.snapshot.store(in: UserDefaults.standard, key: "applications") }
			.store(in: &cancellables)
		NotificationCenter.default.publisher(for: NSApplication.willResignActiveNotification)
			.sink { _ in self.snapshot.store(in: UserDefaults.standard, key: "applications") }
			.store(in: &cancellables)
	}

	@MainActor
	init(_applications applications: [Application]) {
		_applications = .init(wrappedValue: applications)
	}
	@MainActor
	init(snapshot: Snapshot) throws {
		let applications: [Application] = try snapshot.applications.map { try .init(snapshot: $0) }
		_applications = .init(wrappedValue: applications)
	}
}

// MARK: - SceneState.Snapshot
extension SceneState: SnapshotCodable {
	struct Snapshot: Codable {
		let applications: [Application.Snapshot]
	}

	var snapshot: Snapshot {
		.init(applications: applications.snapshot)
	}
}

extension SceneState.Snapshot {
	var dictionaryRepresentation: [String: Any] {
		[
			"applications": applications,
//			"stacks": stacks.map { $0 }.joined(separator: ", "),
		]
	}

	init(dictionaryRepresentation representation: [String: Any]) {
//		<#var#> = representation["<#key#>"] as? Double ?? 0
//		<#var#> = representation["<#key#>"] as? String ?? ""
//		<#var#> = representation["<#key#>"] as? Bool ?? false
//		<#var#> = (representation["<#key#>"] as? String)?.components(separatedBy: ", ") ?? []
		applications = representation["applications"] as? [Application.Snapshot] ?? []
	}

	init(from defaults: UserDefaults, key: String) {
		self.init(dictionaryRepresentation: defaults.dictionary(forKey: key) ?? [:])
	}

	func store(in defaults: UserDefaults, key: String) {
		defaults.set(dictionaryRepresentation, forKey: key)
	}
	func register(defaultValues values: inout [String: Any], key: String) {
		values[key] = dictionaryRepresentation
	}
}
