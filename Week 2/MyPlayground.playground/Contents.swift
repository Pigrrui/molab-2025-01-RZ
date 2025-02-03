
// Draw 10print style maze using UIGraphic and CGContext drawPath
// Write created image to local file
// https://developer.apple.com/documentation/coregraphics/cgcontext
//

import UIKit


// Read in an image from a url string
func imageFor(_ str: String) -> UIImage {
    let url = URL(string: str)
    let imgData = try? Data(contentsOf: url!)
    let uiImage = UIImage(data:imgData!)
    return uiImage!
}

let dim = 1024.0
let backLevel = 0.0
let lineLen = 1 / 10.0
let strokeLen = 4 / 10.0

let renderer = UIGraphicsImageRenderer(size: CGSize(width: dim, height: dim))

var image = renderer.image { (context) in
    let ctx = context.cgContext
    let box = renderer.format.bounds
    UIColor.white.setFill();
    context.fill(box)
    let xlen = box.width * lineLen
    let ylen = box.height * lineLen
    ctx.setLineCap(.round)
    ctx.setStrokeColor(UIColor.black.cgColor)
    ctx.setLineWidth(xlen * strokeLen)
    var x = 0.0
    var y = 0.0
    while y < box.height {
        if Bool.random() {
            // Draw line top left to bottom right
            ctx.move(to: CGPoint(x: x, y: y))
            ctx.addLine(to: CGPoint(x: x+xlen, y: y+ylen))
        }
        else {
            // Draw line top right to bottom left
            ctx.move(to: CGPoint(x: x+xlen, y: y))
            ctx.addLine(to: CGPoint(x: x, y: y+ylen))
        }
        ctx.drawPath(using: .fillStroke)
        x += xlen
        if x > box.width {
            x = 0
            y += ylen
        }
    }
}



let u1 = "https://lh3.googleusercontent.com/a/AEdFTp6gdANzhWmT2dZ69WP2UB5edH-_ZitKIkD0Cwks=s280"
let img1 = imageFor(u1)


let sz2 = CGSize(width: 1024, height: 1024)
let renderer2 = UIGraphicsImageRenderer(size: sz2)
let image2 = renderer2.image { context in
    
    UIColor.red.setFill()
    context.fill(CGRect(x: 0, y: 0, width: 500, height: 500))
    UIColor.green.setFill()
    context.fill(CGRect(x: 500, y: 0, width: 500, height: 500))
    UIColor.yellow.setFill()

    UIColor.darkGray.setStroke()
    context.stroke(renderer.format.bounds)
    
    var box = renderer.format.bounds
    for _ in 1...4 {
        box = box.insetBy(dx: 30, dy: 30)
        context.stroke(box)
    }
    // UIColor(red: 158/255, green: 215/255, blue: 245/255, alpha: 1).setFill()
}




let sz = CGSize(width: 1024, height: 1024)
let renderer3 = UIGraphicsImageRenderer(size: sz)
let image3 = renderer3.image { (context) in
    image.draw(in: CGRect(x: 400, y: 400, width: 500, height: 500))
    image2.draw(in: CGRect(x: 0, y: 0, width: 1024, height: 1024))
    img1.draw(in: CGRect(x: 200, y: 200, width: 500, height: 500))
}


// get the bag of bits that represent the image as a png file
let data = image3.pngData()

let folder = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first

// Output path for the file in the Documents folder
// Use a different file name here to have file appear as most recently added
let filePath = folder!.appendingPathComponent("10print2024-09.png");

let err: ()? = try? data?.write(to: filePath)
print("err \(String(describing: err))\nfilePath \(filePath)")

// Terminal command 'cp' to copy output file to Downloads folder
// The trailing period means use the same file name as the source
print("cp \(filePath.absoluteString.dropFirst(7)) ~/Downloads/." )


