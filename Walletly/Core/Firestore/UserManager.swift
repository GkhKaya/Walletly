//
//  UserManager.swift
//  Walletly
//
//  Created by Gokhan Kaya on 9.12.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseCore

final class UserManager{
    static let shered = UserManager()
    private init() {}
    private let userCollection = Firestore.firestore().collection("users")
    private func userDocument(userId : String) -> DocumentReference{
        userCollection.document(userId)
    }
    
    private let encoder: Firestore.Encoder = {
        let encoder = Firestore.Encoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
    
    private let decoder : Firestore.Decoder = {
        let decoder = Firestore.Decoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    func crateNewUser(user: DBUserModel) async throws{
        try userDocument(userId: user.userId).setData(from: user,merge:false,encoder: encoder)
    }
    
    func getUser(userId:String) async throws -> DBUserModel{
        try await userDocument(userId: userId).getDocument(as: DBUserModel.self,decoder: decoder)
    }
}
