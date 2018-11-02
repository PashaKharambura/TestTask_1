//
//  FeedbackTableViewCell.swift
//  TestTask#1
//
//  Created by Pavlo Kharambura on 11/2/18.
//  Copyright © 2018 Pavlo Kharambura. All rights reserved.
//

import UIKit
import Cosmos

class FeedbackTableViewCell: UITableViewCell {

    @IBOutlet weak var starsView: CosmosView!
    @IBOutlet weak var feedbackComments: UILabel!
    @IBOutlet weak var circleView: UIView! {didSet{circleView.layer.cornerRadius = 22}}
    @IBOutlet weak var ratingCounterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
