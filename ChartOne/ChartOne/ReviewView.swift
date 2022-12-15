//
//  ReviewView.swift
//  ChartOne
//
//

import SwiftUI



import SwiftUICharts
import SwiftUI
import Charts



struct GradeData: Identifiable {
	var id = UUID()
	var averageGrade: Int32
	var condition: String
}


struct ReviewView: View {
	
	var gradeVShours: [GradeData]
	
	init(reviewItem: ReviewItem) {
		gradeVShours = [
			GradeData(averageGrade: reviewItem.getScore(scoreType: "high"), condition: "Well"), GradeData(averageGrade: reviewItem.getScore(scoreType: "low"), condition: "Not Well")]
	}
	var body: some View {
		if #available(iOS 16.0, *) {
		Chart {
			ForEach(self.gradeVShours) { shape in
				BarMark (
					x: .value("Total Grade", shape.averageGrade),
					y: .value("Grade Condition", shape.condition)
						)
					}
				}
		} else {
			Text("Upgrade to ios version 16.0 or higher")
			}
		}
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView(reviewItem: ReviewItem())
    }
}



