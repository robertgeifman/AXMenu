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
import SQLite
import AXEssibility

// MARK: - AXMenuBar
extension AXMenuBar {
	static var cache: [String: [Application.Group]] = [:]

	static func menuBar(for runningApplication: RunningApplication) -> [Application.Group] {
		if let commands = cache[runningApplication.id] {
			return commands
		}

		let application = AXApplication(runningApplication.pid)
		let app = runningApplication.name
		var groupsOrder: [String] = []
		var groups: [String: Application.Group] = ["": .init(app: app, path: [], index: 1, title: "")]
		do {
			for (index, item) in try application.menuBar.menuItems.enumerated() {
				guard var title = item.title else {
					continue
				}
				if title.isEmpty {
					if app == "Xcode", index == 7 { title = "Editor" } else { continue }
				}
				
				if !item.isSubMenu {
					let command = Application.Command(app: app, path: [], index: index, title: title)
					if let group = groups[""] {
						groups[""] = group.appending(command)
					} else {
						groups[""] = .init(app: app, path: [], index: index, title: "", items: [command])
					}
					continue
				}

				try item.forEach(path: [.init(index: index, title: title)], index: index) { path, pathString, index, child in
					guard let title = child.title, !title.isEmpty else {
						return
					}
					let command = Application.Command(app: app, path: path, index: index, title: title)
					if let value = try? child.menuItemCmdVirtualKey, var shortcut = AXMenuItem.stringForKey(value) {
						if let modifiers = try? child.menuItemCmdModifiers, let string = AXMenuItem.stringForModifiers(modifiers) {
							shortcut = string + " " + shortcut
						}
						command.shortcut = shortcut
					} else if var shortcut = try? child.menuItemCmdChar {
						if let modifiers = try? child.menuItemCmdModifiers, let string = AXMenuItem.stringForModifiers(modifiers) {
							shortcut = string + " " + shortcut
						}
						command.shortcut = shortcut
					}
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
		} catch {
			log(runningApplication.id, error)
			return []
		}

		let result = groupsOrder.compactMap { pathString -> Application.Group? in
			guard let group = groups[pathString], !group.isEmpty else { return nil }
			return group
		}
		Self.cache[runningApplication.id] = result
		return result
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

extension AXMenuItem {
	static func stringForKey(_ key: Int) -> String? {
		switch key {
		case 53: "ESC"
		case 122: "F1"
		case 120: "F2"
		case 99: "F3"
		case 118: "F4"
		case 96: "F5"
		case 97: "F6"
		case 98: "F7"
		case 100: "F8"
		case 101: "F9"
		case 109: "F10"
		case 103: "F11"
		case 111: "F12"

		case 50: "`"
		case 18: "1"
		case 19: "2"
		case 20: "3"
		case 21: "4"
		case 23: "5"
		case 22: "6"
		case 26: "7"
		case 28: "8"
		case 25: "9"
		case 29: "0"
		case 27: "-"
		case 24: "="
		case 51: "Delete"

		case 48: "Tab"
		case 12: "Q"
		case 13: "W"
		case 14: "E"
		case 15: "R"
		case 17: "T"
		case 16: "Y"
		case 32: "U"
		case 34: "I"
		case 31: "O"
		case 35: "P"
		case 33: "["
		case 30: "]"
		case 42: "\\"

		case 57: "CapsLock"
		case 0: "A"
		case 1: "S"
		case 2: "D"
		case 3: "F"
		case 5: "G"
		case 4: "H"
		case 38: "J"
		case 40: "K"
		case 37: "L"
		case 41: ";"
		case 39: "'"
		case 76: "Enter"
		case 36: "Return"

		case 56: "Shift"
		case 6: "Z"
		case 7: "X"
		case 8: "C"
		case 9: "V"
		case 11: "B"
		case 45: "N"
		case 46: "M"
		case 43: ","
		case 47: "."
		case 44: "/"
		case 60: "Right Shift"

		case 63: "Fn"
		case 59: "Ctrl"
		case 58: "Alt"
		case 55: "Cmd"
		case 49: "Space"
		case 61: "Right Alt"
		case 62: "Right Ctrl"
		case 123: "Left"
		case 126: "Up"
		case 125: "Down"
		case 124: "Right"

		case 115: "Home"
		case 116: "Page Up"
		case 121: "Page Down"
		case 119: "End"

		case 107: "Bri Down" // F14
		case 113: "Bri Up" // F15
		case 160: "Fn-F3"
		case 131: "Fn-F4"
		case 105: "F13"
		case 106: "F16"
		case 64: "F17"
		case 79: "F18"
		case 80: "F19"
		case 90: "F20"
		case 83: "Num 1"
		case 84: "Num 2"
		case 85: "Num 3"
		case 86: "Num 4"
		case 87: "Num 5"
		case 88: "Num 6"
		case 89: "Num 7"
		case 91: "Num 8"
		case 92: "Num 9"
		case 82: "Num 0"
		case 67: "Num *"
		case 75: "Num /"
		case 69: "Num +"
		case 78: "Num -"
		case 81: "Num ="
		case 65: "Num ."
		case 71: "Clear"
		case 72: "Volume Up"
		case 73: "Volume Down"
		case 74: "Mute"
		case 114: "Help"
		case 10: "§"
		case 117: "ForwardDelete"
		case 52: "Line Feed"
		default: "(\(key))"
		}
	}
	// modifier	 mask bits (⌘ is assumed): 1 = ⇧, 2 = ⌥, 4 = ⌃, 8 = no ⌘, 16 = fn
	static func stringForModifiers(_ modifiers: UInt) -> String? {
		if modifiers == 8 { return nil }

		var strings = [String]()
		if modifiers & 16 == 16 { strings.append("􀆪") }
		if modifiers & 4 == 4 { strings.append("⌃") }
		if modifiers & 2 == 2 { strings.append("⌥") }
		if modifiers & 1 == 1 { strings.append("⇧") }
		if modifiers & 8 == 0 { strings.append("⌘") }
		return strings.isEmpty ? nil : strings.joined(separator: "")
	}
	static func stringForEventModifiers(_ modifiers: UInt) -> String? {
		let flags = NSEvent.ModifierFlags(rawValue: modifiers)
		var strings = [String]()
		if flags.contains(.command) { strings.append("Cmd") }
		if flags.contains(.option) { strings.append("Alt") }
		if flags.contains(.control) { strings.append("Ctrl") }
		if flags.contains(.shift) { strings.append("Shift") }
		if flags.contains(.function) { strings.append("Fn") }
		if flags.contains(.numericPad) { strings.append("Num") }
		if flags.contains(.capsLock) { strings.append("Caps") }
		if flags.contains(.help) { strings.append("Help") }
		return strings.joined(separator: "+")
	}
}
