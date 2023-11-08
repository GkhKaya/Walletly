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
    let name : String?
    let email : String?
    
    init(idToen: String, accessToken: String,name:String,email:String) {
        self.idToen = idToen
        self.accessToken = accessToken
        self.name = name
        self.email = email
    }
}
    