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
        case orUseYourEmailForSignIn = "orUseYourEmailForSignIn"
        case email = "email"
        case password = "password"
        case signIn = "signIn"
        case forgotPassword = "forgotPassword"
        case needAnAccount = "needAnAccount"
        case pleaseEnterYourEmailToRecoverYourLostPassword = "pleaseEnterYourEmailToRecoverYourLostPassword"
        case submit = "submit"
        case signUp = "signUp"
        case signUpWithEmail = "signUpWithEmail"
        case signInWithEmail = "signInWithEmail"
        case orUseYourEmailForSignUp = "orUseYourEmailForSignUp"
        case pleaseUseYourSocialMediaAccountOrEmailForSignInToWalletly = "pleaseUseYourSocialMediaAccountOrEmailForSignInToWalletly"
        case pleaseEnterYourEmailAndPasswordForSignInToWalletly = "pleaseEnterYourEmailAndPasswordForSignInToWalletly"
        case pleaseEnterYourEmailAndPasswordToCreateAccount = "pleaseEnterYourEmailAndPasswordToCreateAccount"
        case signInWithGoogle = "signInWithGoogle"
        case signInWithApple = "signInWithApple"
        case signInWithFacebook = "signInWithFacebook"
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
        case pleaseEnterYourEmailAccountToUpdateYourEmail  = "pleaseEnterYourEmailAccountToUpdateYourEmail"
        case pleaseEnterYourEmailAccountToUpdateYourPassword  = "pleaseEnterYourEmailAccountToUpdateYourPassword"
        case update = "update"
    }
}

extension String{
    /// It localize any string from Localizable string
    /// - Returns: localized value
    func locale() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }
}
