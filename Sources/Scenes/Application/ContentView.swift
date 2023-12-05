//
//  ContentView.swift
//  SpeakableCommands
//
//  Created by Robert Geifman on 26/11/2023.
//

import SwiftUI
import SwiftUIAdditions

enum Focus: Hashable {
	case appList, menuView, searchField
}
struct ContentView: View {
	@State var sidebarSplitItem: NSSplitViewItem?
	@EnvironmentObject var scene: SceneState
	@FocusState_ var focus: Focus?
	var body: some View {
		NavigationView {
			AppList(focus: $focus)
			AppView(focus: $focus, selectedApplication: $scene.selectedApplication)
		}
		.navigationTitle(Text("Speakable Commands"))
		.navigationViewStyle(DoubleColumnNavigationViewStyle())
		.sibling(ofType: NSSplitView.self) {
			if let delegate = $0.delegate as? NSSplitViewController, let first = delegate.splitViewItems.first {
				sidebarSplitItem = first
			}
		}
//		.transformEnvironment(\.sidebarSplitItem) { $0 = sidebarSplitItem }
	}
}
