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

// MARK: - Application.Command: DeferredContainer, Encodable
extension Application.Command: DeferredContainer, Encodable {
	init(_: DeferredDecoder) {}
}

// MARK: - Application.Command: SnapshotCodable
extension Application.Command: SnapshotCodable {
	struct Snapshot: Identifiable, Hashable, Codable {
		let id: String
		let path: Application.ItemPath.Snapshot
		let index: Int
		let title: String
		let shortcut: String?
		let command: String?
		let mode: Mode.RawValue
	}

	var snapshot: Snapshot {
		.init(id: id,
			path: path.snapshot,
			index: index,
			title: title,
			shortcut: shortcut,
			command: command,
			mode: mode.rawValue)
	}

	init(snapshot: Snapshot) throws {
		id = snapshot.id
		path = try .init(snapshot: snapshot.path)
		index = snapshot.index
		title = snapshot.title
		shortcut = snapshot.shortcut
		command = snapshot.command
		mode = .init(rawValue: snapshot.mode) ?? .none
	}
}

extension Application.Command.Snapshot: PListCodable {
	var dictionaryRepresentation: [String : Any] {
		configure([
			"id": id,
			"path": path.dictionaryRepresentation,
			"index": index,
			"title": title,
			"mode": mode
		]) { rep in
			if let shortcut { rep["shortcut"] = shortcut }
			if let command { rep["command"] = command }
		}
	}
	init(dictionaryRepresentation representation: Any?) throws {
		let representation = try representation as? [String:Any] ?! TypeMismatchError(representation, expected: [String:Any].self)
		id = try representation["id"] as? String ?! UnexpectedNilError()
		path = try .init(dictionaryRepresentation: representation["path"])
		index = try representation["index"] as? Int ?! UnexpectedNilError()
		title = try representation["title"] as? String ?! UnexpectedNilError()
		shortcut = representation["shortcut"] as? String
		command = representation["command"] as? String
		mode = representation["mode"] as? Int ?? 0
	}
}
