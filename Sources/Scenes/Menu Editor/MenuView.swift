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
	@FocusState_.Binding var focus: Focus?
	@Binding var application: Application
	@Binding var menus: [Application.MenuGroup]
	@State var selection: Selection<Application.MenuGroup> = []

	var body: some View {
		OutlineView(menus, selection: $selection) {
			ForEach_(menus) { index, menu in
				OutlineGroup_(menu,
					isExpanded: $menus[index].isExpanded) { itemIndex, item in
					Item(item) {
						if index == 0, itemIndex == 0 { let _ = print(item.id) }
						MenuItemView(item: $0, isSelected: $menus[index][itemIndex].isSelected)
					}
				} header: { menu in
					MenuGroupView(group: menu, isSelected: $menus[index].isSelected)
						.fontWeight(.bold).foregroundColor(.secondary)
				}
			}
			.onSelectionChange { (selection: Selection<Application.MenuGroup>) in }
		}
		.focused($focus, equals: .menuView)
		.onCommand(\.copy) {
			print("On copy menu")
		}
		.selectionType(.any)
		.separatorVisibility(.hidden)
		.separatorInsets(NSEdgeInsets(top: 0, left: 23, bottom: 0, right: 0))
		.tint(.accentColor)
		.rowSize(.default)
		.navigationSubtitle(Text(application.name))
//		.toolbar {}
	}
}
