//
//  XIB1View.swift
//  SampleXIB
//
//  Created by sakiyamaK on 2020/07/23.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class XIB1View: UIView {
  
  @IBOutlet private weak var label: UILabel!

  func configure(text: String, backgroundColor: UIColor) {
    label.text = text
    self.backgroundColor = backgroundColor
  }

  //xibファイルの読み込み
  static func loadXIB() -> XIB1View? {
    return UINib(nibName: "XIB1View" , bundle: nil).instantiate(withOwner: self, options: nil).first as? XIB1View
  }
}
