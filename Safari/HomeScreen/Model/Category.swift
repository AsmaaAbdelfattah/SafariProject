//
//  Category.swift
//  Safari
//
//  Created by Asmaa_Abdelfattah on 08/07/1402 AP.
//

import Foundation

struct Categories: Decodable {
    var codeStatus: Int
    var message: String
    var data:[Category]
}
struct Category: Decodable{
    var id: Int
    var name : String
    var description: String?
    var imageUrl: String
    var countOfAds: Int
    var subCategories : [subCategories]
}
struct subCategories:Decodable{
    var id: Int
    var name:String
     var description: String?
     var imageUrl: String
    var categoryId: Int
}

