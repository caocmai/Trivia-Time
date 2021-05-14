//
//  ScoreView.swift
//  TriviaTime
//
//  Created by Cao Mai on 5/4/21.
//

import SwiftUI


struct ScoresView: View {
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        Text("Scores View")
            .padding()
        
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
