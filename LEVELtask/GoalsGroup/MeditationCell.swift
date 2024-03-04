//
//  MeditationCell.swift
//  LEVELtask
//
//  Created by Apple on 01/03/24.
//

import UIKit

class MeditationCell: UICollectionViewCell {

    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        // Initialization code
    }

}
