//
//  ProductTableViewCell.swift
//  UITableViewCellTest
//
//  Created by Chris Xiong on 2019/10/14.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var proDetail: UILabel!
    @IBOutlet weak var proTitle: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    
    
    
}
