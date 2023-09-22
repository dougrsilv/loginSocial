//
//  HomeViewModelInputSpy.swift
//  DevPoliChallengeTests
//
//  Created by Douglas  Rodrigues  on 21/09/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import XCTest
@testable import DevPoliChallenge

final class HomeViewModelInputSpy: HomeViewModelInput {
    
    var delegate: DevPoliChallenge.HomeViewModelOutput?
    private(set) var checkFechtUser: Bool = false
    
    func fechtUser() {
        checkFechtUser = true
    }
}
