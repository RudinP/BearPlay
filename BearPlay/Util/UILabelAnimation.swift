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
        if let superview = self.superview{
            self.layer.removeAllAnimations()

            if superview.bounds.width >= self.bounds.width{
                return
            }

            let duration = TimeInterval(self.bounds.width/32)
            
            UIView.animate(withDuration: duration,
                           delay:0,
                           options: [.repeat, .curveLinear],
            animations: {
                self.center.x = superview.center.x + superview.bounds.width/2.0 - self.bounds.width/2.0 - 16
            })
        }
    }
}
