//
//  RegisterView.swift
//  DashKitUI
//
//  Created by Pete Schwamb on 2/7/20.
//  Copyright © 2020 Tidepool. All rights reserved.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var viewModel: RegistrationViewModel
    
    init(viewModel: RegistrationViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        GuidePage {
            VStack {
                Image("Pod")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: nil)
                    .padding(30)

                Text("This device must be registered as a PDM. Registration requires internet access and is only required once per device.")
                
                self.viewModel.error?.errorDescription.map({ Text($0) })
                    .foregroundColor(Color(UIColor.red))
                    .padding()
                
                if self.viewModel.isRegistering || self.viewModel.isRegistered {
                    SetupIndicatorWrapperView(progressState: self.$viewModel.progressState)
                        .frame(width: 50, height: 50, alignment: .bottom)
                }
                
            }
            .padding()
            .background(Color(UIColor.tertiarySystemBackground).cornerRadius(6))
            .animation(.default)
            
            Spacer()

            Button(action: {
                self.viewModel.isRegistering = true
            }) {
                Text("Register")
                    .guideButtonStyle()
            }
            .disabled(self.viewModel.isRegistering)
        }
        .navigationBarTitle("Register Device", displayMode: .automatic)
    }
}

struct RegisterView_Previews: PreviewProvider {
    
    static let manager = MockRegistrationManager()
    
    static var previews: some View {
        GuidePagePreview {
            RegisterView(viewModel: RegistrationViewModel(registrationManager: manager))
        }
    }
}
