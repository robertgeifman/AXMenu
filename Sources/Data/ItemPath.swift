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

// MARK: - Application.ItemPath: SnapshotCodable
extension Application.ItemPath: SnapshotCodable {
	struct Snapshot: Hashable, Codable {
		let elements: [Element].Snapshot
	}
	var snapshot: Snapshot {
		.init(elements: elements.snapshot)
	}

	init(snapshot: Snapshot) throws {
		elements = try .init(snapshot: snapshot.elements)
	}
}

extension Application.ItemPath.Snapshot: PListCodable {
	var dictionaryRepresentation: [String : Any] {
		[
			"elements": elements.dictionaryRepresentation,
		]
	}
	init(dictionaryRepresentation representation: Any?) throws {
		let representation = try representation as? [String:Any] ?! TypeMismatchError(representation, expected: [String:Any].self)
		elements = try representation["elements"].map { try .init(dictionaryRepresentation: $0) } ?? []
	}
}

// MARK: - Application.ItemPath.Element: SnapshotCodable
extension Application.ItemPath.Element: SnapshotCodable {
	struct Snapshot: Hashable, Codable {
		let index: Int
		let title: String
	}
	var snapshot: Snapshot {
		.init(index: index, title: title)
	}

	init(snapshot: Snapshot) throws {
		index = snapshot.index
		title = snapshot.title
	}
}

extension Application.ItemPath.Element.Snapshot: PListCodable {
	var dictionaryRepresentation: [String : Any] {
		[
			"index": index,
			"title": title,
		]
	}
	init(dictionaryRepresentation representation: Any?) throws {
		let representation = try representation as? [String:Any] ?! TypeMismatchError(representation, expected: [String:Any].self)
		index = try representation["index"] as? Int ?! UnexpectedNilError()
		title = try representation["title"] as? String ?! UnexpectedNilError()
	}
}
