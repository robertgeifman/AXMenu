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

// MARK: - PermissionRequestView
struct PermissionRequestView: View {
	var body: some View {
		Button {
			isAccessibilityEnabled(withPrompt: true)
		} label: {
			Text("Request Accessibility Permissions")
		}
	}

	@discardableResult
	func isAccessibilityEnabled(withPrompt: Bool) -> Bool {
		let checkOptionPromptKey = kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String
		let options = [checkOptionPromptKey: withPrompt] as CFDictionary
		return AXIsProcessTrustedWithOptions(options)
	}
}
