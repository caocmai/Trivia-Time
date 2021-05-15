//
//  QuestionView.swift
//  TriviaTime
//
//  Created by Cao Mai on 5/4/21.
//

import SwiftUI


struct QuestionView: View {
    
    @EnvironmentObject var questionController: QuestionController
    @State private var firstTime = true
    @State private var questionIndex = 0
    @State private var showAlert = false
    @State private var activeAlert: ActiveAlert = .play
    @State private var isCorrect = false
    @State private var lives = 5
    @State private var score = 0
    
    @State private var showScore = false
    
    private var questions: [QuestionViewModel] {
        return questionController.allQuestions
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 60) {
                Spacer()
                if questions.isEmpty {
                    Text("Loading Questions....")
                } else {
                    HStack {
                        Text("Lives \(lives)")
                        Text("Score \(score)")
                        Spacer()
                        Button {
                            print("Image tapped!")
                            showScore.toggle()
                        } label: {
                            Text("High Scores")
                        }
                    }.padding()
//                    Spacer()
                    Text(questions[questionIndex].question)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(.white)
                        .font(.title)
                        .padding()
                    
                    let choices = questions[questionIndex].allChoices()
                    VStack(spacing: 15) {
                        ForEach(choices, id: \.self) { choice in
                            Button {
                                self.isCorrect = questions[questionIndex].checkAnswer(chosenAnswer: choice)
                                
                                if self.isCorrect {
                                    print("You got it right!")
                                    score += 300
                                } else {
                                    print("You got it wrong, sorry")
                                    lives -= 1
                                    if lives == 0 {
                                        self.activeAlert = .gameover
                                    } else {
                                        self.activeAlert = .play
                                    }
                                    
                                }
                                showAlert = true
                                
                            } label: {
                                Text(choice)
                                    .foregroundColor(.white)
                                    .font(.title2)
                                
                            }
                        }
                    }
                }
                Spacer()
            }
            
            .onAppear { firstRequest() }
            
            .alert(isPresented: $showAlert) {
                switch activeAlert {
                case .play:
                    return Alert(title: Text(self.isCorrect ? "Right":"Wrong"), message: Text(self.isCorrect ? "Nice": "The answer was \(questions[questionIndex].correctAnswer)"), dismissButton: .default(Text("Continue")) {
                        self.askQuestion()
                    })
                    
                case .gameover:
                    return  Alert(title: Text("GAME OVER").foregroundColor(.red), message: Text("Your score was \(score)"), dismissButton: .default(Text("Play Again")) {
                        let userDefaults = UserDefaults.standard
                        var scores = userDefaults.object(forKey: "Scores") as? [Int] ?? []
                        scores.append(score)
                        userDefaults.set(scores, forKey: "Scores")
                        self.resetGame()
           
                    })
                }
            }
            .sheet(isPresented: $showScore) {
                ScoresView()
            }
        }
    }
    
}


private extension QuestionView {
    //MARK: - Methods
    func firstRequest() {
        if firstTime {
            self.questionController.fetchResult()
        }
        firstTime = false
    }
    
    func nextRequest() {
        self.questionController.fetchResult()
    }
    
    func askQuestion() {
        if (questionIndex == questions.count - 1) {
            questionIndex = 0
            nextRequest()
        } else {
            questionIndex += 1
        }
    }
    
    func resetGame() {
        self.lives = 5
        self.score = 0
        self.askQuestion()
    }
}


enum ActiveAlert {
    case play, gameover
}
