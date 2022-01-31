//
//  GalleryFilterViewController.swift
//  Easy Health
//
//  Created by BJIT on 30/1/22.
//

import UIKit

class GalleryFilterViewController: UIViewController {
    
    
    @IBOutlet weak var popUpView: UIView!
    
    
    static var filterDay = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        popUpView.layer.cornerRadius = 12.0
    }
    
    @IBAction func allTime(_ sender: UIButton) {
        GalleryFilterViewController.filterDay = 1
        _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func lastSevenDays(_ sender: UIButton) {
        GalleryFilterViewController.filterDay = 2
        _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func last15Days(_ sender: Any) {
        GalleryFilterViewController.filterDay = 3
        _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func last30Days(_ sender: UIButton) {
        GalleryFilterViewController.filterDay = 4
        _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func today(_ sender: UIButton) {
        GalleryFilterViewController.filterDay = 5
        _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func yesterday(_ sender: UIButton) {
        GalleryFilterViewController.filterDay = 6
        _ = navigationController?.popViewController(animated: true)
    }
    

}
