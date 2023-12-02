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

// MARK: - MenuItemPath
struct MenuItemPath: Hashable {
	struct Element: Hashable, Codable {
		let index: Int
		let title: String

		func hash(into hasher: inout Hasher) { title.hash(into: &hasher) }
	}

	@Property var elements: [Element]
	var pathString: String {
		map(\.title).joined(separator: "->")
	}
	init(_ elements: [Element] = []) {
		self.elements = elements
	}

	func hash(into hasher: inout Hasher) {
		elements.hash(into: &hasher)
	}
}

// MARK: - DeferredDecodableContainer, Encodable
extension MenuItemPath: DeferredDecodableContainer, Encodable {
	init(_: DeferredDecoder) {}
}

// MARK: - ExpressibleByArrayLiteral
extension MenuItemPath: ExpressibleByArrayLiteral {
	init(arrayLiteral value: Element...) {
		self.init(value)
	}
}

// MARK: - RandomAccessCollection
extension MenuItemPath: RandomAccessCollection {
	var startIndex: Int { elements.startIndex }
	var endIndex: Int { elements.endIndex }
	func appending(_ element: Element) -> Self {
		let result = self
		result.elements.append(element)
		return result
	}
	subscript(position: Int) -> Element { elements[position] }
}
