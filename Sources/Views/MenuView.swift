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
	@Binding var application: RunningApplication
	@State var groups: [Application.Group] = []
	@State var selection: String?
	@State var listSelection: Selection<Application.Command> = []

	var body: some View {
		List(selection: $selection) {
			ForEach(groups) { group in
				DisclosureGroup {
					ForEach(group.items) { item in
						MenuCommandView(item: item)
						.tag(item.id)
					}
				} label: {
					MenuGroupView(group: group)
				}
				.tag(group.id)
			}
		}
		.listRowSeparator(.hidden)
		.onAppear {
			groups = AXMenuBar.menuBar(for: application)
		}
		.onChange(of: application) {
			groups = AXMenuBar.menuBar(for: $0)
		}
	}
}
