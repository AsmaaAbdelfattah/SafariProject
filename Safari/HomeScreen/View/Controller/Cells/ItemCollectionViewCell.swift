//
//  ItemCollectionViewCell.swift
//  Safari
//
//  Created by Asmaa_Abdelfattah on 08/07/1402 AP.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var itemView: UIView!{
        didSet{
            itemView.clipsToBounds = true
            itemView.layer.cornerRadius = 10
            itemView.layer.maskedCorners = [.layerMaxXMaxYCorner , .layerMaxXMinYCorner]
        }
    }
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemImg: UIImageView!
}
