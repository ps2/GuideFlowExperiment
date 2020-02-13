//
//  DashSetupView.swift
//  DashKitUI
//
//  Created by Pete Schwamb on 2/10/20.
//  Copyright © 2020 Tidepool. All rights reserved.
//

import SwiftUI

struct DashSetupView: View {
    @ObservedObject var viewModel: DashSetupViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: RegisterView(viewModel: RegistrationViewModel(registrationManager: viewModel.registrationManager))
                        .navigationBarBackButtonHidden(true),
                    tag: SetupState.registration,
                    selection: $viewModel.setupState) {
                    Text(SetupState.registration.rawValue)
                }
                NavigationLink(
                    destination: PairPodSetupView()
                        .navigationBarBackButtonHidden(true),
                    tag: SetupState.pairPod,
                    selection: $viewModel.setupState) {
                    Text(SetupState.pairPod.rawValue)
                }
            }
        }
    }
}

struct DashSetupView_Previews: PreviewProvider {
    static let manager = MockRegistrationManager()

    static var previews: some View {
        DashSetupView(viewModel: DashSetupViewModel(registrationManager: manager))
    }
}
