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
	@Published var applications: OrderedDictionary<Application.ID, Application> = [:]
	@Published var selectedApplication: Application.ID?
	var cancellables: Set<AnyCancellable> = []

	@MainActor
	convenience init() {
		do {
			let snapshot = try Snapshot(from: UserDefaults.standard, key: "applications")
			try self.init(snapshot: snapshot)
		} catch {
			log("error loading StateScene.Snapshot", error)
			self.init(_applications: [:])
		}
		NotificationCenter.default.publisher(for: NSApplication.willTerminateNotification)
			.sink { _ in self.snapshot.store(in: UserDefaults.standard, key: "applications") }
			.store(in: &cancellables)
		NotificationCenter.default.publisher(for: NSApplication.willResignActiveNotification)
			.sink { _ in self.snapshot.store(in: UserDefaults.standard, key: "applications") }
			.store(in: &cancellables)
	}

	init(_applications applications: [Application.ID: Application]) {
		_applications = .init(wrappedValue: OrderedDictionary(applications) {
			$0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending
		})
	}
	init(_applications applications: OrderedDictionary<Application.ID, Application>) {
		_applications = .init(wrappedValue: applications)
	}
	@MainActor
	init(snapshot: Snapshot) throws {
		let applications = try [Application](snapshot: snapshot.applications).sorted {
			$0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending
		}
		self.applications = OrderedDictionary(applications, key: \.id)
		selectedApplication = snapshot.selectedApplication
	}

	func application(withId id: Application.ID) -> Application? {
		applications[id]
	}
	func addApplication(_ application: Application, shoudSelect: Bool = true) {
		if nil == applications[application.id] {
			var applications = applications.merging([application.id: application]) { $1 }
			applications.sort {
				$0.value.name.localizedCaseInsensitiveCompare($1.value.name) == .orderedAscending
			}
			self.applications = applications
		}
		if shoudSelect {
			selectedApplication = application.id
		}
	}
	func setMenus(_ menus: [Application.MenuGroup], forApplication applicationId: String) {
		guard let application = applications[applicationId] else { return }
		application.menus = menus
	}
}

// MARK: - SceneState.Snapshot
extension SceneState: SnapshotCodable {
	struct Snapshot: Codable {
		let applications: [Application].Snapshot
		let selectedApplication: Application.ID?
	}

	var snapshot: Snapshot {
		.init(applications: applications.map { $1 }.snapshot,
			selectedApplication: selectedApplication)
	}
}

extension SceneState.Snapshot: PListCodable {
	var dictionaryRepresentation: [String: Any] {
		configure([
			"applications": applications.dictionaryRepresentation,
		]) {
			if let selectedApplication { $0["selectedApplication"] = selectedApplication }
		}
	}

	init(dictionaryRepresentation representation: Any?) throws {
		let representation = try representation as? [String:Any] ?! TypeMismatchError(representation, expected: [String:Any].self)
		applications = try representation["applications"].map { try .init(dictionaryRepresentation: $0) } ?? []
		selectedApplication = representation["selectedApplications"] as? Application.ID
	}
}
