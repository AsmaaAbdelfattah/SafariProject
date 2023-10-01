//
//  ViewController.swift
//  Safari
//
//  Created by Asmaa_Abdelfattah on 07/07/1402 AP.
//

import UIKit
import RxSwift
class SplashViewController: UIViewController {
    
    @IBOutlet weak var splashImage: UIImageView!
    let disposeBag = DisposeBag()
    let langDefault = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        langDefault.set("ar", forKey: "Lang")
        guard let splashImg = UIImage(named: "splashSafari") else {
            return
        }
    
        splashImage.rx.image.onNext(splashImg)
        Observable<Int>.timer(.seconds(2), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                self?.performSegue(withIdentifier: "start", sender: nil)
            }).disposed(by: disposeBag)
    }
    
    
}

