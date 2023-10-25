//
//  MainAuthViewViewController.swift
//  Walletly
//
//  Created by Gokhan Kaya on 25.10.2023.
//

import Foundation
import FirebaseAuth

final class MainAuthViewViewModel : ObservableObject{
    @Published var goToSignInView  :Bool = false
    
    func googleSignIn() async throws{
        let helper  = SignInGoogleHelper()
        let tokens = try await helper.signIn()
        try await AuthManager.shared.signInWithGoogle(tokens: tokens)
        
    }
}
