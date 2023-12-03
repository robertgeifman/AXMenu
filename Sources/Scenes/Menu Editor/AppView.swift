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
	@Binding var application: Selection<Application>

	var body: some View {
		if let first = application.first {
			MenuView(application: first.value)
		} else {
			NoSelectionView()
		}
	}
}
