//
//  PairPodSetupView.swift
//  DashKitUI
//
//  Created by Pete Schwamb on 2/5/20.
//  Copyright © 2020 Tidepool. All rights reserved.
//

import SwiftUI

struct PairPodSetupView: View {
    
    var body: some View {
        GuidePage {
            VStack {
                Image("Pod")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: nil)
                    .padding(30)

                InstructionListView(instructions: [
                    "Prepare site.",
                    "Remove blue Pod needle cap and check cannula. Then remove paper backing.",
                    "Check Pod and then apply to site."
                ])
            }
            .padding()
            .background(Color(UIColor.tertiarySystemBackground).cornerRadius(6))
            Spacer()

            Button(action: {
                print("Insert Cannula button tapped!")
            }) {
                Text("Insert Cannula")
                    .guideButtonStyle()
            }
        }
        .navigationBarTitle("Insert Cannula", displayMode: .automatic)
    }
}

struct PairPodSetupView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
                Color(UIColor.secondarySystemBackground).edgesIgnoringSafeArea(.all)
                PairPodSetupView()
            }
        }
        //.environment(\.colorScheme, .dark)
        //.environment(\.sizeCategory, .accessibilityLarge)
    }
}
