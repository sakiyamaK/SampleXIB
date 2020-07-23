//
//  XIB1Cell.swift
//  SampleXIB
//
//  Created by sakiyamaK on 2020/07/23.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class XIB1Cell: UITableViewCell {

  static let reuseIdentifier = "XIB1Cell"

  @IBOutlet private weak var view1: UIView!
  @IBOutlet private weak var label1: UILabel!

  override func prepareForReuse() {
    super.prepareForReuse()
    view1.backgroundColor = .white
    label1.text = nil
  }

  func configure(text: String, color: UIColor) {
    label1.text = text
    view1.backgroundColor = color
  }

  //xibファイルの読み込み
  static func loadNib() -> UINib {
    return UINib(nibName: "XIB1Cell", bundle: nil)
  }
}
