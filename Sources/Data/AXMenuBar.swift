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
import AXEssibility

// MARK: - AXMenuBar
extension AXMenuBar {
	static func menuBar(for runningApplication: RunningApplication) throws -> [Application.MenuGroup] {
		let application = AXApplication(runningApplication.pid)
		let app = runningApplication.name
		var groupsOrder: [String] = []
		var groups: [String: Application.MenuGroup] = ["": .init(app: app, path: [], index: 1, title: "")]

		for (index, item) in try application.menuBar.menuItems.enumerated() {
			guard var title = item.title else {
				continue
			}
			if title.isEmpty {
				if app == "Xcode", index == 7 { title = "Editor" } else { continue }
			}

			if !item.isSubMenu {
//				let command = Application.MenuItem(app: app, path: [], index: index, title: title)
//				if let group = groups[""] {
//					groups[""] = group.appending(command)
//				} else {
//					groups[""] = .init(app: app, path: [], index: index, title: "", items: [command])
//				}
				continue
			}

			try item.forEach(path: [.init(index: index, title: title)], index: index) { path, pathString, index, child in
				guard let title = child.title, !title.isEmpty else {
					return
				}
				let command = Application.MenuItem(app: app, path: path, index: index, title: title, shortcut: child.shortcut)
				let pathString = path.pathString
				if let group = groups[pathString] {
					groups[pathString] = group.appending(command)
				} else {
					groupsOrder.append(pathString)
					groups[pathString] = .init(app: app, path: path, index: index, title: pathString, items: [command])
				}
			} onGroup: { path, title, index in
				let pathString = path.pathString
				groupsOrder.append(pathString)
				groups[pathString] = .init(app: app, path: path, index: index, title: pathString, items: [])
			}
		}

		return groupsOrder.compactMap { pathString -> Application.MenuGroup? in
			guard let group = groups[pathString], !group.isEmpty else { return nil }
			return group
		}
	}
}

// MARK: - AXMenuItem
extension AXMenuItem {
	func forEach(path: Application.ItemPath = [], index: Int,
		onItem: (Application.ItemPath, String, Int, AXMenuItem) throws -> Void,
		onGroup: (Application.ItemPath, String, Int) throws -> Void) throws {
		if isSubMenu, let title, !title.isEmpty {
			try onGroup(path, title, index)
		}
		for (position, item) in try menuItems.enumerated() {
			if item.isSubMenu {
				if let title = item.title, !title.isEmpty {
					let path = path.appending(.init(index: position, title: title))
					try item.forEach(path: path, index: position, onItem: onItem, onGroup: onGroup)
				} else {
					try item.forEach(path: path, index: position, onItem: onItem, onGroup: onGroup)
				}
			} else {
				try onItem(path, path.pathString, position, item)
			}
		}
	}
}
