//
//  BearPlayWidgetLiveActivity.swift
//  BearPlayWidget
//
//  Created by 루딘 on 11/24/23.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct BearPlayWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct BearPlayWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: BearPlayWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension BearPlayWidgetAttributes {
    fileprivate static var preview: BearPlayWidgetAttributes {
        BearPlayWidgetAttributes(name: "World")
    }
}

extension BearPlayWidgetAttributes.ContentState {
    fileprivate static var smiley: BearPlayWidgetAttributes.ContentState {
        BearPlayWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: BearPlayWidgetAttributes.ContentState {
         BearPlayWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: BearPlayWidgetAttributes.preview) {
   BearPlayWidgetLiveActivity()
} contentStates: {
    BearPlayWidgetAttributes.ContentState.smiley
    BearPlayWidgetAttributes.ContentState.starEyes
}
