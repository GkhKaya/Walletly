//
//  AuthDataResultModel.swift
//  Walletly
//
//  Created by Gokhan Kaya on 11.10.2023.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel{
    let uid: String
    let email : String?
    let username : String?
    
    init(user : User) {
        self.uid = user.uid
        self.email = user.email
        self.username = user.displayName
    }
}
