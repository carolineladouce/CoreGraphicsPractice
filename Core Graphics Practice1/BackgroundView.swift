//
//  BackgroundView.swift
//  Core Graphics Practice1
//
//  Created by Caroline LaDouce on 9/29/21.
//

import UIKit

class BackgroundView: UIView {
    
    var lightColor: UIColor = .orange
    var darlColor: UIColor = .yellow
    var patternSize: CGFloat = 200
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            fatalError("\(#function):\(#line) Failed to get current context.")
        }
        
        context.setFillColor(UIColor.systemBlue.cgColor)
        
        context.fill(rect)
        
        
        let drawSize = CGSize(width: patternSize, height: patternSize)
        
        let trianglePath = UIBezierPath()
        trianglePath.move(to: CGPoint(x: drawSize.width / 2, y:0))
        trianglePath.addLine(to: CGPoint(x: 0, y: drawSize.height/2))
        trianglePath.addLine(to: CGPoint(x: drawSize.width, y: drawSize.height / 2))
        
        trianglePath.move(to: CGPoint(x: 0, y: drawSize.height / 2))
        trianglePath.addLine(to: CGPoint(x: drawSize.width / 2, y: drawSize.height))
        trianglePath.addLine(to: CGPoint(x: 0, y: drawSize.height))
        
        trianglePath.move(to: CGPoint(x: drawSize.width, y: drawSize.height / 2))
        trianglePath.addLine(to: CGPoint(x: drawSize.width / 2, y: drawSize.height))
        trianglePath.addLine(to: CGPoint(x: drawSize.width, y: drawSize.height))
        
        lightColor.setFill()
        trianglePath.fill()
        
    }

 

}
