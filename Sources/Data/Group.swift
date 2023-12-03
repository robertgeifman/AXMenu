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
	struct Group: Hashable, Identifiable {
		@Property var id: String
		@Property var path: ItemPath
		@Property var index: Int
		@Property var title: String
		@Property var items: [Command]

		init(app: String, path: ItemPath, index: Int, title: String, items: [Application.Command] = []) {
			id = app + "." + path.id + "." + title + "@\(index)"
			self.path = path
			self.index = index
			self.title = title
		}
	}
}
extension Application.Group {
	var isSelected: Binding<Bool> {
		.init {
			UserDefaults.standard.bool(forKey: id)
		} set: {
			let defaults = UserDefaults.standard
			defaults.set($0, forKey: id)
			for item in items {
				defaults.set($0, forKey: item.id)
			}
			defaults.synchronize()
		}
	}
}

// MARK: - Application.Group: DeferredDecodableContainer, Encodable
extension Application.Group: DeferredDecodableContainer, Encodable {
	init(_: DeferredDecoder) {}
}

// MARK: - Application.Group: RandomAccessCollection
extension Application.Group: RandomAccessCollection {
	var startIndex: Int { items.startIndex }
	var endIndex: Int { items.endIndex }
	func appending(_ command: Application.Command) -> Self {
		let result = self
		result.items.append(command)
		return result
	}
	subscript(position: Int) -> Application.Command { items[position] }
}
