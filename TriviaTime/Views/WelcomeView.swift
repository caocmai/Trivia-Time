//
//  WelcomeView.swift
//  TriviaTime
//
//  Created by Cao Mai on 5/13/21.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var questionController: QuestionController
    
    var body: some View {
        
        NavigationView{
            VStack(spacing: 10) {
                
                Text("TRIVIA TIME")
                    .font(.headline)
                
                NavigationLink(
                    destination: QuestionView()
                        .environmentObject(questionController)
                ) {
                    
                    Text("PLAY")
                        .font(.title)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .frame(width: 300.0, height: 50.0)
                        .background(Color(UIColor.blue))
                        .cornerRadius(25)
                    
                }
                
            }
        }
        
        
    }
}
