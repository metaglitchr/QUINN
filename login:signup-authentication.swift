//
//  login:signup-authentication.swift
//  QUINN
//
//  Created by colton on 2/13/23.
//

import Foundation
import LocalAuthentication

class AuthenticationManager {
    let context = LAContext()
    
    func authenticateUser(completion: @escaping (Bool, Error?) -> Void) {
        // Check if the device supports biometric authentication (e.g. Touch ID or Face ID)
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // The device supports biometric authentication
            let reason = "Authenticate with Touch ID or Face ID to access MetaGlitchr"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                DispatchQueue.main.async {
                    completion(success, error)
                }
            }
        } else {
            // The device does not support biometric authentication
            completion(false, error)
        }
    }
}
