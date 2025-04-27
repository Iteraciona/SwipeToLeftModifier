// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SwiftUI

public struct SwipeToLeftGesture: UIViewControllerRepresentable {
    public var onSwipe: () -> Void
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    public func makeUIViewController(context: Context) -> some UIViewController {
        let viewController = UIViewController()
        let gestureRecognizer = UIPanGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePan))
        viewController.view.addGestureRecognizer(gestureRecognizer)
        
        return viewController
    }
    
    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        //
    }
    
    public class Coordinator: NSObject {
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

public struct SwipeToLeftModifier: ViewModifier {
    public var onSwipe: () -> Void
    
    public func body(content: Content) -> some View {
        content
            .background(
                SwipeToLeftGesture {
                    onSwipe()
                }
                    .frame(height: UIScreen.main.bounds.height)
            )
    }
}

public extension View {
    func swipeToLeftGesture(onSwipe: @escaping () -> Void) -> some View {
        self.modifier(SwipeToLeftModifier(onSwipe: onSwipe))
    }
}
