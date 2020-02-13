//
//  GuidePagePreview.swift
//  DashKitUI
//
//  Created by Pete Schwamb on 2/7/20.
//  Copyright © 2020 Tidepool. All rights reserved.
//

import SwiftUI

struct GuidePagePreview<Content>: View where Content: View {
    
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor.secondarySystemBackground).edgesIgnoringSafeArea(.all)
                self.content()
            }
        }
    }
}


struct GuidePagePreview_Previews: PreviewProvider {
    static var previews: some View {
        GuidePagePreview {
            Text("Some Content")
        }
    }
}
