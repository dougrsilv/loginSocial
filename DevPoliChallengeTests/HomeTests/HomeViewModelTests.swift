//
//  HomeViewModelTests.swift
//  DevPoliChallengeTests
//
//  Created by Douglas  Rodrigues  on 21/09/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import XCTest
@testable import DevPoliChallenge

final class HomeViewModelTests: XCTestCase {
    
    func test_check_on_failure() {
        let mock = MockAuthService()
        mock.fecthUserManipulate = false
        let homeViewModel = HomeViewModel(service: mock, uid: "123")
        let spy = HomeViewModelOutputSpy()
        homeViewModel.delegate = spy
        homeViewModel.fechtUser()
        XCTAssertTrue(spy.checkOnFailure)
    }
    
    func test_check_on_sucess() {
        let mock = MockAuthService()
        mock.fecthUserManipulate = true
        let homeViewModel = HomeViewModel(service: mock, uid: "123")
        let spy = HomeViewModelOutputSpy()
        homeViewModel.delegate = spy
        homeViewModel.fechtUser()
        XCTAssertTrue(spy.checkOnSucess)
    }
    
}
