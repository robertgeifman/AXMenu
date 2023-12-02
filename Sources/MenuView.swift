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
	@Binding var selectedApplication: RunningApplication
	@State var menuGroups: [MenuGroup] = []
//	@State var selection: MenuCommand?
	@State var selection: String?

	var body: some View {
		List(selection: $selection) {
			ForEach(menuGroups) { group in
				DisclosureGroup {
					ForEach(group.items) { item in
						HStack(alignment: .top) {
//							Toggle(isOn: item.wrappedValue.isCommandSelected) {}
							Toggle(isOn: item.isSelected_) {}
							.toggleStyle(.checkbox)

							Text(item.title)
							.frame(maxWidth: .infinity, alignment: .leading)

							if let shortcut = item.shortcut {
								Text(shortcut)
								.frame(width: 100, alignment: .trailing)
							}
						}
						.frame(maxWidth: .infinity, alignment: .leading)
						.tag(item.id)
					}
				} label: {
					HStack {
						Toggle(sources: group.items, isOn: \.isCommandSelected) {}
						.toggleStyle(.checkbox)

						Text(group.title)
					}
				}
				.tag(group.id)
			}
		}
		.listRowSeparator(.hidden)
		.onAppear {
			menuGroups = AXMenuBar.menuBar(for: selectedApplication)
		}
		.onChange(of: selectedApplication) {
			menuGroups = AXMenuBar.menuBar(for: $0)
		}
	}
}
