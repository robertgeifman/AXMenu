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
import AXEssibility

// MARK: - MenuView
struct MenuView: View {
	var application: Application
	@State var groups: [Application.Group] = []
	@State var selection: Selection<Application.Command> = []
	@State var lastError: Error? = nil

	var body: some View {
		OutlineView(groups, selection: $selection) {
			ForEach_(groups) { group in
				OutlineGroup_(group) { item in //, isExpanded: $scene.sidebarGroups.contains(value.id)) {
					Item(item) {
						CommandView(item: $0)
					}
				} header: { group in
					GroupView(group: group)
						.fontWeight(.bold).foregroundColor(.secondary)
				}
			}
		}
		.selectionType(.leastOne)
		.separatorVisibility(.hidden)
		.separatorInsets(NSEdgeInsets(top: 0, left: 23, bottom: 0, right: 0))
		.tint(.accentColor)
		.rowSize(.default)
		.alert(error: $lastError, dismissButton: "OK") { lastError = nil }
//		.onAppear {
//			groups = AXMenuBar.menuBar(for: application)
//		}
//		.onChange(of: application) {
//			groups = AXMenuBar.menuBar(for: $0)
//		}
	}
}
