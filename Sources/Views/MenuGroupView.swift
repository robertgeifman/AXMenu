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

// MARK: - MenuGroupView
struct MenuGroupView: View {
	let group: Application.MenuGroup
	@Binding var isSelected: Bool
	@State var state: Bool = false

	var body: some View {
		HStack {
			Toggle(isOn: $state) {}
			.toggleStyle(.checkbox)
			Text(group.title)
		}
		.onAppear { state = isSelected }
		.onChange(of: state) {
			isSelected = $0
			for item in group.items {
				item.isSelected = $0
			}
		}
	}
}
