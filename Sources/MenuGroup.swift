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

// MARK: - MenuGroup
struct MenuGroup: Hashable, DeferredDecodableContainer, Encodable {
	@Property var id: UUID = .init()
	@Property var path: MenuItemPath
	@Property var index: Int
	@Property var title: String
	@Property var isSelected: Bool = true
	@Property var items: [MenuCommand]

	init(path: MenuItemPath, index: Int, title: String, items: [MenuCommand] = []) {
		self.path = path
		self.index = index
		self.title = title
	}
	init(_: DeferredDecoder) {}
}

extension MenuGroup: RandomAccessCollection {
	var startIndex: Int { items.startIndex }
	var endIndex: Int { items.endIndex }
	func appending(_ command: MenuCommand) -> Self {
		let result = self
		result.items.append(command)
		return result
	}
	subscript(position: Int) -> MenuCommand { items[position] }
}
