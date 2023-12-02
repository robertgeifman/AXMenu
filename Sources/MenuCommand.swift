//
//  MenuCommand.swift
//  SpeakableCommands
//
//  Created by Robert Geifman on 27/11/2023.
//

import Foundation
import FoundationAdditions
import SwiftUI
import SwiftUIAdditions
import AXEssibility

// MARK: - MenuCommand
struct MenuCommand: Hashable, DeferredDecodableContainer, Encodable {
	enum Mode: Int, Hashable, Codable {
		case none, shortcut, script, menu
	}
	@Property var id: String
	@Property var path: MenuItemPath
	@Property var index: Int
	@Property var title: String

	@Property var shortcut: String? = nil
	@Property var isSelected: Bool = true
	@Property var command: String? = nil
	@Property var mode: Mode = .none

	init(app: String, path: MenuItemPath, index: Int, title: String) {
		self.id = app + ":" + path.pathString + ":" + title + "\(index)"
		self.path = path
		self.index = index
		self.title = title
	}
	init(_: DeferredDecoder) {}

	func hash(into hasher: inout Hasher) {
		id.hash(into: &hasher)
	}
}
