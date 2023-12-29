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
        UIView.animate(withDuration: TimeInterval(self.bounds.size.width/12),
                       delay:0,
                       options: [.repeat, .curveLinear],
        animations: {
            self.center = CGPoint(x:0 - self.bounds.size.width/2, y:self.center.y)
        })
    }
    func stopShowAll(){
        self.center = CGPoint(x:self.center.x, y:self.center.y)
        self.layer.removeAllAnimations()
    }
}
