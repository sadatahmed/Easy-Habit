//
//  JournalCVC.swift
//  Easy Health
//
//  Created by BJIT on 26/1/22.
//

import UIKit

class JournalCVC: UICollectionViewCell {
    

    @IBOutlet weak var journalBGImg: UIImageView!
    @IBOutlet weak var journalHeadline: UILabel!
    @IBOutlet weak var publishedDate: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        journalBGImg.layer.cornerRadius = 10
    }

}
