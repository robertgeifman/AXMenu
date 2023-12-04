//
//  ContentView.swift
//  SpeakableCommands
//
//  Created by Robert Geifman on 26/11/2023.
//

import SwiftUI
import SwiftUIAdditions

struct ContentView: View {
	@State var sidebarSplitItem: NSSplitViewItem?
	@EnvironmentObject var scene: SceneState

	var body: some View {
		NavigationView {
			AppList(selection: $scene.selectedApplications)
			AppView(selection: $scene.selectedApplications)
		}
		.navigationViewStyle(DoubleColumnNavigationViewStyle())
		.sibling(ofType: NSSplitView.self) {
			if let delegate = $0.delegate as? NSSplitViewController, let first = delegate.splitViewItems.first {
				sidebarSplitItem = first
			}
		}
//		.transformEnvironment(\.sidebarSplitItem) { $0 = sidebarSplitItem }
	}
}
