//
//  Formatter.swift
//  BearPlay
//
//  Created by 루딘 on 1/10/24.
//

import Foundation

extension TimeInterval{
    func toString() -> String{
        let formatter = DateComponentsFormatter()
        var result = formatter.string(from: self) ?? "0"
        
        if self < 10{
            result = "0:0" + result
        }else if self <= 59{
            result = "0:" + result
        }
        return result
    }
}
