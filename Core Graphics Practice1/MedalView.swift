//
//  MedalView.swift
//  Core Graphics Practice1
//
//  Created by Caroline LaDouce on 9/29/21.
//

import UIKit

class MedalView: UIImageView {
    
    lazy var medalImage = createMedalImage()
    
    func showMedal(show: Bool) {
        image = (show == true) ? medalImage : nil
    }
    
    
    
    func createMedalImage() -> UIImage {
        debugPrint("creating Medal Image")
        
        
        let size = CGSize(width: 200, height: 200)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        guard let context = UIGraphicsGetCurrentContext() else {
            fatalError("\(#function):\(#line) Failed to get current context.")
        }
        
        let darkGoldColor = UIColor(red: 0.6, green: 0.5, blue: 0.15, alpha: 1.0)
        let midGoldColor = UIColor(red: 0.86, green: 0.73, blue: 0.3, alpha: 1.0)
        let lightGoldColor = UIColor(red: 1.0, green: 0.98, blue: 0.9, alpha: 1.0)
        
        
        // Background ribbon
        let lowerRibbonPath = UIBezierPath()
        lowerRibbonPath.move(to: CGPoint(x: 0, y: 0))
        lowerRibbonPath.addLine(to: CGPoint(x: 40, y: 0))
        lowerRibbonPath.addLine(to: CGPoint(x: 78, y: 70))
        lowerRibbonPath.addLine(to: CGPoint(x: 38, y: 70))
        lowerRibbonPath.close()
        
        UIColor.red.setFill()
        lowerRibbonPath.fill()
        
        // Clasp
        let claspPath = UIBezierPath(roundedRect: CGRect(x: 36, y: 62, width: 43, height: 20), cornerRadius: 5)
        claspPath.lineWidth = 5
        darkGoldColor.setStroke()
        claspPath.stroke()
        
        // Disc
        let discPath = UIBezierPath(
            ovalIn: CGRect(x: 8, y: 60, width: 100, height: 100)
        )
        context.saveGState()
        discPath.addClip()
        
        let colors = [
            darkGoldColor.cgColor,
            midGoldColor.cgColor,
            lightGoldColor.cgColor
        ] as CFArray
        
        guard let gradient = CGGradient(
            colorsSpace: CGColorSpaceCreateDeviceRGB(),
            colors: colors,
            locations: [0, 0.51, 1])
        else {
            fatalError("""
                    Failed to instantiate an instance \
                    of \(String(describing: CGGradient.self))
                    """)
        }
        
        context.drawLinearGradient(
            gradient,
            start: CGPoint(x: 40, y: 40),
            end: CGPoint(x: 40, y: 162),
            options: [])
        
        context.restoreGState()
        
        // Create a transform
        // Scale it, and translate it right and down
        var transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        transform = transform.translatedBy(x: 15, y: 30)
        discPath.lineWidth = 2.0
        
        // Apply the transform to the path
        discPath.apply(transform)
        discPath.stroke()
        
        // Upper Ribbon
        let upperRibbonPath = UIBezierPath()
        upperRibbonPath.move(to: CGPoint(x: 68, y: 0))
        upperRibbonPath.addLine(to: CGPoint(x: 108, y: 0))
        upperRibbonPath.addLine(to: CGPoint(x: 78, y: 70))
        upperRibbonPath.addLine(to: CGPoint(x: 38, y: 70))
        upperRibbonPath.close()
        
        UIColor.blue.setFill()
        upperRibbonPath.fill()
        
        // Draw the number on the disc
        // Must be NSString to be able to use draw(in:)
        let numberOne = "1" as NSString
        let numberOneRect = CGRect(x: 47, y: 90, width: 50, height: 50)
        guard let font = UIFont(name: "Academy Engraved LET", size: 60) else {
            fatalError("""
                    \(#function):\(#line) Failed to instantiate font \
                    with name \"Academy Engraved LET\"
                    """)
        }
        
        let numberOneAttributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: darkGoldColor
        ]
        
        numberOne.draw(in: numberOneRect, withAttributes: numberOneAttributes)
        
        // Add shadow to the disc
        let shadow = UIColor.black.withAlphaComponent(0.8)
        let shadowOffset = CGSize(width: 2.0, height: 2.0)
        let shadowBlurRadius: CGFloat = 5
        
        context.setShadow(
            offset: shadowOffset,
            blur: shadowBlurRadius,
            color: shadow.cgColor)
        
        context.beginTransparencyLayer(auxiliaryInfo: nil)
        context.endTransparencyLayer()
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            fatalError("""
            \(#function):\(#line) Failed to get an \
            image from current context.
            """)
        }
        
        UIGraphicsEndImageContext()
        return image
        
    } // End func
    
    
    
    
}
