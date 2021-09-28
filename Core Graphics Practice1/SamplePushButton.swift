//
//  SamplePushButton.swift
//  Core Graphics Practice1
//
//  Created by Caroline LaDouce on 9/23/21.
//

import UIKit

class SamplePushButton: UIButton {
    
    //    var fillColor: UIColor = .green
    var isAddButton: Bool = false
    
    var fillColor: UIColor = .purple
    
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        
        if isAddButton == false {
            fillColor = .systemBlue
        } else {
            fillColor = .systemTeal
            
        }
        
        fillColor.setFill()
        path.fill()
        
        
        // Setup constants for horizontal line
        let plusWidth = min(bounds.width, bounds.height) * Constants.plusButtonScale
        let halfPlusWidth = plusWidth / 2
        
        let plusPath = UIBezierPath()
        
        plusPath.lineWidth = Constants.plusLineWidth
        
        plusPath.move(to: CGPoint(
            x: halfWidth - halfPlusWidth + Constants.halfPointShift,
            y: halfHeight + Constants.halfPointShift
        ))
        
        plusPath.addLine(to: CGPoint(
            x: halfWidth + halfPlusWidth + Constants.halfPointShift,
            y: halfHeight + Constants.halfPointShift
        ))
        
        
        // Vertical Line
        if isAddButton {
            plusPath.move(to: CGPoint(
                x: halfWidth + Constants.halfPointShift,
                y: halfHeight - halfPlusWidth + Constants.halfPointShift
            ))
            
            plusPath.addLine(to: CGPoint(
                x: halfWidth + Constants.halfPointShift,
                y: halfHeight + halfPlusWidth + Constants.halfPointShift
            ))
        }
        
        
        fillColor.setFill()
        
        
        // Set color of lines and then draw them
        UIColor.white.setStroke()
        plusPath.stroke()
        
    } // End
    
    
    private struct Constants {
        static let plusLineWidth: CGFloat = 3.0
        static let plusButtonScale: CGFloat = 0.6
        static let halfPointShift: CGFloat = 0.5
    }
    
    private var halfWidth: CGFloat {
        return bounds.width/2
    }
    
    private var halfHeight: CGFloat {
        return bounds.height/2
    }
    
    
    
    
    
    
}
