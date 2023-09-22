//
//  HomeViewControllerTests.swift
//  DevPoliChallengeTests
//
//  Created by Douglas  Rodrigues  on 21/09/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import XCTest
@testable import DevPoliChallenge

final class HomeViewControllerTests: XCTestCase {
    
    func test_check_fetchUser() {
        let spy = HomeViewModelInputSpy()
        let sut = HomeViewController(homeViewModel: spy)
        sut.viewDidLoad()
        
        XCTAssertTrue(spy.checkFechtUser)
    }
    
}
