//
//  ContentView.swift
//  SpeakableCommands
//
//  Created by Robert Geifman on 26/11/2023.
//

import SwiftUI

struct ContentView: View {
	@StateObject var applications = RunningApplications()
	@State var sidebarSplitItem: NSSplitViewItem?
	@State var application: RunningApplication?

	var body: some View {
		NavigationView {
			AppList(application: $application)
			AppView(application: $application)
		}
		.environmentObject(applications)
		.navigationViewStyle(DoubleColumnNavigationViewStyle())
		.sibling(ofType: NSSplitView.self) {
			if let delegate = $0.delegate as? NSSplitViewController, let first = delegate.splitViewItems.first {
				sidebarSplitItem = first
			}
		}
//		.transformEnvironment(\.sidebarSplitItem) { $0 = sidebarSplitItem }
	}
}
