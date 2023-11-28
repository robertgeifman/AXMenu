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

// MARK: - AppView
struct AppView: View {
	@Binding var selectedApplication: NSRunningApplication?
	@State var accessibilityEnabled = ApplicationData.isAccessibilityEnabled(withPrompt: false)

	var body: some View {
		if ApplicationData.isAccessibilityEnabled(withPrompt: false) {
			if let selectedApplication, nil != selectedApplication.bundleIdentifier {
				MenuView(selectedApplication: selectedApplication)
			} else {
				NoSelectionView()
			}
		} else {
			PermissionRequestView()
				.onReceive(NotificationCenter.default.publisher(for: NSApplication.didBecomeActiveNotification)) { _ in
					accessibilityEnabled = ApplicationData.isAccessibilityEnabled(withPrompt: false)
				}
		}
	}
}
