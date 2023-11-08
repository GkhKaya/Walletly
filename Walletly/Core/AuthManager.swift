//
//  AuthManager.swift
//  Walletly
//
//  Created by Gokhan Kaya on 11.10.2023.
//

import Foundation
import FirebaseAuth


enum AuthProviderOptions : String{
    case email  = "password"
    case google = "google.com"
    case apple = "apple.com"
}

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
    
    func getProvider() throws -> [AuthProviderOptions]{
        guard let providerData = Auth.auth().currentUser?.providerData else {
            throw URLError(.badServerResponse)
        }
        
        var providers: [AuthProviderOptions] = []
        
        for provider in providerData {
            if let option  = AuthProviderOptions(rawValue: provider.providerID){
                providers.append(option)
            }else{
                assertionFailure("provider option not fount \(provider.providerID)")
            }
        }
        return providers
    }
    
    func signOut () throws{
        try Auth.auth().signOut()
    }
    
    
    
}


extension AuthManager{
    //    Create an user
    @discardableResult
    func createUser(email:String, password:String) async throws -> AuthDataResultModel{
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
    
    @discardableResult
    func signInWithApple(tokens: AppleSignInResultModel) async throws -> AuthDataResultModel{
        let credential = OAuthProvider.credential(withProviderID: AuthProviderOptions.apple.rawValue, idToken: tokens.token, rawNonce: tokens.nonce)
        return try await signIn(credential: credential)
    }
    
    func signIn(credential: AuthCredential) async throws -> AuthDataResultModel{
        let authDataReuslt = try await Auth.auth().signIn(with: credential)
        return AuthDataResultModel(user: authDataReuslt.user)
    }
}


