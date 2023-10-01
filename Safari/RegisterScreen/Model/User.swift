//
//  User.swift
//  Safari
//
//  Created by Asmaa_Abdelfattah on 09/07/1402 AP.
//

import Foundation

struct UserDataBody: Decodable{
    
    var FullName: String
    var PhoneNumber: String
    var Email: String
    var Password: String
    var ConfirmPassword: String
    var Image: String?
}
struct User: Decodable{
    var codeStatus: Int
    var message: String
    var data: UserDataResponse
}
struct UserDataResponse: Decodable{
    var id: String
    var fullName: String
    var description: String?
    var userRefrencedId: Int?
    var profileImage: String?
    var latitude: String
    var longitude: String
    var isDeleted: Bool
    var createdOn: String
    var updatedOn: String
    var userCode: String
    var refrenceCode: Int?
    var token: String
    var phoneNumber: String
    var email: String
    var isFollow: Bool
    var isBlock: Bool
}
