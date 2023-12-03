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
struct Application: Identifiable {
	@Property var id: String
	@Property var name: String
//	@Property var pid: pid_t?
	@Property var menus: [MenuGroup]?
	@Property var commands: [Command.ID]
	@Property var configuration: [String: Command]

	init?(_ application: RunningApplication) {
		id = application.id
		name = application.name
		menus = nil
		commands = []
		configuration = [:]
	}
	init?(_ bundle: Bundle) {
		guard let identifier = bundle.bundleIdentifier,
			let plist = bundle.infoDictionary else { return nil }

		if let value = plist["LSBackgroundOnly"] as? Bool, value { return nil }
		if let value = plist["LSUIElement"] as? Bool, value { return nil }
		if let value = plist["CFBundlePackageType"] as? String, value != "APPL" { return nil }
		if let value = plist["LSUIPresentationMode"] as? Int, value != 0 { return nil }

		id = identifier
		name = plist[kCFBundleNameKey as String] as? String ?? id
		menus = nil
		commands = []
		configuration = [:]
	}
	init?(_ application: NSRunningApplication) {
		guard let identifier = application.bundleIdentifier,
			let url = application.bundleURL,
			let bundle = Bundle(url: url),
			let plist = bundle.infoDictionary  else { return nil }

		if let value = plist["LSBackgroundOnly"] as? Bool, value { return nil }
		if let value = plist["LSUIElement"] as? Bool, value { return nil }
		if let value = plist["CFBundlePackageType"] as? String, value != "APPL" { return nil }
		if let value = plist["LSUIPresentationMode"] as? Int, value != 0 { return nil }

		id = identifier
//		pid = application.processIdentifier
		name = plist[kCFBundleNameKey as String] as? String ?? id
		menus = nil
		commands = []
		configuration = [:]
	}
}

// MARK: - Application.Snapshot
extension Application: SnapshotCodable {
	struct Snapshot: Identifiable, Hashable, Codable {
		let id: Application.ID
		let menus: [MenuGroup]?
		let commands: [Command.ID]
		let configuration: [Command.ID: Command]
	}

	var snapshot: Snapshot {
		.init(id: id,
			menus: menus,
			commands: commands,
			configuration: configuration)
	}

	init(snapshot: Snapshot) throws {
		id = snapshot.id
		menus = snapshot.menus
		commands = snapshot.commands
		configuration = snapshot.configuration
	}
}

extension Application.Snapshot {
	var dictionaryRepresentation: [String: Any] {
		[
			"id": id,
			"commands": commands,
			"configuration": configuration,
			"menus": menus,
		]
	}

	init(dictionaryRepresentation representation: [String: Any]) throws {
		id = try representation["id"] as? String ?! UnexpectedNilError()
//		<#var#> = representation["<#key#>"] as? Double ?? 0
//		<#var#> = representation["<#key#>"] as? String ?? ""
//		<#var#> = representation["<#key#>"] as? Bool ?? false
//		<#var#> = (representation["<#key#>"] as? String)?.components(separatedBy: ", ") ?? []
		menus = representation["menus"] as? [Application.MenuGroup] ?? []
		commands = representation["commands"] as? [String] ?? []
		configuration = representation["configuration"] as? [String: Application.Command] ?? [:]
	}

	init(from defaults: UserDefaults, key: String) throws {
		try self.init(dictionaryRepresentation: defaults.dictionary(forKey: key) ?? [:])
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
	init(from defaults: UserDefaults) throws {
		if let panels = defaults.array(forKey: "panels") as? [[String: Any]] {
			self = try panels.map { try .init(dictionaryRepresentation: $0) }
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
