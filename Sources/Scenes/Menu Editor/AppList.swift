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

// MARK: - AppList
struct AppList: View {
	@EnvironmentObject var scene: SceneState
	@Binding var selection: Selection<Application>
	@State var lastError: Error? = nil

	var body: some View {
		OutlineView(scene.applications, selection: $selection) {
			ForEach_(scene.applications) { item in
				Item(item) {
					Text($0.name)
				}
			}
		}
		.selectionType(.one)
		.outlineViewStyle(.sourceList)
		.separatorVisibility(.hidden)
		.separatorInsets(NSEdgeInsets(top: 0, left: 23, bottom: 0, right: 0))
		.tint(.accentColor)
		.rowSize(.default)
		.alert(error: $lastError, dismissButton: "OK") { lastError = nil }
	}
}
