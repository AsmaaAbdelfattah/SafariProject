//
//  StarterViewController.swift
//  Safari
//
//  Created by Asmaa_Abdelfattah on 07/07/1402 AP.
//

import UIKit
import RxSwift
import RxCocoa
class StarterViewController: UIViewController , UICollectionViewDelegate{
   
    @IBOutlet weak var boardCV: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!{
        didSet{
        pageControl.numberOfPages = 3
    }}
    @IBOutlet weak var nextBtn: UIButton!{
        didSet{
            nextBtn.layer.borderWidth = 2
            nextBtn.layer.borderColor = UIColor.lightGray.cgColor
            nextBtn.layer.cornerRadius = 15
           // nextBtn.backgroundColor = UIColor.blue
        }
    }
    var items = Observable.just([
        Board(boardImg: "location", boardTitle: "قربنالك اعلاناتك", boardDesc: "اعلاناتك قريبه منك حسب موقعك"),
        Board(boardImg: "visa", boardTitle: "بيع ... اشتري ... بدل", boardDesc: "اعلاناتك قريبه منك حسب موقعك"),
        Board(boardImg: "time", boardTitle: "مزادك قرب بالفعل", boardDesc: "اعلاناتك قريبه منك حسب موقعك")])
    var disposeBag = DisposeBag()
    var currentPage: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        items.bind(to: boardCV.rx.items(cellIdentifier: "StartCollectionViewCell", cellType: StartCollectionViewCell.self)){index, item ,cell in
            print(index)
            cell.mainLabel.text = item.boardTitle
            cell.descriptionLabel.text = item.boardDesc
            cell.startImg.image = UIImage(named: item.boardImg)
        }.disposed(by: disposeBag)
        
        nextBtn.rx.tap.bind{
            if self.currentPage  < self.pageControl.numberOfPages - 1 {
                self.currentPage += 1
                self.boardCV.scrollToItem(at: IndexPath(row: self.currentPage  , section: 0), at: .centeredHorizontally, animated: true)
                self.pageControl.currentPage = self.currentPage
            }
            else {
                let storyboard = UIStoryboard(name: "ChooseAddress", bundle: nil)
                let chooseAddressVC = storyboard.instantiateViewController(withIdentifier: "ChooseAddress")
                self.navigationController?.pushViewController(chooseAddressVC, animated: true)
               
            }
        }.disposed(by: disposeBag)
        
    }
    
    
    
}
