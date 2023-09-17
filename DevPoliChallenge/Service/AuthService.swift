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
    func logUserIn(email: String, password: String, completion: @escaping(AuthUser?, Error?) -> Void)
    func registerUser(withCredential credentials: CreateUserModel, completion: @escaping(AuthUser?, Error?) -> Void)
    func fetchUser(withUid uid: String, completion: @escaping(User?, Error?) -> Void)
}

final class AuthService: AuthServiceProtocol {
    
    func logUserIn(email: String, password: String, completion: @escaping(AuthUser?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            DispatchQueue.main.async {
                if let error {
                    completion(nil, error)
                    return
                }
                
                guard let id = result?.user.uid else { return }
                completion(AuthUser(uid: id),  nil)
            }
        }
    }
    
    func registerUser(withCredential credentials: CreateUserModel, completion: @escaping(AuthUser?, Error?) -> Void) {
        Auth.auth().createUser(withEmail: credentials.email, password:  credentials.password) {result, error in
            DispatchQueue.main.async {
                if let error {
                    completion(nil, error)
                    return
                }
                
                guard let id = result?.user.uid else { return }
                self.createUserUIdFirebase(uid: id, withCredential: credentials)
                completion(AuthUser(uid: id),  nil)
            }
        }
    }
    
    private func createUserUIdFirebase(uid: String, withCredential: CreateUserModel) {
        let data: [String: Any] = ["email": withCredential.email,
                                   "fullname": withCredential.lastName,
                                   "profileImageUrl": "teste", "uid": uid,
                                   "username": withCredential.firsName]
        Firestore.firestore().collection("users").document(uid).setData(data, completion: nil)
    }
    
    func fetchUser(withUid uid: String, completion: @escaping(User?, Error?) -> Void) {
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
            DispatchQueue.main.async {
                if let error {
                    completion(nil, error)
                    return
                }
                
                guard let dictionary = snapshot?.data() else { return }
                let user = User(dictionary: dictionary)
                completion(user, nil)
            }
        }
    }
}
