//
//  HomeViewController.swift
//  Safari
//
//  Created by Asmaa_Abdelfattah on 08/07/1402 AP.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import ImageKitIO
class HomeViewController: UIViewController{
    
    @IBOutlet weak var homeTB: UITableView!{
        didSet{
            homeTB.delegate = self
            homeTB.dataSource = self
          // homeTB.estimatedRowHeight = 300
          // homeTB.rowHeight = UITableView.automaticDimension
           homeTB.rowHeight = 300
            homeTB.register(UINib(nibName: "MainCategoriesHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "\(MainCategoriesHeader.self)")
        }
    }
    
    
    @IBOutlet weak var homeTBHeight: NSLayoutConstraint!
    let categoriesViewModel = CategoriesViewModel()
    var disposeBag = DisposeBag()
    var categories: [Category]?
    let langDefault = UserDefaults.standard
    let networkService = NetworkServiceManager.getInstance()
    override func viewWillAppear(_ animated: Bool) {
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ULANG\(String(describing: langDefault.value(forKey: "Lang")))")
       // networkService.postRegister(url: "http://projectegy-002-site59.gtempurl.com/Api/Account/register", user: UserDataBody(FullName: "Gege", PhoneNumber: "014785239", Email: "lili@gmail.com", Password: "14789", ConfirmPassword: "14789"))
        categoriesViewModel.getMainCategories(url: "\(baseUrl)Api/Category/MainCategoryWithSub?pageIndex=0&size=15&lang=ar")
        categoriesViewModel.bindMainCategory = {() in
            DispatchQueue.main.async {
                self.categories = self.categoriesViewModel.mainCategories
                self.homeTB.reloadData()
            }
        }
        
        self.homeTB.reloadData()
        navigationController?.navigationBar.isHidden = false
     //   tabBarController?.tabBarController?.tabBar.isHidden = false
//                categoriesViewModel.mainCategories
//                    .bind(to: homeTB.rx.items(cellIdentifier: "HomeTableViewCell",cellType: HomeTableViewCell.self)){ (indexPath, product , item ) -> Void  in
//
//                    }.disposed(by: disposeBag)
        //
        //        let dataSource = RxTableViewSectionedReloadDataSource<SectionOfCategory>(
        //            configureCell: { dataSource, tableView, indexPath, item in
        //                guard let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MainCategoriesHeader")
        //                        as? MainCategoriesHeader else { return }
        //                cell.mainCategoryLabel.text = item.name
        //                cell.mainCaregoryImg.image = ImageKit.shared.url(src: item.imageUrl)
        //                cell.numberOfAdsLabel.text = item.countOfAds
        //                return cell
        //            })
       // categoriesViewModel.mainCategories.bind(to: homeTB.rx.items(cellIdentifier: "Home") )
//                categoriesViewModel.mainCategories
//                    .bind(to: homeTB.rx.items(dataSource: dataSource))
//                    .disposed(by: disposeBag)
    }
   
}
