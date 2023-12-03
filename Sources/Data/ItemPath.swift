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

// MARK: - Application.ItemPath
extension Application {
	struct ItemPath: Identifiable, Hashable {
		@Property var elements: [Element]

		var id: String {
			map(\.title).joined()
		}
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
}

// MARK: - Application.ItemPath: DeferredContainer, Encodable
extension Application.ItemPath: DeferredContainer, Encodable {
	init(_: DeferredDecoder) {}
}

// MARK: - Application.ItemPath: ExpressibleByArrayLiteral
extension Application.ItemPath: ExpressibleByArrayLiteral {
	init(arrayLiteral value: Element...) {
		self.init(value)
	}
}

// MARK: - Application.ItemPath: RandomAccessCollection
extension Application.ItemPath: RandomAccessCollection {
	struct Element: Hashable, Codable {
		let index: Int
		let title: String
	}
	var startIndex: Int { elements.startIndex }
	var endIndex: Int { elements.endIndex }
	func appending(_ element: Element) -> Self {
		.init(elements.appending(element))
	}
	subscript(position: Int) -> Element { elements[position] }
}
