//
//  DetailsMoodVC.swift
//  Easy Health
//
//  Created by BJIT on 25/1/22.
//

import UIKit
import CoreData

class DetailsMoodVC: UIViewController {
    
    var details: PhotoGallery?
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var moodComment: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.layer.cornerRadius = 80
        containerView.layer.cornerRadius = 80
        containerView.layer.maskedCorners = [ .layerMaxXMinYCorner]
        profileImage.layer.maskedCorners = [ .layerMaxXMinYCorner]
        

        profileImage.image = UIImage(data: (details?.savedImage)! as Data)
        moodComment.text = details?.moodComment
    }
}
