//
//  HomeViewModelOutputSpy.swift
//  DevPoliChallengeTests
//
//  Created by Douglas  Rodrigues  on 21/09/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import XCTest
@testable import DevPoliChallenge

final class HomeViewModelOutputSpy: HomeViewModelOutput {
    
    private(set) var checkOnSucess: Bool = false
    private(set) var checkOnFailure: Bool = false
    
    func onSuccess(user: User?) {
        checkOnSucess = true
    }
    
    func onFailure() {
        checkOnFailure = true
    }
}
