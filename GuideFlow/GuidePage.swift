//
//  GuidePage.swift
//  GuideFlow
//
//  Created by Pete Schwamb on 2/13/20.
//  Copyright © 2020 Pete Schwamb. All rights reserved.
//

import SwiftUI

struct GuidePage<Content>: View where Content: View {
    
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ZStack {
            Color(UIColor.secondarySystemBackground).edgesIgnoringSafeArea(.all)
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        self.content()
                    }
                    .padding([.leading, .trailing])
                    .frame(minHeight: geometry.size.height)
                }
            }
        }
    }
}
