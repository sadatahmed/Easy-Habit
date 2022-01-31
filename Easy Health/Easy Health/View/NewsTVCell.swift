//
//  NewsTVCell.swift
//  Easy Health
//
//  Created by BJIT on 26/1/22.
//

import UIKit

class NewsTVCell: UITableViewCell {
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsFullHeadline: UILabel!
    @IBOutlet weak var publishDate: UILabel!
    @IBOutlet weak var writtenBy: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        newsImage.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
