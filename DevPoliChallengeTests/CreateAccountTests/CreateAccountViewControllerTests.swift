//
//  CreateAccountViewControllerTests.swift
//  DevPoliChallengeTests
//
//  Created by Douglas  Rodrigues  on 07/09/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import XCTest
@testable import DevPoliChallenge

final class CreateAccountViewControllerTests: XCTestCase {
    
    func test_call_checkDataCreateUser() {
        let spy = CreateAccountViewModelInputSpy()
        lazy var sut = CreateAccountViewController(createAccountViewModelInput: spy)
        sut.passDataCreateUser(model: CreateUserModelFake.correctUserField())
        XCTAssert(spy.checkFuncDataCreateUser)
    }
    
    func test_check_createUser() {
        let spy = CreateAccountViewModelInputSpy()
        lazy var sut = CreateAccountViewController(createAccountViewModelInput: spy)
        sut.passDataCreateUser(model: CreateUserModelFake.correctUserField())
        XCTAssert(spy.firsName == "Carlos")
        XCTAssert(spy.lastName ==  "Souza")
        XCTAssert(spy.email ==  "carlos@gmail.com.br")
        XCTAssert(spy.password == "123456")
        XCTAssert(spy.confirmPassword ==  "123456")
    }
}
