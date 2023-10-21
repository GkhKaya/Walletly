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
    
//    Get already signed in user
    func getAuthenticatedUser() throws -> AuthDataResultModel{
        guard let user = Auth.auth().currentUser else {
            throw URLError(.userCancelledAuthentication)
        }
        return AuthDataResultModel(user: user)
    }
    
    func signOut () throws{
        try Auth.auth().signOut()
    }
    

    
}


extension AuthManager{
    //    Create an user
        @discardableResult
        func createUser(email:String, password:String,username:String) async throws -> AuthDataResultModel{
            let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
            return AuthDataResultModel(user: authDataResult.user)
        }
        
    //    Sign in user
        @discardableResult
        func signIn(email:String,password:String) async throws -> AuthDataResultModel{
            let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
            return AuthDataResultModel(user: authDataResult.user)
        }
    //    Recover password
        func recoverPassword(email:String) async throws{
            try await Auth.auth().sendPasswordReset(withEmail: email)
        }
        
    func updateEmail(email:String) async throws{
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        try await user.updateEmail(to: email)
    }
        
   
}




//Sso
extension AuthManager{
    
    @discardableResult 
    func signInWithGoogle(tokens: GoogleSignInResultModel) async throws -> AuthDataResultModel{
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToen, accessToken: tokens.accessToken)
        return try await signIn(credential: credential)
    }
    
    func signIn(credential: AuthCredential) async throws -> AuthDataResultModel{
        let authDataReuslt = try await Auth.auth().signIn(with: credential)
        return AuthDataResultModel(user: authDataReuslt.user)
    }
}


