//
//  HomeVCEXT.swift
//  Safari
//
//  Created by Asmaa_Abdelfattah on 08/07/1402 AP.
//

import Foundation
import UIKit
import ImageKitIO
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else{ return UITableViewCell() }
        cell.CategoryLabel.text = categories?[indexPath.row].name
        cell.noOfAds.text = String(categories?[indexPath.row].countOfAds ?? 0)
     //   cell.itemsCV.numberOfItems(inSection: categories?[indexPath.row].subCategories.count ?? 0)
        cell.items = categories?[indexPath.row].subCategories
        return cell
    }
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return categories?.count ?? 0
//    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MainCategoriesHeader") as? MainCategoriesHeader else { return UIView()}
//
//        header.mainCategoryLabel.text = categories?[section].name
//       // header.mainCaregoryImg.image = ImageKit.shared.url(src:categories?[section].imageUrl ?? "")
//        header.numberOfAdsLabel.text = String( categories?[section].countOfAds ?? 0)
//        return header
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return CGFloat(60)
//    }
}
