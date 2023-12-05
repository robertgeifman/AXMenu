//
//  Commands.swift
//  Typographer
//
//  Created by Robert Geifman on 02/09/2022.
//

import Foundation
import FoundationAdditions
import SwiftUI
import SwiftUIAdditions

// MARK: - EditCommands
struct EditCommands: Commands {
//	@Environment(\.undoManager) var undoManager
	@Environment(\.runningApplications) var applications
	@Environment(\.sceneState) var scene

	var body: some Commands {
		TextEditingCommands()
//		CommandGroup(replacing: .undoRedo) {
//			Button("Undo") { undoManager?.undo() }
//				.disabled(!(undoManager?.canUndo ?? false))
//				.keyboardShortcut("z", modifiers: [.command])
//			Button("Redo") { undoManager?.redo() }
//				.disabled(!(undoManager?.canRedo ?? false))
//				.keyboardShortcut("z", modifiers: [.command, .shift])
//			Command("Undo") { undoManager.undo() }.keyboardShortcut("z", modifiers: [.command])
//			Command("Redo") { undoManager.redo() }.keyboardShortcut("z", modifiers: [.command, .shift])
//		}
		CommandGroup(replacing: .pasteboard) {
			Command("Cut", \.cut).keyboardShortcut(KeyEquivalent("x"), modifiers: /*@START_MENU_TOKEN@*/.command/*@END_MENU_TOKEN@*/)
			Command("Copy", \.copy).keyboardShortcut(KeyEquivalent("c"), modifiers: /*@START_MENU_TOKEN@*/.command/*@END_MENU_TOKEN@*/)
			Command("Paste", \.paste).keyboardShortcut(KeyEquivalent("v"), modifiers: /*@START_MENU_TOKEN@*/.command/*@END_MENU_TOKEN@*/)
			Command("Delete", \.delete).keyboardShortcut(.delete, modifiers: [])
			Command("Select All", \.selectAll).keyboardShortcut(KeyEquivalent("a"), modifiers: /*@START_MENU_TOKEN@*/.command/*@END_MENU_TOKEN@*/)
			Divider()
			Menu("Add Application") {
				Command("Add Application…", \.addApplication)
				.keyboardShortcut("A", modifiers: [.command, .option])
				Divider()
//				Command("Add Running Application…", \.addRunningApplication)
//				.keyboardShortcut("A", modifiers: [.command, .option])
				ForEach(applications, id: \.id) { runningApplication in
					Button {
						if let application = Application(runningApplication) {
							scene.addApplication(application)
						}
					} label: {
						Text(runningApplication.name)
					}
				}
			}
		}
	}
}

// MARK: - Custom actions
extension ActionStore {
	struct AddApplicationKey: ActionKey {}
	struct AddRunningApplicationKey: ActionKey {}
	struct RemoveApplicationKey: ActionKey {}

	var addApplication: AddApplicationKey.Value {
		get { self[AddApplicationKey.self] }
		set { self[AddApplicationKey.self] = newValue }
	}
	var addRunningApplication: AddRunningApplicationKey.Value {
		get { self[AddRunningApplicationKey.self] }
		set { self[AddRunningApplicationKey.self] = newValue }
	}
	var removeApplication: RemoveApplicationKey.Value {
		get { self[RemoveApplicationKey.self] }
		set { self[RemoveApplicationKey.self] = newValue }
	}
}
