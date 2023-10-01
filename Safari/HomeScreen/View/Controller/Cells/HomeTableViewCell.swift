//
//  HomeTableViewCell.swift
//  Safari
//
//  Created by Asmaa_Abdelfattah on 08/07/1402 AP.
//

import UIKit
import RxSwift
import RxCocoa
import ImageKitIO
class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var itemsCV: UICollectionView!{
        didSet{
            itemsCV.dataSource = self
            itemsCV.delegate = self
        }
    }
    
    @IBOutlet weak var CategoryLabel: UILabel!
    @IBOutlet weak var noOfAds: UILabel!
    let categoriesViewModel = CategoriesViewModel()
    //var disposeBag = DisposeBag()
    var items : [subCategories]?
    override func awakeFromNib() {
        super.awakeFromNib()
       // categoriesViewModel.mainCategories
        //    .bind(to: itemsCV.rx.items(cellIdentifier: "ItemCollectionViewCell", cellType: ItemCollectionViewCell.self)){ (index, item ,cell)  in
            //    cell.itemLabel.text = item.subCategories[index].name
               // cell.itemImg.image = ImageKit.shared.url(src: item.subCategories[index].imageUrl)
                
         //   }.disposed(by: disposeBag)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
