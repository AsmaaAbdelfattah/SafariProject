//
//  ChooseAddressViewController.swift
//  Safari
//
//  Created by Asmaa_Abdelfattah on 07/07/1402 AP.
//

import UIKit
import RxSwift
import DropDown
class ChooseAddressViewController: UIViewController {
    
    @IBOutlet weak var ChooseAddreesGif: UIImageView!
    @IBOutlet weak var addressTextField: UITextField!{
        didSet{
            let leftImage = UIImageView()
            let image1 = UIImage(systemName: "chevron.down")
            leftImage.image = image1
            let contentView = UIView()
            contentView.addSubview(leftImage)
            contentView.frame = CGRectMake(0, 0, 30, 15)
            leftImage.frame = CGRectMake(10, 0, 16, 16)
            
            addressTextField.leftView = contentView
            addressTextField.leftViewMode = UITextField.ViewMode.always
            addressTextField.tintColor = UIColor.white
            addressTextField.layer.cornerRadius = 10
            
        }
    }
    @IBOutlet weak var followBtn: UIButton!
    let dropDown = DropDown()
    var disposeBag = DisposeBag()
    var isSelected = false
    private let tapGestureRecognizer = UITapGestureRecognizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        configDropDown()
        tapGestureRecognizer.rx.event
            .subscribe(onNext: { [weak self]_ in
                self?.dropDown.show()
            })
            .disposed(by: disposeBag)
        
        addressTextField.addGestureRecognizer(tapGestureRecognizer)
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            isSelected = true
            addressTextField.text = item
            followBtn.backgroundColor = UIColor.darkBlue
            dropDown.hide()
        }
        followBtn.rx.tap.bind{[unowned self] _ in
            if self.isSelected{
                let storyboard = UIStoryboard(name: "Home", bundle: nil)
                let homeVC = storyboard.instantiateViewController(withIdentifier: "Home")
                
                self.navigationController?.pushViewController(homeVC, animated: true)
            }
            else{
                self.followBtn.backgroundColor = UIColor.lightGray
            }
        }.disposed(by: disposeBag)
    }
  
    func configDropDown(){
        addressTextField.addSubview(dropDown)
        dropDown.anchorView = addressTextField
        dropDown.dataSource = ["مصر", "السعوديه", "الإمارات المتحده العربيه",
                        "تونس", "الجزائر", "المغرب",
                               "لبنان"]
//        dropDown.cellNib = UINib(nibName: "\(CountryDropDownCell.self)", bundle: nil)
//        dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
//            guard let cell = cell as? CountryDropDownCell else { print("fai")
//                return }
//            cell.Countrylabel.text = countries[index]
//        }
}
    
    
    
}
