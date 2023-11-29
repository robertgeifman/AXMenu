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

// MARK: - MenuItemCommand
struct MenuItemCommand: Entity, Hashable, DeferredDecodableContainer {
	enum Mode: Int, Hashable, Codable {
		case none, shortcut, script, menu
	}
	struct Index: Hashable, Codable {
		let index: Int
		let title: String
	}
	@Property var id: EntityID<Self> = .init()
	@Property var path: [Index]?
	@Property var title: [String]?
	@Property var shortcut: String?
	@Property var isGroup: Bool

	@Property var isSelcted: Bool = true
	@Property var command: String?
	@Property var mode: Mode = .none

	init(_: DeferredDecoder) {}
}
