//
//  CreateAccountViewModel.swift
//  DevPoliChallenge
//
//  Created by Douglas  Rodrigues  on 23/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation
import FirebaseFirestore

enum ErrorCreateUser {
    case invalidEmail
    case direferentPassowrdAndConfirmPassowrd
    case errorCreateUser
    case invalidCaracters
}

protocol CreateAccountViewModelInput {
    var delegate: CreateAccountViewModelOutput? { get set }
    func checkDataCreateUser(withCredential: CreateUserModel)
    func pop()
}

protocol CreateAccountViewModelOutput: AnyObject {
    func onFailure(error: ErrorCreateUser)
    func onSucess()
}

final class CreateAccountViewModel: CreateAccountViewModelInput {
    
    weak var delegate: CreateAccountViewModelOutput?
    private let service: AuthServiceProtocol
    private let coordinator: CreateAccountCoordinator
    
    init(service: AuthServiceProtocol, coordinator: CreateAccountCoordinator) {
        self.service = service
        self.coordinator = coordinator
    }
    
    func checkDataCreateUser(withCredential: CreateUserModel) {
        if isValidEmail(withCredential.email) == false {
            delegate?.onFailure(error: .invalidEmail)
        } else if withCredential.password.count < 5 {
            delegate?.onFailure(error: .invalidCaracters)
        } else if withCredential.password != withCredential.confirmPassword {
            delegate?.onFailure(error: .direferentPassowrdAndConfirmPassowrd)
        } else {
            fetchListCreateUser(withCredential: withCredential)
        }
    }
    
    private func fetchListCreateUser(withCredential: CreateUserModel) {
        service.registerUser(withCredential: withCredential) { [weak self ] result, error  in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if error != nil {
                    print("DEBUG: Failed to register user \(String(describing: error?.localizedDescription))")
                    self.delegate?.onFailure(error: .errorCreateUser)
                    return
                }
                
                guard let uid = result?.user.uid else { return }
                self.createUserUIdFirebase(uid: uid, withCredential: withCredential)
                self.delegate?.onSucess()
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
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func pop() {
        coordinator.pop()
    }
}
