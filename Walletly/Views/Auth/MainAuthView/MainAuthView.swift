//
//  MainAuthView.swift
//  Walletly
//
//  Created by Gokhan Kaya on 25.10.2023.
//

import SwiftUI

struct MainAuthView: View {
    @ObservedObject private var viewModel = MainAuthViewViewModel()
    var body: some View {
        NavigationStack{
            GeometryReader{geometry in
                VStack{
                    //                    Walletly Logo
                    HStack{
                        Spacer()
                        Image(ProjectImages.GeneralImages.walletlyLogo.rawValue)
                            .resizable()
                            .frame(width: geometry.dw(width: 0.38),height: geometry.dh(height: 0.1))
                        Spacer()
                    
                    }.padding(.top,ProjectPaddings.Top.hugeLarge.rawValue)
                    
                    //                     Description text
                    Text(LocalKeys.Auth.pleaseUseYourSocialMediaAccountOrEmailForSignInToWalletly.rawValue.locale())
                        .modifier(BoldNormalTitle())
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.top,ProjectPaddings.Top.veryLarge.rawValue)
                    
                    //                    Social media buttons
                    VStack(spacing: 30) {
                        //                        Sign In Google Button
                        NormalButtonWithIcon(onTap: {
                            Task{
                                do{
                                    try await viewModel.googleSignIn()
                                }catch{
                                    print(error)
                                }
                            }
                        }, title: LocalKeys.Auth.signInWithGoogle.rawValue, iconName: ProjectImages.GeneralImages.icGoogle.rawValue, backgroundColor: .blue, textColor: .white,width: geometry.dw(width: 0.07),height: geometry.dh(height: 0.03))
                        //                        Sign In Facebook Button
                        NormalButtonWithIcon(onTap: {
                            
                        }, title: LocalKeys.Auth.signInWithFacebook.rawValue, iconName: ProjectImages.GeneralImages.icFacebook.rawValue, backgroundColor: .nude_blue, textColor: .white,width: geometry.dw(width: 0.07),height: geometry.dh(height: 0.03))
                        //                        Sign In Apple Button
                        NormalButtonWithIcon(onTap: {
                            
                        }, title: LocalKeys.Auth.signInWithApple.rawValue, iconName: ProjectImages.GeneralImages.icApple.rawValue, backgroundColor: .white, textColor: .black,width: geometry.dw(width: 0.07),height: geometry.dh(height: 0.03))
                        
                    }.padding(.top,ProjectPaddings.Top.veryLarge.rawValue)
                    
                    //                    Divider
                    Divider()
                        .frame(width: geometry.dw(width: 0.6),height: geometry.dh(height: 0.001))
                        .overlay(Color.gray)
                        .padding(.top,ProjectPaddings.Top.small.rawValue)
                    
                    //                    Sign In Button
                    NormalButton(onTap: {
                        viewModel.goToSignInView = true
                    }, title: LocalKeys.Auth.signInWithEmail.rawValue)
                    .padding(.top,ProjectPaddings.Top.normal.rawValue)
                    .navigationDestination(isPresented: $viewModel.goToSignInView){
                        SignInView()
                    }
                    
                    //                    Forgot Password Button
                    NavigationLink(destination: RecoverPasswordView()) {
                        Text(LocalKeys.Auth.forgotPassword.rawValue.locale())
                            .modifier(BoldNormalTitle())
                            .padding(.top,ProjectPaddings.Top.small.rawValue)
                    }
                    
                    Spacer()
                    
                    //                Sign up button
                    HStack{
                        Text(LocalKeys.Auth.needAnAccount.rawValue.locale())
                            .modifier(MediumNormalTitle())
                        
                        
                        NavigationLink(destination: SignUpView()) {
                            Text(LocalKeys.Auth.signUpWithEmail.rawValue.locale())
                                .modifier(ButtonTitle())
                                .foregroundColor(.blue)
                        }
                        
                    }.padding(.bottom,ProjectPaddings.Bottom.veryLarge.rawValue)
                }.padding()
            }.ignoresSafeArea()
                

        }
    }
}

#Preview {
    MainAuthView().ignoresSafeArea()
}
