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

// MARK: - AppList
struct AppList: View {
	@EnvironmentObject var scene: SceneState
	@State var lastError: Error? = nil
	@State var willRemove = false
	@State var selection: Selection<Application> = []
	@FocusState_.Binding var focus: Focus?

	var body: some View {
		OutlineView(scene.applications.values, selection: $selection) {
			ForEach_(scene.applications.values) { item in
				Item(item) {
					Text($0.name)
				}
			}
			.onSelectionChange {
				scene.selectedApplication = $0.first?.value.id
			}
		}
		.focused($focus, equals: .appList)
//		.onCommand(\.copy) {
//			print("On copy list")
//		}
//		.onCommand(#selector(NSText.copy)) {
//			print("Copy")
//		}
//		.onCommand(#selector(NSStandardKeyBindingResponding.deleteBackward)) {
//			print("Delete")
//		}
		.toolbar {
			ToolbarItem { SidebarActionMenu() }
		}
		.selectionType(.any)
		.outlineViewStyle(.sourceList)
		.separatorVisibility(.hidden)
		.separatorInsets(NSEdgeInsets(top: 0, left: 23, bottom: 0, right: 0))
		.tint(.accentColor)
		.rowSize(.default)
		.onCommand(\.addApplication) {
			var directoryURL: URL
			let user = FileManager.default.urls(for: .applicationDirectory, in: .userDomainMask)
			if let url = user.first {
				directoryURL = url
			} else {
				let urls = FileManager.default.urls(for: .applicationDirectory, in: .allDomainsMask)
				if let url = urls.first {
					directoryURL = url
				} else {
					directoryURL = URL(fileURLWithPath: "/Applications")
 				}
			}

			let panel = configure(NSOpenPanel()) {
				$0.identifier = NSUserInterfaceItemIdentifier("com.robertgeifman.SpeakableCommands.addApplication")
				$0.directoryURL = directoryURL
				$0.allowedContentTypes = [.application]
				$0.allowsOtherFileTypes = false
				$0.allowsMultipleSelection = true
				$0.canChooseDirectories = false
				$0.canCreateDirectories = false
//				$0.title = "Add Application"
				$0.message = "Add Application"
				$0.prompt = "Select"
//				$0.accessoryView = nil
//				$0.isExpanded = false
//				$0.showsHiddenFiles = false
			}

			guard panel.runModal() == .OK else { return }
			for url in panel.urls {
				guard let bundle = Bundle(url: url),
					let application = Application(bundle) else { continue }
				scene.addApplication(application)
			}
		}
		.onCommand(\.removeApplication) {
			willRemove = true
		}
		.alert(error: $lastError, dismissButton: "OK") { lastError = nil }
		.alert(isPresented: $willRemove) {
			Alert(
				title: Text("Remove Applications"),
				message: Text("Are you sure you want to remove the selected application(s)?"),
				primaryButton: .default(Text("Cancel")) {
				},
				secondaryButton: .destructive(Text("Remove")) {
				}
			)
		}
	}
}

// MARK: - SidebarActionMenu
struct SidebarActionMenu: View {
	var body: some View {
		Button(systemName: "sidebar.left", action: toggleSidebar)
	}
}
