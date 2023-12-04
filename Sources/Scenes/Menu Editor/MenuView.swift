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
	@EnvironmentObject var scene: SceneState
	@Binding var application: Application
	@State var selection: Selection<Application.MenuGroup> = []

	var body: some View {
		OutlineView(application.menus ?? [], selection: $selection) {
			ForEach_(application.menus ?? []) { group in
				OutlineGroup_(group,
					isExpanded: $application.menuGroups.contains(group.id)) { item in
					Item(item) {
						MenuItemView(item: $0, isSelected: .constant(false))
					}
				} header: { group in
					MenuGroupView(group: group)
						.fontWeight(.bold).foregroundColor(.secondary)
				}
			}
			.onSelectionChange { (selection: Selection<Application.MenuGroup>) in
				print(selection.map(\.id))
			}
		}
		.selectionType(.any)
		.separatorVisibility(.hidden)
		.separatorInsets(NSEdgeInsets(top: 0, left: 23, bottom: 0, right: 0))
		.tint(.accentColor)
		.rowSize(.default)
//		.onAppear {
//			groups = AXMenuBar.menuBar(for: application)
//		}
//		.onChange(of: application) {
//			groups = AXMenuBar.menuBar(for: $0)
//		}
	}
}
