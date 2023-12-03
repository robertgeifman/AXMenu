//
//  Command.swift
//  SpeakableCommands
//
//  Created by Robert Geifman on 27/11/2023.
//

import Foundation
import FoundationAdditions
import SwiftUI
import SwiftUIAdditions
import AXEssibility

// MARK: - Application.Command
extension Application {
	struct Command: Identifiable {
		enum Mode: Int, Hashable, Codable {
			case none = 0, shortcut, script, menu
		}
		@Property var id: String
		@Property var path: ItemPath
		@Property var index: Int
		@Property var title: String

		@Property var shortcut: String? = nil
		@Property var command: String? = nil
		@Property var mode: Mode = .none

		init(app: String, path: ItemPath, index: Int, title: String) {
			id = app + "." + path.id + "." + title + "@\(index)"
			self.path = path
			self.index = index
			self.title = title
		}
	}
}

// MARK: - Application.Command: Hashable
extension Application.Command: Hashable {
	func hash(into hasher: inout Hasher) {
		id.hash(into: &hasher)
	}
}

// MARK: - Application.Command: DeferredDecodableContainer, Encodable
extension Application.Command: DeferredDecodableContainer, Encodable {
	init(_: DeferredDecoder) {}
}

extension Application.Command {
	var isSelected: Binding<Bool> {
		.init {
			UserDefaults.standard.bool(forKey: id)
		} set: {
			let defaults = UserDefaults.standard
			defaults.set($0, forKey: id)
			defaults.synchronize()
		}
	}
}
