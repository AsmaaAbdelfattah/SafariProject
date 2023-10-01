//
//  Tableview.swift
//  LowCal
//
//  Created by Asmaa_Abdelfattah on 21/03/1402 AP.
//

import UIKit
class AutomaticHeightTableView: UITableView {

    override var intrinsicContentSize: CGSize {
       self.layoutIfNeeded()
       return self.contentSize
     }

     override var contentSize: CGSize {
       didSet{
         self.invalidateIntrinsicContentSize()
       }
     }

     override func reloadData() {
       super.reloadData()
       self.invalidateIntrinsicContentSize()
     }

}
