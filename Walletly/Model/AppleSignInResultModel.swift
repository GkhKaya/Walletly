//
//  AppleSignInResultModel.swift
//  Walletly
//
//  Created by Gokhan Kaya on 2.11.2023.
//

import Foundation
struct AppleSignInResultModel {
    let token: String
    let nonce : String
    
    init(token: String, nonce: String) {
        self.token = token
        self.nonce = nonce
    }
}
