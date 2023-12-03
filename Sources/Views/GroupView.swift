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

// MARK: - GroupView
struct GroupView: View {
	let group: Application.Group
	@AppStorage var isSelected: Bool

	init(group: Application.Group) {
		self.group = group
		_isSelected = AppStorage(wrappedValue: false, group.id)
	}
	var body: some View {
		HStack {
			Toggle(isOn: $isSelected) {}
			.toggleStyle(.checkbox)
			.onChange(of: isSelected) { 
				let defaults = UserDefaults.standard
				for item in group.items {
					defaults.set($0, forKey: item.id)
				}
				defaults.synchronize()
			}
			Text(group.title)
		}
	}
}
