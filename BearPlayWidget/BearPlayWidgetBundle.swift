//
//  BearPlayWidgetBundle.swift
//  BearPlayWidget
//
//  Created by 루딘 on 11/24/23.
//

import WidgetKit
import SwiftUI

@main
struct BearPlayWidgetBundle: WidgetBundle {
    var body: some Widget {
        BearPlayWidget()
        BearPlayWidgetLiveActivity()
    }
}
