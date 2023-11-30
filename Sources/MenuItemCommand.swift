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
import AXEssibility

// MARK: - MenuItemCommand
struct MenuItemCommand: Entity, Hashable, DeferredDecodableContainer {
	static var cache: [String: [Self]] = [:]

	enum Mode: Int, Hashable, Codable {
		case none, shortcut, script, menu
	}
	struct Index: Hashable, Codable {
		let index: Int
		let title: String
	}
	@Property var id: EntityID<Self> = .init()
	@Property var path: [Index]
	@Property var title: String
	@Property var shortcut: String?
	@Property var isGroup: Bool

	@Property var isSelected: Bool = true
	@Property var command: String?
	@Property var mode: Mode = .none

	init() {}
	init(_: DeferredDecoder) {}

	static func commands(for application: RunningApplications.Application) -> [Self] {
		if let commands = Self.cache[application.id] {
			return commands
		}

		var commands = [Self]()
		do {
			let application = AXApplication(application.pid)
			for menuItem in try application.menuBar.menuItems {
				guard let title = menuItem.title else { continue }
				let item = configure(MenuItemCommand()) {
					$0.path = []
					$0.title = title
					$0.isGroup = menuItem.isSubMenu
				}
				commands.append(item)

				try menuItem.forEach(path: [menuItem]) { path, child in
					guard let title = child.title else { return }
					let item = configure(MenuItemCommand()) {
//						$0.path = path
						$0.title = title
						$0.isGroup = child.isSubMenu
					}
					commands.append(item)
				}
			}
		} catch {
			log(application.id, error)
			return []
		}
		Self.cache[application.id] = commands
		return commands
	}
}
