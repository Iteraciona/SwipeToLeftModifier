// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SwiftUI

struct SwipeToLeftGesture: UIViewControllerRepresentable {
    var onSwipe: () -> Void
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let viewController = UIViewController()
        let gestureRecognizer = UIPanGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePan))
        viewController.view.addGestureRecognizer(gestureRecognizer)
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        //
    }
    
    class Coordinator: NSObject {
        var swipeBackGesture: SwipeToLeftGesture
        
        init(_ swipeBackGesture: SwipeToLeftGesture) {
            self.swipeBackGesture = swipeBackGesture
        }
        
        @objc @MainActor func handlePan(gestureRecognizer: UIPanGestureRecognizer) {
            let translation = gestureRecognizer.translation(in: nil)
            let progress = translation.x / 200
            
            if gestureRecognizer.state == .changed {
                if progress > 0.25 {
                    swipeBackGesture.onSwipe()
                }
            }
            
        }
    }
}

struct SwipeToLeftModifier: ViewModifier {
    var onSwipe: () -> Void
    
    func body(content: Content) -> some View {
        content
            .background(
                SwipeToLeftGesture {
                    onSwipe()
                }
                    .frame(height: UIScreen.main.bounds.height)
            )
    }
}

extension View {
    func swipeToLeftGesture(onSwipe: @escaping () -> Void) -> some View {
        self.modifier(SwipeToLeftModifier(onSwipe: onSwipe))
    }
}
