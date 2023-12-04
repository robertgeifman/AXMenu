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
	@Property var menus: [MenuGroup]?
	@Property var menuGroups: Set<MenuGroup.ID>
	@Property var commands: [Command]

	init?(_ application: RunningApplication) {
		id = application.id
		name = application.name
		menus = nil
		menuGroups = []
		commands = []
	}

	init?(_ application: NSRunningApplication) {
		guard
			let url = application.bundleURL,
			let bundle = Bundle(url: url) else { return nil }
		self.init(bundle)
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
	}
}

// MARK: - Application.Snapshot
extension Application: SnapshotCodable {
	struct Snapshot: Identifiable, Hashable, Codable {
		let id: Application.ID
		let name: String
		let menus: [MenuGroup].Snapshot?
		let menuGroups: [MenuGroup.ID]
		let commands: [Command].Snapshot
	}

	var snapshot: Snapshot {
		.init(id: id,
			name: name,
			menus: menus?.snapshot,
			menuGroups: menuGroups.map { $0 },
			commands: commands.snapshot)
	}

	init(snapshot: Snapshot) throws {
		id = snapshot.id
		name = snapshot.name
		menus = try snapshot.menus.map { try .init(snapshot:$0) }
		menuGroups = Set(snapshot.menuGroups)
		commands = try .init(snapshot: snapshot.commands)
	}
}

extension Application.Snapshot: PListCodable {
	var dictionaryRepresentation: [String: Any] {
		configure([
			"id": id,
			"name": name,
			"menuGroups":menuGroups,
			"commands": commands.dictionaryRepresentation,
		]) {
			if let menus { $0["menus"] = menus.dictionaryRepresentation }
		}
	}

	init(dictionaryRepresentation representation: Any?) throws {
		let representation = try representation as? [String:Any] ?! TypeMismatchError(representation, expected: [String:Any].self)
		id = try representation["id"] as? String ?! UnexpectedNilError()
		name = try representation["name"] as? String ?! UnexpectedNilError()
		menus = try .init(dictionaryRepresentation: representation["menus"])
		menuGroups = representation["menuGroups"] as? [Application.MenuGroup.ID] ?? []
		commands = try representation["commands"].map { try .init(dictionaryRepresentation: $0) } ?? []
	}
}