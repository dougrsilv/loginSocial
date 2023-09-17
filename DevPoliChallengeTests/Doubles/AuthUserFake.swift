//
//  AuthUserFake.swift
//  DevPoliChallengeTests
//
//  Created by Douglas  Rodrigues  on 17/09/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation
@testable import DevPoliChallenge

struct AuthUserFake {
    
    static func returnId() -> AuthUser {
        return AuthUser(uid: "123")
    }
    
}
