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
       func signIn(viewController: UIViewController? = nil) async throws -> GoogleSignInResultModel {
           guard let topViewController = viewController ?? topViewController() else {
               throw URLError(.notConnectedToInternet)
           }
           
           let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topViewController)
           
           guard let idToken = gidSignInResult.user.idToken?.tokenString else {
               throw URLError(.badServerResponse)
           }
           
           let accessToken = gidSignInResult.user.accessToken.tokenString
           guard let name = gidSignInResult.user.profile?.name else {
               throw URLError(.unknown)
           }
           guard let email = gidSignInResult.user.profile?.email else {
               throw URLError(.unknown)
           }
           return GoogleSignInResultModel(idToen: idToken, accessToken: accessToken, name: name, email:email)
       }
       
       @MainActor
       func topViewController(controller: UIViewController? = nil) -> UIViewController? {
           let controller = controller ?? UIApplication.shared.keyWindow?.rootViewController
           
           if let navigationController = controller as? UINavigationController {
               return topViewController(controller: navigationController.visibleViewController)
           }
           if let tabController = controller as? UITabBarController {
               if let selected = tabController.selectedViewController {
                   return topViewController(controller: selected)
               }
           }
           if let presented = controller?.presentedViewController {
               return topViewController(controller: presented)
           }
           return controller
       }
}
