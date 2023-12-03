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

// MARK: - Application.Group
extension Application {
	struct MenuGroup: Hashable, Identifiable {
		@Property var id: String
		@Property var path: ItemPath
		@Property var index: Int
		@Property var title: String
		@Property var items: [Application.MenuItem]

		init(app: String, path: ItemPath, index: Int, title: String, items: [Application.MenuItem] = []) {
			id = app + "." + path.id + "." + title + "@\(index)"
			self.path = path
			self.index = index
			self.title = title
		}
	}
}

// MARK: - Application.MenuGroup: SnapshotCodable
extension Application.MenuGroup: SnapshotCodable {
	struct Snapshot: Identifiable, Hashable, Codable {
		let id: String
		let path: Application.ItemPath
		let index: Int
		let title: String
		let items: [Application.MenuItem]
	}

	var snapshot: Snapshot {
		.init(id: id,
			path: path,
			index: index,
			title: title,
			items: items)
	}

	init(snapshot: Snapshot) throws {
		id = snapshot.id
		path = snapshot.path
		index = snapshot.index
		title = snapshot.title
		items = snapshot.items
	}
}

// MARK: - Application.Group: DeferredContainer, Encodable
extension Application.MenuGroup: DeferredContainer, Encodable {
	init(_: DeferredDecoder) {}
}

// MARK: - Application.Group: RandomAccessCollection
extension Application.MenuGroup: RandomAccessCollection {
	var startIndex: Int { items.startIndex }
	var endIndex: Int { items.endIndex }
	func appending(_ command: Application.MenuItem) -> Self {
		let result = self
		result.items.append(command)
		return result
	}
	subscript(position: Int) -> Application.MenuItem { items[position] }
}
