//
//  CounterView.swift
//  Core Graphics Practice1
//
//  Created by Caroline LaDouce on 9/24/21.
//

import UIKit

class CounterView: UIView {
    
    
    private struct Constants {
        static let numberOfGlasses = 8
        static let lineWidth: CGFloat = 5.0
        static let arcWidth: CGFloat = 76
        
        static var halfOfLineWidth: CGFloat {
            return lineWidth/2
        }
    }
    
    var counter: Int = 0 {
        didSet {
            if counter <= Constants.numberOfGlasses {
                setNeedsDisplay()
            }
        }
    }
    
    
    var outlineColor: UIColor = UIColor.blue
    var counterColor: UIColor = UIColor.orange
    
    
    override func draw(_ rect: CGRect) {
        
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radius = max(bounds.width, bounds.height)
        
        let startAngle: CGFloat = 3 * .pi / 4
        let endAngle: CGFloat = .pi / 4
        
        // Draw the counter
        let path = UIBezierPath(
            arcCenter: center,
            radius: radius/2 - Constants.arcWidth/2,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true
        )
        
        path.lineWidth = Constants.arcWidth
        counterColor.setStroke()
        path.stroke()
        
        
        // Outline
        // Setup the counter outline
        let angleDifference: CGFloat = 2 * .pi - startAngle + endAngle
        let arcLengthPerGlass = angleDifference / CGFloat(Constants.numberOfGlasses)
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        // Setup the outer arc
        let outerArcRadius = bounds.width/2 - Constants.halfOfLineWidth
        let outlinePath = UIBezierPath(
            arcCenter: center,
            radius: outerArcRadius,
            startAngle: startAngle,
            endAngle: outlineEndAngle,
            clockwise: true
        )
        
        // Setup the inner arc
        let innerArcRadius = bounds.width/2 - Constants.arcWidth + Constants.halfOfLineWidth
        
        // Draw the outline
        outlinePath.addArc(
            withCenter: center,
            radius: innerArcRadius,
            startAngle: outlineEndAngle,
            endAngle: startAngle,
            clockwise: false
        )
        
        // Close the path
        outlinePath.close()
        
        
        outlineColor.setStroke()
        outlinePath.lineWidth = Constants.lineWidth
        outlinePath.stroke()
        
    } // End func
    
    
    
}
