//
//  CreateAccountViewModelTests.swift
//  DevPoliChallengeTests
//
//  Created by Douglas  Rodrigues  on 05/09/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import XCTest
@testable import DevPoliChallenge

final class CreateAccountViewModelTests: XCTestCase {
    
    func test_called_func_checkDataCreateUser() {
        let mock = MockAuthService()
        let spy = CreateAccountViewModelOutputSpy()
        let sut = CreateAccountViewModel(service: mock)
        sut.delegate = spy
        sut.checkDataCreateUser(withCredential: CreateUserModel(firsName: "",
                                                                lastName: "",
                                                                email: "", password: "",
                                                                confirmPassword: "")
        )
        XCTAssertTrue(spy.checkOnFailure)
    }
    
    func test_error_invalid_email() {
        let mock = MockAuthService()
        let spy = CreateAccountViewModelOutputSpy()
        let sut = CreateAccountViewModel(service: mock)
        sut.delegate = spy
        sut.checkDataCreateUser(withCredential: CreateUserModel(firsName: "Carlos",
                                                                lastName: "Souza",
                                                                email: "",
                                                                password: "123456",
                                                                confirmPassword: "123456")
        )
        XCTAssertTrue(spy.checkErrorInvalidEmail)
    }
    
    func test_error_invalidCatacter() {
        let mock = MockAuthService()
        let spy = CreateAccountViewModelOutputSpy()
        let sut = CreateAccountViewModel(service: mock)
        sut.delegate = spy
        sut.checkDataCreateUser(withCredential: CreateUserModel(firsName: "Carlos",
                                                                lastName: "Souza",
                                                                email: "carlos@gmail.com.br",
                                                                password: "1234",
                                                                confirmPassword: "")
        )
        XCTAssertTrue(spy.checkInvalidCaracters)
    }
    
    func test_error_direferentPassowrdAndConfirmPassowrd() {
        let mock = MockAuthService()
        let spy = CreateAccountViewModelOutputSpy()
        let sut = CreateAccountViewModel(service: mock)
        sut.delegate = spy
        sut.checkDataCreateUser(withCredential: CreateUserModel(firsName: "Carlos",
                                                                lastName: "Souza",
                                                                email: "carlos@gmail.com.br",
                                                                password: "123456",
                                                                confirmPassword: "1234567")
        )
        XCTAssertTrue(spy.checkDireferentPassowrdAndConfirmPassowrd)
    }
    
    func test_check_onSucess() {
        let mock = MockAuthService()
        mock.registeIsSucess = true
        let spy = CreateAccountViewModelOutputSpy()
        let sut = CreateAccountViewModel(service: mock)
        sut.delegate = spy

        let model =  CreateUserModel(firsName: "Carlos",
                                     lastName: "Souza",
                                     email: "carlos@gmail.com.br",
                                     password: "123456",
                                     confirmPassword: "123456")
        sut.fetchListCreateUser(withCredential: model)
        
        XCTAssertTrue(spy.checkOnSucess)
    }
    
    func test_check_onFailure() {
        let mock = MockAuthService()
        mock.registeIsSucess = false
        let spy = CreateAccountViewModelOutputSpy()
        let sut = CreateAccountViewModel(service: mock)
        sut.delegate = spy

        let model =  CreateUserModel(firsName: "Carlos",
                                     lastName: "Souza",
                                     email: "carlos@gmail.com.br",
                                     password: "123456",
                                     confirmPassword: "1234")
        sut.fetchListCreateUser(withCredential: model)
        
        XCTAssertTrue(spy.checkOnFailure)
    }
}
