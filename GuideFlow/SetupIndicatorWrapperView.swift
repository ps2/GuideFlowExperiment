//
//  SetupIndicatorWrapperView.swift
//  DashKitUI
//
//  Created by Pete Schwamb on 2/11/20.
//  Copyright © 2020 Tidepool. All rights reserved.
//

import SwiftUI
import UIKit

struct SetupIndicatorWrapperView: UIViewRepresentable {
    
    @Binding var progressState: SetupIndicatorView.State

    func makeUIView(context: Context) -> SetupIndicatorView {
        return SetupIndicatorView()

    }

    func updateUIView(_ uiView: SetupIndicatorView, context: Context) {
        uiView.state = progressState
    }
}


