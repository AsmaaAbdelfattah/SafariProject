//
//  SectionCategory.swift
//  Safari
//
//  Created by Asmaa_Abdelfattah on 08/07/1402 AP.
//

import Foundation
import RxDataSources
struct SectionOfCategory {
  var header: String
  var items: [Item]
}
extension SectionOfCategory: SectionModelType {
  typealias Item = Category

   init(original: SectionOfCategory, items: [Item]) {
    self = original
    self.items = items
  }
}
