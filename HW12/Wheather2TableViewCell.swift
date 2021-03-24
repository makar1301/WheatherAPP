//
//  Wheather2TableViewCell.swift
//  HW12
//
//  Created by mac on 19.03.2021.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit

class Wheather2TableViewCell: UITableViewCell {

    @IBOutlet weak var data2Label: UILabel!
    
    
    @IBOutlet weak var dailyTemp2Label: UILabel!
    
    @IBOutlet weak var dailyFeelsLike2Label: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
