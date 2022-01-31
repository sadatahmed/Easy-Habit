//
//  JournalFilterViewController.swift
//  Easy Health
//
//  Created by BJIT on 30/1/22.
//

import UIKit

class JournalFilterViewController: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet var buttons: [UIView]!
    
    static var moodSelector = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        popUpView.layer.cornerRadius = 12
        
        for button in buttons {
            button.layer.cornerRadius = 5
        }
    }
    
    @IBAction func funnyBtnTapped(_ sender: UIButton) {
        JournalFilterViewController.moodSelector = 1
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func confusedBtnTapped(_ sender: UIButton) {
        JournalFilterViewController.moodSelector = 2
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sadBtnTapped(_ sender: UIButton) {
        JournalFilterViewController.moodSelector = 3
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func hahaBtnTapped(_ sender: UIButton) {
        JournalFilterViewController.moodSelector = 4
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tensedBtnTapped(_ sender: UIButton) {
        JournalFilterViewController.moodSelector = 5
        _ = navigationController?.popViewController(animated: true)
    }
}
