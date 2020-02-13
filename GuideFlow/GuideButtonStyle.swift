//
//  GuideButtonStyle.swift
//  DashKitUI
//
//  Created by Pete Schwamb on 2/7/20.
//  Copyright © 2020 Tidepool. All rights reserved.
//

import SwiftUI

struct GuideButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(.all)
            .foregroundColor(.white)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(8)
            .padding(.bottom)
    }
}

extension View {
    func guideButtonStyle() -> some View {
        ModifiedContent(content: self, modifier: GuideButtonStyle())
    }
}

