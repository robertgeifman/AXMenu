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

// MARK: - MenuView
struct MenuView: View {
	let selectedApplication: RunningApplications.Application
	@State var menuCommands: [MenuItemCommand]
	@State var selection: MenuItemCommand?

	var body: some View {
		List(selection: $selection) {
			ForEach($menuCommands, id: \.id) { command in
				VStack {
					HStack {
						Toggle(isOn: command.isSelected) {}
						.toggleStyle(.checkbox)
						Text(command.title.wrappedValue)
					}
					if !command.path.isEmpty {
						Text(command.path.wrappedValue.map(\.title).joined(separator: "->"))
					}
				}
				.tag(command.wrappedValue)
			}
		}
	}

	init(selectedApplication: RunningApplications.Application) {
		self.selectedApplication = selectedApplication
		_menuCommands = .init(wrappedValue: MenuItemCommand.commands(for: selectedApplication))
	}
}
