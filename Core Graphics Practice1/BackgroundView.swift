//
//  BackgroundView.swift
//  Core Graphics Practice1
//
//  Created by Caroline LaDouce on 9/29/21.
//

import UIKit

class BackgroundView: UIView {
    
    var lightColor: UIColor = .purple
    var darkColor: UIColor = .systemPurple
    var patternSize: CGFloat = 200
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            fatalError("\(#function):\(#line) Failed to get current context.")
        }
        
        context.setFillColor(UIColor.systemBlue.cgColor)
        
        context.fill(rect)
        
        let drawSize = CGSize(width: patternSize, height: patternSize)
        
        
        UIGraphicsBeginImageContextWithOptions(drawSize, true, 0.0)
        
        guard let drawingContext = UIGraphicsGetCurrentContext() else {
            fatalError("\(#function):\(#line) Failed to get current context.")
        }
        
        darkColor.setFill()
        drawingContext.fill(CGRect(x: 0, y: 0, width: drawSize.width, height: drawSize.height))
        
        
        let trianglePath = UIBezierPath()
        
        // Setup "top" wide triangle
        trianglePath.move(to: CGPoint(x: drawSize.width / 2, y:0))
        trianglePath.addLine(to: CGPoint(x: 0, y: drawSize.height/2))
        trianglePath.addLine(to: CGPoint(x: drawSize.width, y: drawSize.height / 2))
        
        // Setup "left" triangle that is half the size of "top" wide triangle
        trianglePath.move(to: CGPoint(x: 0, y: drawSize.height / 2))
        trianglePath.addLine(to: CGPoint(x: drawSize.width / 2, y: drawSize.height))
        trianglePath.addLine(to: CGPoint(x: 0, y: drawSize.height))
        
        // Setup "right" triangle that is the same size as the "left" triangle
        trianglePath.move(to: CGPoint(x: drawSize.width, y: drawSize.height / 2))
        trianglePath.addLine(to: CGPoint(x: drawSize.width / 2, y: drawSize.height))
        trianglePath.addLine(to: CGPoint(x: drawSize.width, y: drawSize.height))
        
        lightColor.setFill()
        trianglePath.fill()
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { fatalError("""
    \(#function):\(#line) Failed to \
    get an image from current context.
    """)
        }
        UIGraphicsEndImageContext()
        
        UIColor(patternImage: image).setFill()
        context.fill(rect)
        
        
    }
    
    
    
}
