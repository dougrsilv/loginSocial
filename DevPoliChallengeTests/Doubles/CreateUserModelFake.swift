//
//  CreateUserModelFake.swift
//  DevPoliChallengeTests
//
//  Created by Douglas  Rodrigues  on 17/09/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation
@testable import DevPoliChallenge

struct CreateUserModelFake {
    
    static func noFieldFilledIn() ->  CreateUserModel {
        let user = CreateUserModel(firsName: "",
                                   lastName: "",
                                   email: "", password: "",
                                   confirmPassword: "")
        return user
    }
    
    static func emailFieldNotFilled() ->  CreateUserModel {
        let user = CreateUserModel(firsName: "Carlos",
                                   lastName: "Souza",
                                   email:"carlos",
                                   password: "123456",
                                   confirmPassword: "123456")
        return user
    }
    
    static func emptyPasswordConfirmationField() -> CreateUserModel {
        let user = CreateUserModel(firsName: "Carlos",
                                   lastName: "Souza",
                                   email: "carlos@gmail.com.br",
                                   password: "1234",
                                   confirmPassword: "")
        return user
    }
    
    static func differentPasswordConfirmationField() -> CreateUserModel {
        let user = CreateUserModel(firsName: "Carlos",
                                   lastName: "Souza",
                                   email: "carlos@gmail.com.br",
                                   password: "123456",
                                   confirmPassword: "1234567")
        return user
    }
    
    static func correctUserField() -> CreateUserModel {
        let user = CreateUserModel(firsName: "Carlos",
                                   lastName: "Souza",
                                   email: "carlos@gmail.com.br",
                                   password: "123456",
                                   confirmPassword: "123456")
        return user
    }
}
