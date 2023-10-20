//
//  LocalKeys.swift
//  Walletly
//
//  Created by Gokhan Kaya on 1.10.2023.
//

import SwiftUI

struct LocalKeys {
    enum Auth : String{
        case welcome = "welcome"
        case signInWithSocialMediaAccount = "signInWithSocialMediaAccount"
        case orUseYourEmailForSignIn = "orUseYourEmailForSignIn"
        case email = "email"
        case password = "password"
        case signIn = "signIn"
        case forgotPassword = "forgotPassword"
        case needAnAccount = "needAnAccount"
        case recoverPassword = "recoverPassword"
        case pleaseEnterYourEmail = "pleaseEnterYourEmail"
        case submit = "submit"
        case joinWalletly = "joinWalletly"
        case signUpWithSocialMediaAccount = "signUpWithSocialMediaAccount"
        case yourName  = "yourName"
        case signUp = "signUp"
        case orUseYourEmailForSignUp = "orUseYourEmailForSignUp"
    }
    enum Settings : String{
        case settings = "settings"
        case darkMode = "darkMode"
        case notifications = "notifications"
        case textSize  = "textSize"
        case updateEmail  = "updateEmail"
        case updatePassword  = "updatePassword"
        case interface = "interface"
        case account  = "account"
        case signOut  = "signOut"
    }
}

extension String{
    /// It localize any string from Localizable string
    /// - Returns: localized value
    func locale() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }
}
