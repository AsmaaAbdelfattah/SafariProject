//
//  CategoriesViewModel.swift
//  Safari
//
//  Created by Asmaa_Abdelfattah on 08/07/1402 AP.
//

import Foundation
import RxSwift
class CategoriesViewModel{
    var bindMainCategory : (() -> ()) = {}
    var mainCategories :[Category]! {
        didSet {
            bindMainCategory()
        }
    }
    var bindSubCategory : (() -> ()) = {}
    var SubCategories :[[subCategories]]! {
        didSet {
            bindMainCategory()
        }
    }
    let networkService = NetworkServiceManager.getInstance()
    func getMainCategories(url : String){
        networkService.getMainCategory(url: url) { categories, error in
            guard let data = categories , error == nil else{
                print(error?.localizedDescription)
                return
            }
            self.mainCategories = data.data
//            for category in self.mainCategories{
//                self.SubCategories.append(contentsOf: category.subCategories)
//            }
//            print(self.SubCategories)
        }
    }
}
