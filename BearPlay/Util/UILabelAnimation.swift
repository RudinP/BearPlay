//
//  UILabelAnimation.swift
//  BearPlay
//
//  Created by 루딘 on 12/29/23.
//

import Foundation
import UIKit

extension UILabel {
    func showAll(){
        self.layer.removeAllAnimations()
        
        let superview = self.superview!
        let duration = TimeInterval(self.bounds.width/32)
        
        if superview.bounds.width >= self.bounds.width{
            return
        }
        
        UIView.animate(withDuration: duration,
                       delay:0,
                       options: [.repeat, .curveLinear, .beginFromCurrentState],
        animations: {
            self.center.x = superview.center.x + superview.bounds.width/2.0 - self.bounds.width/2.0 - 16
        })
    }
}
