//
//  CreateAccountViewModelOutputSpy.swift
//  DevPoliChallengeTests
//
//  Created by Douglas  Rodrigues  on 05/09/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation
@testable import DevPoliChallenge

final class CreateAccountViewModelOutputSpy: CreateAccountViewModelOutput {
    
    private(set) var checkOnFailure: Bool = false
    private(set) var checkOnSucess: Bool = false
    private(set) var checkErrorInvalidEmail: Bool = false
    private(set) var checkInvalidCaracters: Bool = false
    private(set) var checkDireferentPassowrdAndConfirmPassowrd: Bool = false
    private(set) var checkErrorCreateUser: Bool = false
    
    func onFailure(error: ErrorCreateUser) {
        checkOnFailure = true
        switch error {
        case .invalidEmail:
            checkErrorInvalidEmail = true
        case .invalidCaracters:
            checkInvalidCaracters = true
        case .direferentPassowrdAndConfirmPassowrd:
            checkDireferentPassowrdAndConfirmPassowrd = true
        case .errorCreateUser:
            checkErrorCreateUser = true
        }
    }
    
    func onSucess() {
        checkOnSucess = true
    }
}
