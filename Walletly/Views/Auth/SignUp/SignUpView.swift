//
//  SignUpView.swift
//  Walletly
//
//  Created by Gokhan Kaya on 5.10.2023.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject private var viewModel = SignUpViewViewModel()
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationStack{
            GeometryReader{geometry in
                VStack{
                    //                Welcome
                    VStack(alignment: .leading) {
                        Image(ProjectImages.GeneralImages.walletlyLogo.rawValue)
                            .resizable()
                            .frame(width: geometry.dw(width: 0.38),height: geometry.dh(height: 0.1))
                        Text(LocalKeys.Auth.joinWalletly.rawValue.locale())
                            .modifier(LargeTitleModifier())
                    }.padding(.trailing,140)
                    
                    //                Social Media Account
                    
                    VStack(spacing: 30) {
                        Text(LocalKeys.Auth.signUpWithSocialMediaAccount.rawValue.locale())
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
                        }
                            Text(LocalKeys.Auth.orUseYourEmailForSignUp.rawValue.locale())
                                .modifier(BoldNormalTitle())
                                .foregroundColor(.gray)
                        }.padding(.vertical,ProjectPaddings.Vertical.normal.rawValue)
                        
                        
                        //                Text fields
                        VStack(spacing: 30){
                            HTextField(hint: LocalKeys.Auth.yourName.rawValue.locale(), iconName: "person.fill", text: $viewModel.username)
                            
                            HTextField(hint: LocalKeys.Auth.email.rawValue.locale(), iconName: "envelope.fill", text: $viewModel.email).textInputAutocapitalization(.never)
                            
                            HSecureTextField(hint: LocalKeys.Auth.password.rawValue.locale(), iconName: "lock.fill", text: $viewModel.password)
                        }.padding(.horizontal,10)
                        
                        //                Button
                        NormalButton(onTap: {
                            Task{
                                do{
                                    try await viewModel.signUp()
                                }catch{
                                    print(error)
                                }
                            }
                        }, title: "Sign Up").padding(.top,ProjectPaddings.Top.small.rawValue).padding(.horizontal,10)
                    }
                }
            }
        }
    }
    
    struct SignUpView_Previews: PreviewProvider {
        static var previews: some View {
            SignUpView()
        }
    }

