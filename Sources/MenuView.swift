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
	let selectedApplication: RunningApplications.Application
	@State var menuGroups: [MenuGroup]
	@State var selection: MenuCommand?

	var body: some View {
		List(selection: $selection) {
			ForEach($menuGroups, id: \.title) { group in
				DisclosureGroup {
					ForEach(group.items, id: \.id) { item in
						VStack {
							HStack {
								Toggle(isOn: item.isSelected) {}
								.toggleStyle(.checkbox)
								Text(item.title.wrappedValue)
							}
							if !item.path.wrappedValue.isEmpty {
								Text(item.path.wrappedValue.map(\.title).joined(separator: "->"))
							}
						}
						.tag(item.wrappedValue)
					}
				} label: {
					HStack {
						Toggle(isOn: group.isSelected) {}
						.toggleStyle(.checkbox)
						Text(group.title.wrappedValue)
					}
				}
			}
		}
	}

	init(selectedApplication: RunningApplications.Application) {
		self.selectedApplication = selectedApplication
		_menuGroups = .init(wrappedValue: AXMenuBar.menuBar(for: selectedApplication))
	}
}
