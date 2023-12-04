//
//  Created by Robert Geifman on 19/08/2022.
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
import Combine

// MARK: - SceneState
final class SceneState: ObservableObject {
	@Published var applications: [Application] = []
	@Published var selectedApplications: Selection<Application> = []
	var cancellables: Set<AnyCancellable> = []

	@MainActor
	convenience init() {
		do {
			let snapshot = try Snapshot(from: UserDefaults.standard, key: "applications")
			try self.init(snapshot: snapshot)
		} catch {
			log("error loading StateScene.Snapshot", error)
			self.init(_applications: [])
		}
		NotificationCenter.default.publisher(for: NSApplication.willTerminateNotification)
			.sink { _ in self.snapshot.store(in: UserDefaults.standard, key: "applications") }
			.store(in: &cancellables)
		NotificationCenter.default.publisher(for: NSApplication.willResignActiveNotification)
			.sink { _ in self.snapshot.store(in: UserDefaults.standard, key: "applications") }
			.store(in: &cancellables)
	}

	init(_applications applications: [Application]) {
		_applications = .init(wrappedValue: applications)
	}
	@MainActor
	init(snapshot: Snapshot) throws {
		applications = try snapshot.applications.map { try .init(snapshot: $0) }
		selectedApplications = try .init(snapshot: snapshot.selectedApplications)
	}

	func addApplication(_ application: Application) {
		if nil == applications.first(where: { $0.id == application.id }) {
			applications = applications.appending(application).sorted {
				$0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending
			}
		}
		selectedApplications = [application]
	}
}

// MARK: - SceneState.Snapshot
extension SceneState: SnapshotCodable {
	struct Snapshot: Codable {
		let applications: [Application.Snapshot]
		let selectedApplications: Selection<Application>.Snapshot
	}

	var snapshot: Snapshot {
		.init(applications: applications.snapshot,
			selectedApplications: selectedApplications.snapshot)
	}
}

extension SceneState.Snapshot: PListCodable {
	var dictionaryRepresentation: [String: Any] {
		[
			"applications": applications.dictionaryRepresentation,
			"selectedApplications": selectedApplications.dictionaryRepresentation
		]
	}

	init(dictionaryRepresentation representation: Any?) throws {
		let representation = try representation as? [String:Any] ?! TypeMismatchError(representation, expected: [String:Any].self)
		applications = try .init(dictionaryRepresentation: representation["applications"])
		selectedApplications = try .init(dictionaryRepresentation: representation["selectedApplications"])
	}
}
