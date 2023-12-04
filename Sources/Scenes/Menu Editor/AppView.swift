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
	@Binding var selectedApplication: Application.ID?

	var body: some View {
		Group {
		if let selectedApplication,
			let application = scene.application(withId: selectedApplication) {
			if let menus = application.menus {
				MenuView(menus: menus)
				.navigationSubtitle(Text(application.name))
			} else {
				LoadMenusView(application: application)
				.navigationSubtitle(Text(application.name))
			}
		} else {
			NoSelectionView()
			.navigationSubtitle("")
		}
		}
		.toolbar {
			ToolbarItem {
				Menu {
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
				} label: {
		            Label("Add New", systemImage: "plus")
				}
			}
		}
	}
}
