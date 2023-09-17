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
    private(set) var firsName: String = ""
    private(set) var lastName: String = ""
    private(set) var email: String = ""
    private(set) var password: String = ""
    private(set) var confirmPassword: String = ""
    
    func checkDataCreateUser(withCredential: CreateUserModel) {
        checkFuncDataCreateUser = true
        firsName = withCredential.firsName
        lastName = withCredential.lastName
        email = withCredential.email
        password = withCredential.password
        confirmPassword = withCredential.confirmPassword
    }
    
    func popCoordinator() {
        checkFuncPopCoordinator = true
    }
    
    func fetchListCreateUser(withCredential: CreateUserModel) {
        //
    }
}
