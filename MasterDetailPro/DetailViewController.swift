//
//  ViewController.swift
//  MasterDetailPro
//
//  Created by RTC-HN154 on 10/7/19.
//  Copyright © 2019 RTC-HN154. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    var textCell: String? {
        didSet {
            configure()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        // với những màn hình plus + ipad khi xoay ngang sẽ hiển thị cả 2 màn. Tại màn Detail sẽ hiện thị thêm nút bên trái để thay đổi hiển thị
        navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
        // Với Ipad sẽ k hiển thị nút back tại màn hình Detail. mã này sẽ giúp nút Back luôn hiển thị
        navigationItem.leftItemsSupplementBackButton = true
    }
    func configure() {
        if let textCell = textCell {
            if let textLabel = textLabel {
                textLabel.text = textCell
            }
        }
    }


}

