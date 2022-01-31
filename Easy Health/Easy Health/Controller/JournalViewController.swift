//
//  JournalViewController.swift
//  Easy Health
//
//  Created by BJIT on 26/1/22.
//

import UIKit

class JournalViewController: UIViewController {
    
    @IBOutlet weak var supportView: UIView!
    @IBOutlet weak var journalCollectionView: UICollectionView!
    
    var journals = [JournalGallery]()
    var selectedJournal: JournalGallery?
    let journalInfoHandler = JournalInfoHandler()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let nibCell = UINib(nibName: "JournalCVC", bundle: nil)
        journalCollectionView.register(nibCell, forCellWithReuseIdentifier: "journalCell")
        
        supportView.layer.cornerRadius = 80
        supportView.layer.maskedCorners = [ .layerMaxXMinYCorner]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        journalCollectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetails" {
            let destinationViewController = segue.destination as! JournalDetailsVC
            destinationViewController.details = selectedJournal
        }
    }
    
}


extension JournalViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedJournal = journals[indexPath.row]
        performSegue(withIdentifier: "goToDetails", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        moodFilterer()
        print(journals.count)
        print("=============")
        return journals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = journalCollectionView.dequeueReusableCell(withReuseIdentifier: "journalCell", for: indexPath) as! JournalCVC

        moodFilterer()
        
        cell.journalBGImg.image = UIImage(data: journals[indexPath.row].journalImage! as Data)
        cell.publishedDate.text = journals[indexPath.row].publishedDate
        cell.journalHeadline.text = journals[indexPath.row].journalTitle
        
        return cell
    }
    
    
    
    func moodFilterer() {
        
        if JournalFilterViewController.moodSelector == 1 {
            journals = journalInfoHandler.retrieveFilterJournalData(filterData: "funny")
        }
        else if JournalFilterViewController.moodSelector == 2 {
            journals = journalInfoHandler.retrieveFilterJournalData(filterData: "confused")
        }
        else if JournalFilterViewController.moodSelector == 3 {
            journals = journalInfoHandler.retrieveFilterJournalData(filterData: "sad")
        }
        else if JournalFilterViewController.moodSelector == 4 {
            journals = journalInfoHandler.retrieveFilterJournalData(filterData: "haha")
        }
        else if JournalFilterViewController.moodSelector == 5 {
            journals = journalInfoHandler.retrieveFilterJournalData(filterData: "tensed")
        }
        
        else {
            journals = journalInfoHandler.retrieveJournalData()
        }
    }
}
