//
//  LoginViewModelOutputSpy.swift
//  DevPoliChallengeTests
//
//  Created by Douglas  Rodrigues  on 17/09/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import XCTest
@testable import DevPoliChallenge

final class LoginViewModelOutputSpy: LoginViewModelOutput {
    
    private(set) var checkOnFailure: Bool = false
    private(set) var checkOnSuccess: Bool = false
    private(set) var firsName: String = ""
    private(set) var lastName: String = ""
    private(set) var email: String = ""
    private(set) var password: String = ""
    private(set) var confirmPassword: String = ""
    
    func onFailure() {
        checkOnFailure = true
    }
    
    func onSuccess(uid: DevPoliChallenge.AuthUser?) {
        checkOnSuccess = true
        password = uid?.uid ?? ""
    }
}
