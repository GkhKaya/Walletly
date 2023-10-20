//
//  GoogleSignInResultModel.swift
//  Walletly
//
//  Created by Gokhan Kaya on 18.10.2023.
//

import Foundation

struct GoogleSignInResultModel{
    let idToen:String
    let accessToken:String
    
    init(idToen: String, accessToken: String) {
        self.idToen = idToen
        self.accessToken = accessToken
    }
}
