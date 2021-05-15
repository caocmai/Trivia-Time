//
//  ContentView.swift
//  TriviaTime
//
//  Created by Cao Mai on 5/4/21.
//

//// Currently not using
import SwiftUI

struct TabbarView: View {
    var body: some View {
        TabView {
            QuestionView()
                .tabItem {
                    Label(
                        title: { Text("Questions") },
                        icon: { Image(systemName: "questionmark.square.dashed") }
                    )
                }
            ScoresView()
                .tabItem {
                    Label(
                        title: { Text("Scores") },
                        icon: { Image(systemName: "list.number") }
                    )
                }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabbarView()
//    }
//}
