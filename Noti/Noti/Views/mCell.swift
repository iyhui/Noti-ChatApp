//
//  mCell.swift
//  Noti
//
//  Created by Ida Hui on 5/15/20.
//  Copyright © 2020 Joui. All rights reserved.
//

import UIKit

class mCell: UITableViewCell {
    @IBOutlet weak var bubble: UIView!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        bubble.layer.cornerRadius = bubble.frame.size.height / 2.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
