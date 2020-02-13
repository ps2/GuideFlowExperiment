//
//  RegistrationManager.swift
//  GuideFlow
//
//  Created by Pete Schwamb on 2/13/20.
//  Copyright © 2020 Pete Schwamb. All rights reserved.
//

import Foundation

public struct RegistrationError: Error, LocalizedError {
    
    let registrationStatus: RegistrationStatus

    /// A localized message describing what error occurred.
    public var errorDescription: String? {
        switch registrationStatus {
        case .connectionTimeout:
            return "Connection timeout."
        default:
            return "Unknown Error."
        }
    }
}


public enum RegistrationStatus {
    case registered
    case connectionTimeout
}

public protocol RegistrationManagerProtocol {
    
    /**
     Starts a registration process without SMS validation.
     
     - parameters:
        - completion: A closure to be called when a `PodCommEvent` is issued by the comm. layer.
            - status: Registration status.
     
     - Note: Only use this API if your app does not require SMS validation (as per the Insulet Cloud configuration set for your team).
     */
    func startRegistration(completion: @escaping (RegistrationStatus) -> ())

    /// Registration is complete.
    func isRegistered() -> Bool

}

class MockRegistrationManager: RegistrationManagerProtocol {
    
    public var initialResponse: RegistrationStatus = .connectionTimeout
    
    private var attemptCount: Int = 0
    
    private var _isRegistered: Bool

    init(isRegistered: Bool = false) {
        self._isRegistered = isRegistered
    }
    
    func startRegistration(completion: @escaping (RegistrationStatus) -> ()) {
        attemptCount += 1
        let localAttemptCount = attemptCount
        
        if _isRegistered {
            DispatchQueue.main.async {
                completion(.registered)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if localAttemptCount == 1 {
                    completion(self.initialResponse)
                } else {
                    completion(.registered)
                }
            }
        }
    }
    
    func finishRegistration(verificationCode: String, completion: @escaping (RegistrationStatus) -> ()) {
        // not used
        completion(.registered)
    }
    
    func isRegistered() -> Bool {
        return _isRegistered
    }
    
    
}
