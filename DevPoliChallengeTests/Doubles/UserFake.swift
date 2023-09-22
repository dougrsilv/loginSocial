//
//  UserFake.swift
//  DevPoliChallengeTests
//
//  Created by Douglas  Rodrigues  on 21/09/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation
@testable import DevPoliChallenge

struct UserFake {
    static func createUser() -> User {
        let createUser: [String : Any] = [
            "email" : "teste@email.com",
            "fullname" : "Carlos Roberto",
            "profileImageUrl" : "teste",
            "uid" : "123",
            "username" : "Carlos"
        ]
        let user = User(dictionary: createUser)
        return user
    }
}
