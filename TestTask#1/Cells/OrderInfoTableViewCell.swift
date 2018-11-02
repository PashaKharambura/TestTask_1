//
//  OrderInfoTableViewCell.swift
//  TestTask#1
//
//  Created by Pavlo Kharambura on 11/2/18.
//  Copyright © 2018 Pavlo Kharambura. All rights reserved.
//

import UIKit

class OrderInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var bookTime: UILabel!
    @IBOutlet weak var hotelName: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setShadow(outerView: bgView, shadowOpacity: 0.5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
