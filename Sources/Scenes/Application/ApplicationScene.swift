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
			.transformEnvironment(\.runningApplications) { 
				$0 = runningApplications.applications
			}
		}
		.commands {
			EditCommands()
		}
		._environment(\.actionStore, actionStore)
		._environment(\.sceneState, scene)
		._environment(\.runningApplications, runningApplications.applications)
		.windowToolbarStyle(.unified(showsTitle: true))
		.windowStyle(.titleBar)
	}
}

// MARK: - EnvironmentValues - ActionStoreKey
extension EnvironmentValues {
	struct SceneStateKey: EnvironmentKey {
		static var defaultValue: SceneState = .init(_applications: [:])
	}

	var sceneState: SceneStateKey.Value {
		get { self[SceneStateKey.self] }
		set { self[SceneStateKey.self] = newValue }
	}

	struct RunningApplicationsKey: EnvironmentKey {
		static var defaultValue: [RunningApplication] = []
	}

	var runningApplications: RunningApplicationsKey.Value {
		get { self[RunningApplicationsKey.self] }
		set { self[RunningApplicationsKey.self] = newValue }
	}
}

