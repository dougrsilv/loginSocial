//
//  LoginViewModelInputSpy.swift
//  DevPoliChallengeTests
//
//  Created by Douglas  Rodrigues  on 17/09/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation
@testable import DevPoliChallenge

final class LoginViewModelInputSpy: LoginViewModelInput {
    
    var delegate: LoginViewModelOutput?
    private(set) var checkFetchListLogin: Bool = false
    private(set) var checkNaviagtionCreateAccount: Bool = false
    private(set) var checkNavigationHome: Bool = false
    private(set) var checkAuthUser: String = ""
    
    func fetchListLogin(email: String, password: String) {
        checkFetchListLogin = true
    }
    
    func navigationCreateAccount() {
        checkNaviagtionCreateAccount = true
    }
    
    func navigationHome(uid: DevPoliChallenge.AuthUser?) {
        checkNavigationHome = true
        checkAuthUser = uid?.uid ?? ""
    }
}
