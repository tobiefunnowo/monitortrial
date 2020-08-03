//
//  BasicCell.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 03/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class BasicCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var mainLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
