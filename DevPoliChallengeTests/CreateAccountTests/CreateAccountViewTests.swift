//
//  CreateAccountViewTests.swift
//  DevPoliChallengeTests
//
//  Created by Douglas  Rodrigues  on 20/09/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import FBSnapshotTestCase
@testable import DevPoliChallenge

final class CreateAccountViewTests: FBSnapshotTestCase {
    
    private var sut: CreateAccountView!
    
    override func setUp() {
        super.setUp()
        recordMode = false
        sut = .init()
    }
    
    override func tearDown() {
        sut = nil
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

