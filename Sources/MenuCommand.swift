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
	@Property var id: UUID = .init()
	@Property var path: MenuItemPath
	@Property var index: Int
	@Property var title: String

	@Property var shortcut: String?
	@Property var isSelected: Bool = true
	@Property var command: String?
	@Property var mode: Mode = .none

	init(path: MenuItemPath, index: Int, title: String) {
		self.path = path
		self.index = index
		self.title = title
	}
	init(_: DeferredDecoder) {}
}
