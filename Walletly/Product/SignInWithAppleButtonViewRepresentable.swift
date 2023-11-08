//
//  SignInWithAppleButtonViewRepresentable.swift
//  Walletly
//
//  Created by Gokhan Kaya on 30.10.2023.
//

import Foundation
import AuthenticationServices
import SwiftUI

struct SignInWithAppleButtonViewRepresentable : UIViewRepresentable{
    let tyye : ASAuthorizationAppleIDButton.ButtonType
    let style: ASAuthorizationAppleIDButton.Style
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        ASAuthorizationAppleIDButton(authorizationButtonType: tyye, authorizationButtonStyle: style)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
        
    }
}
