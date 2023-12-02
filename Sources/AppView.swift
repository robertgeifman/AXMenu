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
	@State var accessibilityEnabled = AXIsProcessTrusted()
	@Binding var selectedApplication: RunningApplication?

	var body: some View {
		if accessibilityEnabled {
			if let binding =  Binding<RunningApplication>($selectedApplication) {
				MenuView(selectedApplication: binding)
			} else {
				NoSelectionView()
			}
		} else {
			PermissionRequestView()
				.onReceive(NotificationCenter.default.publisher(for: NSApplication.didBecomeActiveNotification)) { _ in
					accessibilityEnabled = AXIsProcessTrusted()
				}
		}
	}
}
