//
//  SettingsTableViewCell.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 06/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var myImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        mySwitch.isHidden = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
