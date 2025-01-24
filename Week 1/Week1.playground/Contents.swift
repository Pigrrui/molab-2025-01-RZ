import UIKit

var greeting = "Hello, playground"

import Foundation

let pattern = "✨🩰🎀🌙"

func multiplyPattern(number: Int) -> String {
    return String(repeating: pattern, count: number)
}

func createArt() {
    for i in 1...10 {
        print(multiplyPattern(number: i))
    }
}

createArt()
