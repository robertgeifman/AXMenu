//
//  Application.swift
//  SpeakableCommands
//
//  Created by Robert Geifman on 26/11/2023.
//

import Foundation
import FoundationAdditions
import SwiftUI
import SwiftUIAdditions

// MARK: - ApplicationScene
struct ApplicationScene: Scene {
	@Environment(\.actionStore) var actionStore
	@StateObject var scene = SceneState()
	@StateObject var runningApplications = RunningApplications()

	var body: some Scene {
		WindowGroup {
			ContentView()
			.environmentObject(scene)
			.environmentObject(runningApplications)
			.onReceive(NSWorkspace.shared.notificationCenter.publisher(for: NSWorkspace.didLaunchApplicationNotification)) { _ in
				runningApplications.reload()
			}
			.onReceive(NSWorkspace.shared.notificationCenter.publisher(for: NSWorkspace.didTerminateApplicationNotification)) { _ in
				runningApplications.reload()
			}
		}
		.commands {
			EditCommands(applications: runningApplications)
		}
		._environment(\.actionStore, actionStore)
		.windowToolbarStyle(.unified(showsTitle: true))
		.windowStyle(.titleBar)
	}
}
