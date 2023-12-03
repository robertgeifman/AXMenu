//
//  Created by Robert Geifman on 02/12/2023.
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
import SQLite
import Combine

// MARK: - MenuCommandView
struct MenuCommandView: View {
	let item: Application.Command
	@AppStorage var isSelected: Bool

	init(item: Application.Command) {
		self.item = item
		_isSelected = AppStorage(wrappedValue: false, item.id)
	}

	var body: some View {
		HStack(alignment: .top) {
			Toggle(isOn: $isSelected) {}
			.toggleStyle(.checkbox)

			Text(item.title)
			.frame(maxWidth: .infinity, alignment: .leading)

			if let shortcut = item.shortcut {
				Text(shortcut)
				.frame(width: 100, alignment: .trailing)
			}
		}
		.frame(maxWidth: .infinity, alignment: .leading)
	}
}
