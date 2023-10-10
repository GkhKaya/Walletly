//
//  SignUpViewViewModel.swift
//  Walletly
//
//  Created by Gokhan Kaya on 5.10.2023.
//

import Foundation

final class SignUpViewViewModel : ObservableObject{
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var name : String = ""
}
