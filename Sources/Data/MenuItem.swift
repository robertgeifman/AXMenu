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

// MARK: - Application.MenuItem
extension Application {
	struct MenuItem: Identifiable {
		@Property var id: String
		@Property var path: ItemPath
		@Property var index: Int
		@Property var title: String
		@Property var shortcut: String?

		init(app: String, path: ItemPath, index: Int, title: String, shortcut: String?) {
			id = app + "." + path.id + "." + title + "@\(index)"
			self.path = path
			self.index = index
			self.title = title
			self.shortcut = shortcut
		}
	}
}

// MARK: - Application.MenuItem: SnapshotCodable
extension Application.MenuItem: SnapshotCodable {
	struct Snapshot: Identifiable, Hashable, Codable {
		let id: String
		let path: Application.ItemPath
		let index: Int
		let title: String
		let shortcut: String?
	}

	var snapshot: Snapshot {
		.init(id: id,
			path: path,
			index: index,
			title: title,
			shortcut: shortcut)
	}
	
	init(snapshot: Snapshot) throws {
		id = snapshot.id
		path = snapshot.path
		index = snapshot.index
		title = snapshot.title
		shortcut = snapshot.shortcut
	}
}

// MARK: - Application.MenuItem: Hashable
extension Application.MenuItem: Hashable {
	func hash(into hasher: inout Hasher) {
		id.hash(into: &hasher)
	}
}

// MARK: - Application.MenuItem: DeferredContainer, Encodable
extension Application.MenuItem: DeferredContainer, Encodable {
	init(_: DeferredDecoder) {}
}
