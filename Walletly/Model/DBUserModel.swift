//
//  DBUserModel.swift
//  Walletly
//
//  Created by Gokhan Kaya on 9.12.2023.
//

import Foundation

struct DBUserModel: Codable{
    let userId : String
    let email : String?
    let dateCreated : Date?
    
    
    init(auth: AuthDataResultModel){
        self.userId = auth.uid
        self.email = auth.email
        self.dateCreated = Date()
        
    }
    
    init(
        userId : String,
        email : String?,
        dateCreated : Date?
    ){
        self.userId = userId
        self.email = email
        self.dateCreated = dateCreated
    }
}
