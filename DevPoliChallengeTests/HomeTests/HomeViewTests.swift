//
//  HomeViewTests.swift
//  DevPoliChallengeTests
//
//  Created by Douglas  Rodrigues  on 20/09/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import FBSnapshotTestCase
@testable import DevPoliChallenge

final class HomeViewTests: FBSnapshotTestCase {
    
    lazy var sut = HomeView()
    
    override func setUp() {
        super.setUp()
        recordMode = false
        let createUser: [String : Any] = [
            "email" : "teste@email.com",
            "fullname" : "Carlos Roberto",
            "profileImageUrl" : "teste",
            "uid" : "123",
            "username" : "Carlos"
        ]
        let user = User(dictionary: createUser)
        sut.setupData(user: user)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLoginView() throws {
        sut.frame = CGRect(x: .zero,
                           y: .zero,
                           width: UIScreen.main.bounds.width,
                           height: UIScreen.main.bounds.height)
        FBSnapshotVerifyView(sut)
    }
    
}

