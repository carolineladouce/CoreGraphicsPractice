//
//  MedalView.swift
//  Core Graphics Practice1
//
//  Created by Caroline LaDouce on 9/29/21.
//

import UIKit

class MedalView: UIView {

    override func draw(_ rect: CGRect) {
        let size = CGSize(width: 120, height: 200)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        guard let context = UIGraphicsGetCurrentContext() else {
            fatalError("\(#function):\(#line) Failed to get current context.")
        }
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
    

}
