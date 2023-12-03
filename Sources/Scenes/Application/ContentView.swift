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
	@State var selection: Selection<Application> = []

	var body: some View {
		NavigationView {
			AppList(selection: $selection)
			AppView(application: $selection)
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
