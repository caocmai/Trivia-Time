//
//  WelcomeView.swift
//  TriviaTime
//
//  Created by Cao Mai on 5/13/21.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var questionController: QuestionController
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    var body: some View {
        VStack(spacing: 10) {
            
            Text("TRIVIA TIME")
                .font(.headline)
            
            
            Button {
                self.viewControllerHolder?.present(style: .fullScreen) {
                    QuestionView()
                        .environmentObject(questionController)
                }
            } label: {
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


//// https://stackoverflow.com/questions/58958858/present-a-new-view-in-swiftui
struct ViewControllerHolder {
    weak var value: UIViewController?
}

struct ViewControllerKey: EnvironmentKey {
    static var defaultValue: ViewControllerHolder {
        return ViewControllerHolder(value: UIApplication.shared.windows.first?.rootViewController)
        
    }
}

extension EnvironmentValues {
    var viewController: UIViewController? {
        get { return self[ViewControllerKey.self].value }
        set { self[ViewControllerKey.self].value = newValue }
    }
}


extension UIViewController {
    func present<Content: View>(style: UIModalPresentationStyle = .automatic, @ViewBuilder builder: () -> Content) {
        let toPresent = UIHostingController(rootView: AnyView(EmptyView()))
        toPresent.modalPresentationStyle = style
        toPresent.rootView = AnyView(
            builder()
                .environment(\.viewController, toPresent)
        )
        NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "dismissModal"), object: nil, queue: nil) { [weak toPresent] _ in
            toPresent?.dismiss(animated: true, completion: nil)
        }
        self.present(toPresent, animated: true, completion: nil)
    }
}
