//
//  TodoListCVC.swift
//  Easy Health
//
//  Created by BJIT on 27/1/22.
//

import UIKit

class TodoListCVC: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var TodoIcon: UIImageView!
    @IBOutlet weak var habitName: UILabel!
    @IBOutlet weak var serialNumView: UIView!
    @IBOutlet weak var serialNumber: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 12
        serialNumView.layer.cornerRadius = serialNumView.layer.bounds.width / 2
        serialNumView.clipsToBounds = true
    }

}
