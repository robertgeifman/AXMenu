//
//  Created by Robert Geifman on 27/11/2023.
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

// MARK: - AppView
struct AppView: View {
	@EnvironmentObject var scene: SceneState
	@Environment(\.runningApplications) var applications
	@FocusState_.Binding var focus: Focus?
	@Binding var selectedApplication: Application.ID?
	@Environment(\.actionStore) var actionStore

	var body: some View {
		Group {
			if let selectedApplication,
				let application = Binding($scene.applications[selectedApplication]) {
				if let menus = Binding(application.menus) {
					MenuView(focus: $focus, application: application, menus: menus)
				} else {
					LoadMenusView(application: application)
				}
			} else {
				NoSelectionView()
			}
		}
		.toolbar {
			ToolbarItem {
				Menu {
					Command("Add Application…", \.addApplication)
						.keyboardShortcut("A", modifiers: [.command, .option])
					Divider()
					ForEach(applications, id: \.id) { runningApplication in
						Button {
							if let application = Application(runningApplication) {
								scene.addApplication(application)
							}
						} label: {
							Text(runningApplication.name)
						}
					}
				} label: {
					Label("Add New", systemImage: "plus")
				} primaryAction: {
					actionStore.addApplication()
				}
			}
			ToolbarItem {
				Button {
					actionStore.removeApplication()
				} label: {
					Label("Remove Application", systemImage: "minus")
				}
			}
		}
	}
}
