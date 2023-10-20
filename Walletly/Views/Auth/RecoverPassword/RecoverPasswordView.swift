//
//  RecoverPasswordView.swift
//  Walletly
//
//  Created by Gokhan Kaya on 10.10.2023.
//

import SwiftUI

struct RecoverPasswordView: View {
    @ObservedObject private var viewModel = RecoverPasswordViewViewModel()
    var body: some View {
        NavigationStack{
            GeometryReader{ geometry in
                VStack{
                    VStack(alignment: .leading) {
                        Image(ProjectImages.GeneralImages.walletlyLogo.rawValue)
                            .resizable()
                            .frame(width: geometry.dw(width: 0.38),height: geometry.dh(height: 0.1))
                        Text(LocalKeys.Auth.recoverPassword.rawValue.locale())
                            .modifier(LargeTitleModifier())
                    }.padding(.trailing,180)
                    
                    Text(LocalKeys.Auth.pleaseEnterYourEmail.rawValue.locale())
                        .modifier(BoldNormalTitle())
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.top,ProjectPaddings.Top.veryLarge.rawValue)
                    
                    
                    
                    HTextField(hint: LocalKeys.Auth.email.rawValue.locale(), iconName: "envelope.fill", text: $viewModel.email).padding(.top,ProjectPaddings.Top.veryLarge.rawValue).textInputAutocapitalization(.never)
                        
                    
                    
                    NormalButton(onTap: {
                        Task{
                            do{
                                try await viewModel.recoverPassword()
                            }catch{
                                print(error)
                            }
                        }
                    }, title:  LocalKeys.Auth.submit.rawValue).padding(.top,ProjectPaddings.Top.veryLarge.rawValue)
                    
                    
                }.padding()
            
            }
        }
    }
}

#Preview {
    RecoverPasswordView()
}
