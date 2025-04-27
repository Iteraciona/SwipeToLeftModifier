# SwipeToLeftModifier

A simple SwiftUI modifier that enables swipe-to-left gesture support when the native back button is hidden using `.navigationBarBackButtonHidden(true)`.

## Description

The `SwipeToLeftModifier` is a SwiftUI view modifier that restores the swipe-to-left gesture to navigate back when using `.navigationBarBackButtonHidden(true)` in your navigation view. This is helpful when you want to hide the default back button but still retain the ability for users to swipe from the left edge to go back.

By using this modifier, you can easily add swipe gestures without interfering with your custom navigation setup.

## Features
- Restore swipe-to-left gesture functionality for navigation.
- Designed for use when hiding the back button using `.navigationBarBackButtonHidden(true)`.
- Fully compatible with SwiftUI and UIKit integration.

## Usage

1. Add the `SwipeToLeftModifier` to your SwiftUI view.
2. Use the `.swipeToLeftGesture()` method to specify the action to take when the gesture is recognized.

### Example Usage

```swift
import SwiftUI

struct ContentView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Swipe left to go back")
        }
        .navigationBarBackButtonHidden(true) // Hide the back button
        .swipeToLeftGesture {
            // Action to perform when swipe gesture is detected
            print("Swiped left!")
            presentationMode.wrappedValue.dismiss()
        }
    }
}
```

## Installation

You can integrate this package into your project using Swift Package Manager.

1. In Xcode, go to `File > Swift Packages > Add Package Dependency`.
2. Enter the GitHub URL for this repository and select the version you want to install.

## Requirements
- iOS 17.0 or later
- Swift 5.7 or later

## License
This project is licensed under the MIT License - see the LICENSE file for details.
