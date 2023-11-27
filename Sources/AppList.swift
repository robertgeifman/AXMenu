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
	@EnvironmentObject var data: ApplicationData
	@State var selection: NSRunningApplication?

	var body: some View {
		List(selection: $selection) {
			ForEach(data.applications, id: \.bundleIdentifier) { app in
				Text(app.bundleIdentifier ?? "")
			}
		}
	}
}
