//
//  DetailsNewsVC.swift
//  Easy Health
//
//  Created by BJIT on 26/1/22.
//

import UIKit
import Alamofire

class DetailsNewsVC: UIViewController {
    
    @IBOutlet weak var newsHeadLine: UILabel!
    @IBOutlet weak var publishingDate: UILabel!
    @IBOutlet weak var newsBackGroundImage: UIImageView!
    @IBOutlet weak var newsDetails: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var supportView: UIView!
    
    
    var detailNews: NewsArticle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        containerView.layer.cornerRadius = 80
        supportView.layer.cornerRadius = 80
        newsBackGroundImage.layer.cornerRadius = 20
        containerView.layer.maskedCorners = [ .layerMaxXMinYCorner]
        supportView.layer.maskedCorners = [ .layerMaxXMinYCorner]
        
        newsBackGroundImage.image = UIImage(named: detailNews?.urlToImage ?? "newsBG")
        newsHeadLine.text = detailNews?.title
        newsDetails.text = detailNews?.description
        publishingDate.text = detailNews!.publishedAt
        
        
        let imageURL  = detailNews?.urlToImage
        AF.request("\(imageURL!)").responseData { [self] (response) in
            if response.error == nil
            {
                if let data = response.data {
                    newsBackGroundImage?.image = UIImage(data: data)
                }
            }
        }
    }
}
