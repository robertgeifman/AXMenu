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
	var applications: RunningApplications

	var body: some Commands {
		TextEditingCommands()
		CommandGroup(after: .pasteboard) {
			Divider()
			Menu("Add Application") {
//				Command("Add Running Application…", \.addRunningApplication)
//				.keyboardShortcut("A", modifiers: [.command, .option])
				ForEach(applications.applications, id: \.id) { application in
					Button {
					} label: {
						Text(application.name)
					}
				}

				Divider()
				Command("Add Application…", \.addApplication)
				.keyboardShortcut("A", modifiers: [.command, .option])
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
