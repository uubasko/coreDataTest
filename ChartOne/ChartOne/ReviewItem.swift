//
//  ReviewItem.swift
//  ChartOne
//
//

import Foundation


class ReviewItem: NSObject, ObservableObject {
	let coreDM: DataController = DataController.shared
	
	override init() {
		super.init()
	}
	
	func getListScore(scoreType: String) -> [Int32] {
		let score = coreDM.getScoreFromCoreData(scoreType: scoreType)
		return score
	}
	
	func getScore(scoreType: String) -> Int32 {
		var listScore = getListScore(scoreType: scoreType)
		let totalCount = scoreType.count
		let totalSum = listScore.reduce(0, +)
		return totalSum/Int32(totalCount)
	}
	
	
	func saveReviewData(name: String, score: Int32) {
		coreDM.saveToCoreData(name: name, score: score)
	}
}
