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
		CommandGroup(after: .pasteboard) {
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

// MARK: - FindAction
extension ActionStore {
	struct AddApplicationKey: ActionKey {}
	struct AddRunningApplicationKey: ActionKey {}

	var addApplication: AddApplicationKey.Value {
		get { self[AddApplicationKey.self] }
		set { self[AddApplicationKey.self] = newValue }
	}
	var addRunningApplication: AddRunningApplicationKey.Value {
		get { self[AddRunningApplicationKey.self] }
		set { self[AddRunningApplicationKey.self] = newValue }
	}
}
