//
//  NewsFilterViewController.swift
//  Easy Health
//
//  Created by BJIT on 30/1/22.
//

import UIKit

class NewsFilterViewController: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    
    static var filterformate = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        popUpView.layer.cornerRadius = 12.0
    }
    
    @IBAction func allTimefilterTapped(_ sender: UIButton) {
        NewsFilterViewController.filterformate = 1
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func last7DaysTapped(_ sender: UIButton) {
        NewsFilterViewController.filterformate = 2
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func last15DaysTapped(_ sender: UIButton) {
        NewsFilterViewController.filterformate = 3
        _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func last30DaysTapped(_ sender: UIButton) {
        NewsFilterViewController.filterformate = 4
        _ = navigationController?.popViewController(animated: true)
    }
    

}
