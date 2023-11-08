//
//  MainAuthViewViewController.swift
//  Walletly
//
//  Created by Gokhan Kaya on 25.10.2023.
//

import Foundation
import FirebaseAuth


final class MainAuthViewViewModel :ObservableObject {
    
    @Published var goToSignInView  :Bool = false
    let signInAppleHelper = SignInWithAppleHelper()
    
    func googleSignIn() async throws{
        let helper  = SignInGoogleHelper()
        let tokens = try await helper.signIn()
        try await AuthManager.shared.signInWithGoogle(tokens: tokens)
        
    }
    
    func appleSignIn() async throws{
        let helper  = await SignInWithAppleHelper()
        let tokens = try await helper.startSignInWithAppleFlow()
        try await AuthManager.shared.signInWithApple(tokens:tokens)
    }
}


 
