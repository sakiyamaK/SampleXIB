//
//  ViewController.swift
//  SampleXIB
//
//  Created by sakiyamaK on 2020/07/23.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  /*XIBのViewを貼り付ける*/
  //xibで読み込むview
  private var xibView: XIB1View?
  //xibで読み込んだviewを貼り付けるview
  @IBOutlet private weak var containerView: UIView! {
    didSet {
      //XIBを読み込むstaticメソッド
      guard let xibView = XIB1View.loadXIB() else { return }
      containerView.addSubview(xibView)
      //古いレイアウトの仕様をoffにする
      xibView.translatesAutoresizingMaskIntoConstraints = false
      //四隅に制約を貼ってactiveにする
      NSLayoutConstraint.activate([
        xibView.topAnchor.constraint(equalTo: containerView.topAnchor),
        xibView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        xibView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
        xibView.rightAnchor.constraint(equalTo: containerView.rightAnchor)
      ])
      xibView.configure(text: "xibだよ", backgroundColor: .green)
      self.xibView = xibView
    }
  }

  let data = 1...10

  /*XIBのCellを登録する*/
  @IBOutlet private weak var tableView: UITableView! {
    didSet {
      tableView.register(XIB1Cell.loadNib(), forCellReuseIdentifier: XIB1Cell.reuseIdentifier)
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: XIB1Cell.reuseIdentifier, for: indexPath) as? XIB1Cell else {
      return UITableViewCell()
    }
    cell.configure(text: indexPath.row.description, color: indexPath.row%2 == 0 ? .red : .blue)
    return cell
  }
}

