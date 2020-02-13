//
//  DashSetupViewModel.swift
//  DashKitUI
//
//  Created by Pete Schwamb on 2/10/20.
//  Copyright © 2020 Tidepool. All rights reserved.
//

import Foundation

enum SetupState: String {
    case registration
    case settings
    case pairPod
    case insertCannula
    case setupReview
}

class DashSetupViewModel: ObservableObject, Identifiable {
    
    @Published var setupState: SetupState?
    
    var _registrationManager: RegistrationManagerProtocol
    
    var registrationManager: RegistrationManagerProtocol {
        return self
    }
        
    init(registrationManager: RegistrationManagerProtocol) {
        self._registrationManager = registrationManager
        if !_registrationManager.isRegistered() {
            self.setupState = .registration
        } else {
            self.setupState = .settings
        }
    }
}

extension DashSetupViewModel: RegistrationManagerProtocol {
    func startRegistration(completion: @escaping (RegistrationStatus) -> ()) {
        _registrationManager.startRegistration { (status) in
            switch status {
            case .registered:
                self.setupState = .pairPod
            default:
                break
            }
            completion(status)
        }
    }
    
    func isRegistered() -> Bool {
        return _registrationManager.isRegistered()
    }
}

