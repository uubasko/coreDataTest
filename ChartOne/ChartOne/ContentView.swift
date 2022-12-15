//
//  ContentView.swift
//  ChartOne
//
//

import SwiftUICharts
import SwiftUI
import Charts



struct ContentView: View {
	@State private var name = ""
	@State private var score = ""
	var reviewItem: ReviewItem
	@State private var displayNewView = false
	
	var body: some View {
		NavigationView{
			VStack {
				NavigationLink(destination: ReviewView(reviewItem: ReviewItem()), isActive: self.$displayNewView) { EmptyView() }
				Form {
					TextField("Name", text: $name)
					TextField("Score", text: $score)
				}
				.toolbar {
					Button("add") {
						reviewItem.saveReviewData(name: name, score: Int32(score)!)
						self.displayNewView = true
					}
				}
			}
		}
	}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView(reviewItem: ReviewItem())
    }
}


