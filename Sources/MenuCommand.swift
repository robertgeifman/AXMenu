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
struct MenuCommand: Identifiable {
	enum Mode: Int, Hashable, Codable {
		case none, shortcut, script, menu
	}
	@Property var id: String
	@Property var path: MenuItemPath
	@Property var index: Int
	@Property var title: String

	@Property var isSelected: Bool = false
	@Property var shortcut: String? = nil
	@Property var command: String? = nil
	@Property var mode: Mode = .none

	init(app: String, path: MenuItemPath, index: Int, title: String) {
		self.id = app + ":" + path.pathString + ":" + title + "\(index)"
		self.path = path
		self.index = index
		self.title = title
	}
}

extension MenuCommand: Hashable {
	func hash(into hasher: inout Hasher) {
		id.hash(into: &hasher)
	}
}

extension MenuCommand: DeferredDecodableContainer, Encodable {
	init(_: DeferredDecoder) {}
}

extension MenuCommand {
	var isSelected_: Binding<Bool> {
		.init {
			isSelected
		} set: {
			isSelected = $0
		}
	}
	var isCommandSelected: Binding<Bool> {
		.init {
			UserDefaults.standard.bool(forKey: id)
		} set: {
			let defaults = UserDefaults.standard
			defaults.set($0, forKey: id)
			defaults.synchronize()
		}
	}
}
