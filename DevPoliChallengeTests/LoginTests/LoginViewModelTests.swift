//
//  LoginViewModelTests.swift
//  DevPoliChallengeTests
//
//  Created by Douglas  Rodrigues  on 17/09/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import XCTest
@testable import DevPoliChallenge

final class LoginViewModelTests: XCTestCase {
    
    func test_check_func_onFailure() {
        let mock = MockAuthService()
        mock.loginIsManipulate = false
        let sut = LoginViewModel(service: mock)
        let spy = LoginViewModelOutputSpy()
        sut.delegate = spy
        sut.fetchListLogin(email: "", password: "")
        
        XCTAssert(spy.checkOnFailure)
    }
    
    func test_check_func_onSuccess() {
        let mock = MockAuthService()
        mock.loginIsManipulate = true
        let sut = LoginViewModel(service: mock)
        let spy = LoginViewModelOutputSpy()
        sut.delegate = spy
        sut.fetchListLogin(email: "", password: "")
        
        XCTAssert(spy.checkOnSuccess)
    }
    
    func test_chech_modelUser() {
        let mock = MockAuthService()
        mock.loginIsManipulate = true
        let sut = LoginViewModel(service: mock)
        let spy = LoginViewModelOutputSpy()
        sut.delegate = spy
        sut.fetchListLogin(email: "", password: "")
        sut.delegate?.onSuccess(uid: AuthUserFake.returnId())

        XCTAssert(spy.password == "123")
    }
    
}
