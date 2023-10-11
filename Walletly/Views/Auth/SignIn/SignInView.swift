//
//  SignInView.swift
//  Walletly
//
//  Created by Gokhan Kaya on 4.10.2023.
//

import SwiftUI

struct SignInView: View {
    @ObservedObject private var viewModel = SignInViewViewModel()
    @State var email = ""
    @State var password = ""
    var body: some View {
        NavigationStack{
            GeometryReader{geometry in
                VStack{
                    //                Welcome
                    VStack(alignment: .leading) {
                        Image(ProjectImages.GeneralImages.walletlyLogo.rawValue)
                            .resizable()
                            .frame(width: geometry.dw(width: 0.38),height: geometry.dh(height: 0.1))
                        Text(LocalKeys.Auth.welcome.rawValue.locale())
                            .modifier(LargeTitleModifier())
                    }.padding(.trailing,180)
                    
                    //                Social Media Account
                    Text(LocalKeys.Auth.signInWithSocialMediaAccount.rawValue.locale())
                        .modifier(BoldNormalTitle())
                        .padding(.top,ProjectPaddings.Top.veryLarge.rawValue)
                        .foregroundColor(.gray)
                    HStack{
                        Image(ProjectImages.GeneralImages.icGoogle.rawValue)
                            .resizable()
                            .frame(width: geometry.dw(width: 0.13),height: geometry.dh(height: 0.065))
                        Image(ProjectImages.GeneralImages.icApple.rawValue)
                            .resizable()
                            .frame(width: geometry.dw(width: 0.13),height: geometry.dh(height: 0.065))
                    }.padding(.top,ProjectPaddings.Top.normal.rawValue)
                    Text(LocalKeys.Auth.orUseYourEmailForSignIn.rawValue.locale())
                        .modifier(BoldNormalTitle())
                        .padding(.vertical,ProjectPaddings.Vertical.normal.rawValue)
                        .foregroundColor(.gray)
                    
                    //                Text fields
                    VStack(spacing: 30){
                        HTextField(hint: LocalKeys.Auth.email.rawValue.locale(), iconName: "envelope", text: $viewModel.email)
                        
                        HSecureTextField(hint: LocalKeys.Auth.password.rawValue.locale(), iconName: "lock", text: $viewModel.password)
                    }
                    
                    //                Sign in button
                    NormalButton(onTap: {}, title: LocalKeys.Auth.signIn.rawValue)
                        .padding(.top,ProjectPaddings.Top.normal.rawValue)
                    
                    //                Forgot Password
                    Button{
                        
                    }label: {
                        Text(LocalKeys.Auth.forgotPassword.rawValue.locale())
                            .modifier(BoldNormalTitle())
                            .padding(.top,ProjectPaddings.Top.small.rawValue)
                    }
                    
                    //                Sign up button
                    HStack{
                        Text(LocalKeys.Auth.needAnAccount.rawValue.locale())
                            .modifier(MediumNormalTitle())
                        
                        Button{
                            
                        }label: {
                            Text(LocalKeys.Auth.signUp.rawValue.locale())
                                .modifier(ButtonTitle())
                                .foregroundColor(.blue)
                        }
                        
                        
                    }.padding(.top,ProjectPaddings.Top.small.rawValue)
                    
                }
                
            }
                
                
            }.padding(.all)
            .ignoresSafeArea()
    }
}
    
    
#Preview{
    SignInView()
}

