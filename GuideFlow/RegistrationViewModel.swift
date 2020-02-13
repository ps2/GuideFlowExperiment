//
//  RegistrationViewModel.swift
//  DashKitUI
//
//  Created by Pete Schwamb on 2/10/20.
//  Copyright © 2020 Tidepool. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class RegistrationViewModel: ObservableObject, Identifiable {
    @Published var error: RegistrationError?
    
    @Published var progressState: SetupIndicatorView.State
    
    @Published var isRegistered: Bool
    
    @Published var isRegistering: Bool {
        didSet {
            print("isRegistering; didSet = \(isRegistering)")
        }
    }
    
    private var registrationManager: RegistrationManagerProtocol

    private var disposables = Set<AnyCancellable>()

    init(registrationManager: RegistrationManagerProtocol) {
        self.registrationManager = registrationManager
        isRegistered = registrationManager.isRegistered()
        isRegistering = false
        progressState = .hidden
        
        _ = self.$isRegistering.sink(receiveValue: { (isRegistering) in
            if isRegistering {
                self.progressState = .indeterminantProgress
                self.register()
            }
        }).store(in: &disposables)
        
        _ = $isRegistered.sink(receiveValue: { (isRegistered) in
            if isRegistered {
                self.progressState = .completed
            }
        }).store(in: &disposables)
    }
    
    private func register() {
        error = nil
        registrationManager.startRegistration { (status) in
            self.isRegistering = false
            switch status {
            case .registered:
                self.isRegistered = true
            default:
                self.error = RegistrationError(registrationStatus: status)
            }
        }
    }
}
