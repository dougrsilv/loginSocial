//
//  HomeViewModel.swift
//  DevPoliChallenge
//
//  Created by Douglas  Rodrigues  on 14/09/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation

protocol HomeViewModelInput {
    var delegate: HomeViewModelOutput? { get set }
    func fechtUser()
}

protocol HomeViewModelOutput: AnyObject {
    func onSuccess(user: User?)
    func onFailure()
}

final class HomeViewModel: HomeViewModelInput {
    
    private let service: AuthServiceProtocol
    private let uid: String?
    var delegate: HomeViewModelOutput?
    
    init(service: AuthServiceProtocol,
         uid: String?) {
        self.service = service
        self.uid = uid
    }
    
    func fechtUser() {
        service.fetchUser(withUid: uid ?? "") { [ weak self ] user, error in
            guard let self = self else { return }
            if error != nil {
                self.delegate?.onFailure()
                return
            }
            
            self.delegate?.onSuccess(user: user)
        }
    }
}
