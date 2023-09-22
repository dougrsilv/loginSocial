//
//  MockAuthService.swift
//  DevPoliChallengeTests
//
//  Created by Douglas  Rodrigues  on 05/09/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
@testable import DevPoliChallenge

final class MockAuthService: AuthServiceProtocol {
 
    var registeIsSucess: Bool = false
    var loginIsManipulate: Bool = false
    var fecthUserManipulate: Bool = false

    func logUserIn(email: String, password: String, completion: @escaping (DevPoliChallenge.AuthUser?, Error?) -> Void) {
        if loginIsManipulate {
            completion(AuthUser(uid: "123"), nil)
        } else {
            completion(nil, MockError.noneError)
        }
    }
    
    func fetchUser(withUid uid: String, completion: @escaping (DevPoliChallenge.User?, Error?) -> Void) {
        if fecthUserManipulate {
            completion(UserFake.createUser(), nil)
        } else {
            completion(nil, MockError.noneError)
        }
    }
    
    func registerUser(withCredential credentials: DevPoliChallenge.CreateUserModel, completion: @escaping (AuthUser?, Error?) -> Void) {
        if registeIsSucess {
            completion(AuthUser(uid: "123"), nil)
        } else {
            completion(nil, MockError.noneError)
        }
    }
}

enum MockError: Error {
    case noneError
}
