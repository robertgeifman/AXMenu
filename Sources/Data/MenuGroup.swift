//
//  Created by Robert Geifman on 30/11/2023.
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

// MARK: - Application.MenuGroup
extension Application {
	struct MenuGroup: Hashable, Identifiable {
		@Property var id: String
		@Property var path: ItemPath
		@Property var index: Int
		@Property var title: String
		@Property var items: [Application.MenuItem]

		init(app: String, path: ItemPath, index: Int, title: String, items: [Application.MenuItem] = []) {
			id = app + "." + path.id + "@\(index)"
			self.path = path
			self.index = index
			self.title = title
		}
	}
}

// MARK: - Application.MenuGroup: DeferredContainer, Encodable
extension Application.MenuGroup: DeferredContainer, Encodable {
	init(_: DeferredDecoder) {}
}

// MARK: - Application.MenuGroup: RandomAccessCollection
extension Application.MenuGroup: RandomAccessCollection {
	var startIndex: Int { items.startIndex }
	var endIndex: Int { items.endIndex }
	func appending(_ item: Application.MenuItem) -> Self {
		let result = self
		result.items.append(item)
		return result
	}
	subscript(position: Int) -> Application.MenuItem { items[position] }
}

// MARK: - Application.MenuGroup: SnapshotCodable
extension Application.MenuGroup: SnapshotCodable {
	struct Snapshot: Identifiable, Hashable, Codable {
		let id: String
		let path: Application.ItemPath.Snapshot
		let index: Int
		let title: String
		let items: [Application.MenuItem.Snapshot]
	}

	var snapshot: Snapshot {
		.init(id: id,
			path: path.snapshot,
			index: index,
			title: title,
			items: items.snapshot)
	}

	init(snapshot: Snapshot) throws {
		id = snapshot.id
		path = try .init(snapshot: snapshot.path)
		index = snapshot.index
		title = snapshot.title
		items = try .init(snapshot: snapshot.items)
	}
}

extension Application.MenuGroup.Snapshot: PListCodable {
	var dictionaryRepresentation: [String : Any] {
		[
			"id": id,
			"path": path.dictionaryRepresentation,
			"index": index,
			"title": title,
			"items": items.dictionaryRepresentation,
		]
	}
	init(dictionaryRepresentation representation: Any?) throws {
		let representation = try representation as? [String:Any] ?! TypeMismatchError(representation, expected: [String:Any].self)
		id = try representation["id"] as? String ?! UnexpectedNilError()
		path = try .init(dictionaryRepresentation: representation["path"])
		index = try representation["index"] as? Int ?! UnexpectedNilError()
		title = try representation["title"] as? String ?! UnexpectedNilError()
		items = try representation["items"].map { try .init(dictionaryRepresentation: $0) } ?! UnexpectedNilError()
	}
}
