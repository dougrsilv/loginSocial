//
//  AuthService.swift
//  DevPoliChallenge
//
//  Created by Douglas  Rodrigues  on 21/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

protocol AuthServiceProtocol {
    func logUserIn(email: String, password: String, completion: @escaping(AuthDataResult?, Error?) -> Void)
    func registerUser(withCredential credentials: CreateUserModel, completion: @escaping(AuthDataResult?, Error?) -> Void)
}

final class AuthService: AuthServiceProtocol {
    
    func logUserIn(email: String, password: String, completion: @escaping(AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    func registerUser(withCredential credentials: CreateUserModel, completion: @escaping(AuthDataResult?, Error?) -> Void) {
        Auth.auth().createUser(withEmail: credentials.email, password:  credentials.password, completion: completion)
    }
}
