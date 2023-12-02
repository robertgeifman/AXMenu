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
	@EnvironmentObject var data: RunningApplications
	@Binding var selectedApplication: RunningApplication?

	var body: some View {
		List($data.applications, id: \.id, selection: $selectedApplication) {
			Text($0.wrappedValue.name).tag($0.wrappedValue)
		}
		.onReceive(NSWorkspace.shared.notificationCenter.publisher(for: NSWorkspace.didLaunchApplicationNotification)) { _ in
			data.reload()
		}
		.onReceive(NSWorkspace.shared.notificationCenter.publisher(for: NSWorkspace.didTerminateApplicationNotification)) { _ in
			data.reload()
		}
	}
}
