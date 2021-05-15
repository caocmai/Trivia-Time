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
        return Array(Set(userDefaults.object(forKey: "Scores") as? [Int] ?? [])).sorted().reversed()
    }
    
    var body: some View {
        Text("Scores")
            .padding()
        
        if scores.count > 5 {
            ForEach(0...5, id: \.self) { i in
                Text(String(scores[i]))
            }
        } else {
            ForEach(scores, id: \.self) {score in
                Text(String(score))
                
            }
        }
        
        Button("Close") {
            presentationMode.wrappedValue.dismiss()
        }
        .font(.title)
        .foregroundColor(.white)
        .padding()
        .background(Color.orange)
        .cornerRadius(9)
        
        
    }
}
