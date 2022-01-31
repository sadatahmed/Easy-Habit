//
//  JournalDetailsVC.swift
//  Easy Health
//
//  Created by BJIT on 26/1/22.
//

import UIKit

class JournalDetailsVC: UIViewController {
    
    @IBOutlet weak var supportView: UIView!
    @IBOutlet weak var journalBGImg: UIImageView!
    @IBOutlet weak var journalTitle: UILabel!
    @IBOutlet weak var publishedDate: UILabel!
    @IBOutlet weak var journalDetailsNews: UILabel!
    @IBOutlet weak var moodImogi: UIImageView!
    
    var details: JournalGallery?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        journalBGImg.layer.cornerRadius = 15
        supportView.layer.cornerRadius = 80
        supportView.layer.maskedCorners = [ .layerMaxXMinYCorner]
        
        
        journalBGImg.image = UIImage(data: (details?.journalImage)! as Data)
        journalTitle.text = details?.journalTitle
        journalDetailsNews.text = details?.journalDetails
        publishedDate.text = details?.publishedDate
        moodImogi.image = UIImage(named: (details?.journalMood)!)
    }
    
    @IBAction func editBtnTapped(_ sender: UIBarButtonItem) {
        //dummyImageField.image = UIImage(data: details?.journalImage as Data)
    }
    
}
