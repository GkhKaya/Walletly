//
//  AuthManager.swift
//  Walletly
//
//  Created by Gokhan Kaya on 11.10.2023.
//

import Foundation
import FirebaseAuth


final class AuthManager{
    static let shared = AuthManager()
    private init(){
        
    }
    
    func getAuthenticatedUser() throws -> AuthDataResultModel{
        guard let user = Auth.auth().currentUser else {
            throw URLError(.userCancelledAuthentication)
        }
        return AuthDataResultModel(user: user)
    }
    
    @discardableResult
    func createUser(email:String, password:String,username:String) async throws -> AuthDataResultModel{
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
}


