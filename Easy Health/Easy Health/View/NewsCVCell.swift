//
//  NewsCVCell.swift
//  Easy Health
//
//  Created by BJIT on 26/1/22.
//

import UIKit

class NewsCVCell: UICollectionViewCell {
    
    @IBOutlet weak var mainBGImage: UIImageView!
    @IBOutlet weak var newsHeadLine: UILabel!
    @IBOutlet weak var authorName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainBGImage.layer.cornerRadius = 10
    }

}
