//
//  RoutineCell.swift
//  LEVELtask
//
//  Created by Apple on 02/03/24.
//

import UIKit

class RoutineCell: UITableViewCell {

  
    @IBOutlet weak var img2: UIImageView!
   
    @IBOutlet weak var lbl3: UILabel!
    
    @IBOutlet weak var lbl4: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        img2.layer.cornerRadius = 10
        img2.layer.masksToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
