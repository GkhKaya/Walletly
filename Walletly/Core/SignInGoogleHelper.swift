//
//  SignInGoogleHelper.swift
//  Walletly
//
//  Created by Gokhan Kaya on 18.10.2023.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift


final class SignInGoogleHelper{
    @MainActor
    func signIn() async throws -> GoogleSignInResultModel{
        guard let topVc =  await Utilities.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVc)
        
        guard let idToken : String = gidSignInResult.user.idToken?.tokenString else {throw URLError(.badServerResponse)}
        
        let accessToken = gidSignInResult.user.accessToken.tokenString
        
        let tokens = GoogleSignInResultModel(idToen: idToken, accessToken: accessToken)
        
        return tokens
    }
}
