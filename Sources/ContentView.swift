//
//  ContentView.swift
//  AXMenu
//
//  Created by Robert Geifman on 26/11/2023.
//

import SwiftUI

struct ContentView: View {
	@StateObject var data = ApplicationData()
	@State var sidebarSplitItem: NSSplitViewItem?

	var body: some View {
		NavigationView {
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
