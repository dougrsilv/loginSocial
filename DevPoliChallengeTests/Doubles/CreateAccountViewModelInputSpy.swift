//
//  CreateAccountViewModelInputSpy.swift
//  DevPoliChallengeTests
//
//  Created by Douglas  Rodrigues  on 05/09/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import XCTest
@testable import DevPoliChallenge

final class CreateAccountViewModelInputSpy: CreateAccountViewModelInput {
    
    var delegate: CreateAccountViewModelOutput?
    private(set) var checkFuncDataCreateUser: Bool = false
    private(set) var checkFuncPopCoordinator: Bool = false
    
    func checkDataCreateUser(withCredential: CreateUserModel) {
        checkFuncDataCreateUser = true
    }
    
    func popCoordinator() {
        checkFuncPopCoordinator = true
    }
}
