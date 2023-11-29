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

extension NSRunningApplication: Identifiable {
	public var id: String { bundleIdentifier ?? typePtr }
}

// MARK: - AppList
struct AppList: View {
	@EnvironmentObject var data: RunningApplications
	@Binding var selectedApplication: RunningApplications.Application?

	var body: some View {
		List(data.applications, id: \.id, selection: $selectedApplication) {
			Text($0.name)
		}
	}
}
