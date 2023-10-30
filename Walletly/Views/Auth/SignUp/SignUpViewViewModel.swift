//
//  SignUpViewViewModel.swift
//  Walletly
//
//  Created by Gokhan Kaya on 5.10.2023.
//

import Foundation
import FirebaseAuth


final class SignUpViewViewModel : ObservableObject{
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var goToSettingsView : Bool = false
    
    
    func signUp() async throws {
        guard !email.isEmpty,!password.isEmpty else{
            print("Email and password not found")
            return
        }
        
        try await AuthManager.shared.createUser(email: email, password: password)
    }
    
    
}
