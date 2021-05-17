//
//  ScoreView.swift
//  TriviaTime
//
//  Created by Cao Mai on 5/4/21.
//

import SwiftUI


struct ScoresView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let userDefaults = UserDefaults.standard
    
    var scores: [Int] {
        return Array(Set(userDefaults.object(forKey: "Scores") as? [Int] ?? [])).sorted().reversed() // remove duplicates and sort in descending order
    }
    
    var body: some View {
        ZStack{
            Color.yellow
            VStack(spacing: 30) {
                Text("Top Scores")
                    .padding()
                    .font(.system(size: 40))
                
                if scores.count > 5 {
                    ForEach(0...4, id: \.self) { i in
                        Text(String(scores[i]))
                            .font(.headline)
                    }
                } else {
                    ForEach(scores, id: \.self) {score in
                        Text(String(score))
                            .font(.headline)
                        
                    }
                }
                
                Button("Close") {
                    presentationMode.wrappedValue.dismiss()
                }
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .frame(width: 250.0, height: 50.0)
                .background(Color.orange)
                .cornerRadius(9)
                
            }
        }
    }
}
