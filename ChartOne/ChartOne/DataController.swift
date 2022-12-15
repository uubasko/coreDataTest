//
//  DataController.swift
//  ChartOne
//
//

import Foundation
import CoreData


class DataController: ObservableObject {
	static var shared = DataController()
	let container = NSPersistentContainer(name: "StudentData")
	
	init() {
		container.loadPersistentStores(completionHandler: { description, error in
			if let error = error {
				print("Core data failed to laod: \(error.localizedDescription)")
			}
		})
	}
	
	func getScoreFromCoreData(scoreType: String) -> [Int32] {
		//      let filter: NSPredicate
		var scoreData: [GradeTable]
		var listScore: [Int32] = []
		
		let fetchRequest: NSFetchRequest<GradeTable> = GradeTable.fetchRequest()
		fetchRequest.returnsObjectsAsFaults = false
		
		if scoreType == "high" {
			let filter = NSPredicate(format: "score >= %@", 85)   //Error thrown here
			fetchRequest.predicate = filter
		}
		else {
			let filter = NSPredicate(format: "score <= %@", 85)
			fetchRequest.predicate = filter
		}
		
		do {
			scoreData = try container.viewContext.fetch(fetchRequest)
		} catch let error {
			print("ERROR while fetching data from db array \(error.localizedDescription)")
			return []
		}
		
		for item in scoreData {
			listScore.append(item.score)
		}
		return listScore
	}
	
	
	func saveToCoreData(name: String, score: Int32) {
		let gradeTable = GradeTable(context: container.viewContext)
		gradeTable.uuid = UUID()
		gradeTable.name = name
		gradeTable.score = score
		
		do {
			try container.viewContext.save()
			print("Saved")
		} catch let error {
			print("Error: \(error.localizedDescription)")
		}
	}
}
