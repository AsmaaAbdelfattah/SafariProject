//
//  HomeTableCellEXT.swift
//  Safari
//
//  Created by Asmaa_Abdelfattah on 09/07/1402 AP.
//

import Foundation
import UIKit
extension HomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let subCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as? ItemCollectionViewCell else {return UICollectionViewCell()}
        subCell.itemLabel.text = items?[indexPath.row].name
        //subCell.itemImg.image = items[indexPath.row].imageUrl
        return subCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 3) - 20, height: (collectionView.frame.height / 2) - 10 )
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(25)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(25)
    }
}
