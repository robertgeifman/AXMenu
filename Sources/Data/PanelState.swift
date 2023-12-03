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

// MARK: - Application
@MainActor
final class Application: ObservableObject, Identifiable, SnapshotCodable {
	nonisolated let id: UUID
	@Published var commands: [Command.ID] = [] {
		willSet { objectWillChange.send() }
		didSet { objectWillChange.send() }
	}
	@Published var configuration: [String: Command] = [:] {
		willSet { objectWillChange.send() }
		didSet { objectWillChange.send() }
	}

	nonisolated init() {
		id = Application.ID()
	}
	@MainActor
	init(snapshot: Snapshot) throws {
		id = snapshot.id
		commands = snapshot.commands
		configuration = snapshot.configuration
	}
}

// MARK: - Application.Snapshot
extension Application {
	struct Snapshot: Identifiable, Hashable, Codable {
		let id: Application.ID
		let commands: [Command.ID]
		let configuration: [Command.ID: Command]
	}

	@MainActor var snapshot: Snapshot {
		.init(id: id,
			commands: commands,
			configuration: configuration)
	}
}

extension Application.Snapshot {
	var dictionaryRepresentation: [String: Any] {
		[
			"id": id.uuidString,
//			"stacks": stacks.map { $0 }.joined(separator: ", "),
			"selectedTags": commands,
		]
	}

	init(dictionaryRepresentation representation: [String: Any]) {
		id = (representation["id"] as? String)
			.map { UUID(uuidString: $0) ?? UUID() } ?? UUID()
//		<#var#> = representation["<#key#>"] as? Double ?? 0
//		<#var#> = representation["<#key#>"] as? String ?? ""
//		<#var#> = representation["<#key#>"] as? Bool ?? false
//		<#var#> = (representation["<#key#>"] as? String)?.components(separatedBy: ", ") ?? []
		commands = representation["commands"] as? [String] ?? []
		configuration = representation["configuration"] as? [String: Application.Command] ?? [:]
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

// MARK: - Array<Application.Snapshot>
extension Array where Element == Application.Snapshot {
	init(from defaults: UserDefaults) {
		if let panels = defaults.array(forKey: "panels") as? [[String: Any]] {
			self = panels.map { .init(dictionaryRepresentation: $0) }
		} else {
			self = []
		}
	}

	func store(in defaults: UserDefaults) {
		let panels = map(\.dictionaryRepresentation)
		defaults.set(panels, forKey: "panels")
	}
	func register(defaultValues values: inout [String: Any]) {
		values["panels"] = map(\.dictionaryRepresentation)
	}
}
