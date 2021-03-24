//
//  WheatherTableViewCell.swift
//  HW12
//
//  Created by mac on 02.03.2021.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit

class WheatherTableViewCell: UITableViewCell {
    

    @IBOutlet weak var dataLabel: UILabel!
    
    
    @IBOutlet weak var dailyTempLabel: UILabel!
    
    @IBOutlet weak var dailyFeelsLikeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

  
    }

}
