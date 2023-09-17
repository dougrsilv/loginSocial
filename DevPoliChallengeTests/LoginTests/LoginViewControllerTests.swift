//
//  LoginViewControllerTests.swift
//  DevPoliChallengeTests
//
//  Created by Douglas  Rodrigues  on 17/09/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import XCTest
@testable import DevPoliChallenge

final class LoginViewControllerTests: XCTestCase {
    
    func test_check_func_fetchListLogin() {
        let spy = LoginViewModelInputSpy()
        let sut = LoginViewController(loginViewModelInput: spy)
        sut.loginData(loginModel: LoginModel(login: "", password: ""))
        
        XCTAssertTrue(spy.checkFetchListLogin)
    }
    
    func test_check_naviagtionCreateAccount() {
        let spy = LoginViewModelInputSpy()
        let sut = LoginViewController(loginViewModelInput: spy)
        sut.createNewAccount()
        
        XCTAssertTrue(spy.checkNaviagtionCreateAccount)
    }
    
    func test_check_navigationHome() {
        let spy = LoginViewModelInputSpy()
        let sut = LoginViewController(loginViewModelInput: spy)
        sut.onSuccess(uid: AuthUserFake.returnId())
        
        XCTAssertTrue(spy.checkNavigationHome)
    }
    
    func test_resultuserId() {
        let spy = LoginViewModelInputSpy()
        let sut = LoginViewController(loginViewModelInput: spy)
        sut.onSuccess(uid: AuthUserFake.returnId())
        
        XCTAssertTrue(spy.checkAuthUser == "123")
    }
    
    func test_navigationCreateUser() {
        let viewModel = LoginViewModelInputSpy()
        let sut = LoginViewController(loginViewModelInput: viewModel)
        let spy = SpyNavigationController(rootViewController: sut)
        let coordinato = LoginCoordinator(navigationController: spy)
        coordinato.createAccountStart()
        
        XCTAssert(spy.pushViewController is CreateAccountViewController)
    }
    
    func test_navigationHome() {
        let viewModel = LoginViewModelInputSpy()
        let sut = LoginViewController(loginViewModelInput: viewModel)
        let spy = SpyNavigationController(rootViewController: sut)
        let coordinato = LoginCoordinator(navigationController: spy)
        coordinato.homeStart(uid: AuthUserFake.returnId())
        
        XCTAssert(spy.pushViewController is HomeViewController)
    }
}
