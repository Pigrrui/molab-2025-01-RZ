import UIKit

var greeting = "Hello, playground"

import Foundation

let pattern = "✨🩰🎀🌙"

func getCharacter ( from str: String, at index: Int) -> String {
    let charIndex = str.index(str.startIndex, offsetBy: index)
    return String(str[charIndex])
}

func createLine (length: Int)-> String{
    var line = ""
    for _ in 0..<length{
        let randomIndex = Int.random(in: 0..<pattern.count)
        line += getCharacter(from:pattern, at: randomIndex)
    }
    return line
}

func createBlock(rows: Int, columns: Int){
    for _ in 0..<rows{
        print(createLine(length: columns))
    }
}

createBlock(rows: 6, columns: 10)
