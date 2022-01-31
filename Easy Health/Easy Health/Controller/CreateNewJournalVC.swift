//
//  CreateNewJournalVC.swift
//  Easy Health
//
//  Created by BJIT on 26/1/22.
//

import UIKit

class CreateNewJournalVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dummyImageField: UIImageView!
    @IBOutlet weak var detailsTextField: UITextField!
    @IBOutlet weak var changeImageBtn: UIButton!
    @IBOutlet weak var supportView: UIView!
    @IBOutlet weak var imagePicker: UIButton!
    @IBOutlet weak var imagepickerHeight: NSLayoutConstraint!
    @IBOutlet weak var pickerImageHeight: NSLayoutConstraint!
    
    @IBOutlet var journalMoodBtns: [UIButton]!
    
    @IBOutlet weak var tensedbtn: UIButton!
    @IBOutlet weak var sadBtn: UIButton!
    @IBOutlet weak var confusedBtn: UIButton!
    @IBOutlet weak var funnyBtn: UIButton!
    @IBOutlet weak var hahaBtn: UIButton!
    
    
    
    var photos = [PhotoGallery]()
    var image: UIImage? = nil
    var selecteMood: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        supportView.layer.cornerRadius = 80
        supportView.layer.maskedCorners = [ .layerMaxXMinYCorner]
    
        dummyImageField.isHidden = true
        pickerImageHeight.constant = 0
        changeImageBtn.isHidden = true
        
        for button in journalMoodBtns {
            button.layer.cornerRadius = 8
        }
    }

    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        let journalInfoHandler = JournalInfoHandler()
        journalInfoHandler.image = dummyImageField.image
        journalInfoHandler.journalTitle = titleTextField.text
        journalInfoHandler.journalDetails = detailsTextField.text
        journalInfoHandler.journalMood = selecteMood
        journalInfoHandler.saveJournal()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func imagePickerTapped(_ sender: UIButton) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Choose from Gallery", style: .default, handler: { action in
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true)
        }))
        actionSheet.addAction(UIAlertAction(title: "Take a photo", style: .default, handler: { action in
            print("Camera")
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            print("Cancel")
        }))
        
        present(actionSheet, animated: true, completion: nil)
    }
    

    
    
    @IBAction func tensedBtnTapped(_ sender: UIButton) {
        selecteMood = "tensed"
        for i in 0 ... 4 {
            journalMoodBtns[i].backgroundColor = .white
        }
        tensedbtn.backgroundColor = .blue
    }
    
    @IBAction func funnyBtnTapped(_ sender: UIButton) {
        selecteMood = "funny"
        for i in 0 ... 4 {
            journalMoodBtns[i].backgroundColor = .white
        }
        funnyBtn.backgroundColor = .blue
    }
    @IBAction func hahaBtnTapped(_ sender: UIButton) {
        selecteMood = "haha"
        for i in 0 ... 4 {
            journalMoodBtns[i].backgroundColor = .white
        }
        hahaBtn.backgroundColor = .blue
    }
    @IBAction func sadBtnTapped(_ sender: UIButton) {
        selecteMood = "sad"
        for i in 0 ... 4 {
            journalMoodBtns[i].backgroundColor = .white
        }
        sadBtn.backgroundColor = .blue
    }
    
    @IBAction func confusedBtnTapped(_ sender: Any) {
        selecteMood = "confused"
        for i in 0 ... 4 {
            journalMoodBtns[i].backgroundColor = .white
        }
        confusedBtn.backgroundColor = .blue
    }
    
    
}


extension CreateNewJournalVC {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            dummyImageField.image = image
            dummyImageField.isHidden = false
            changeImageBtn.isHidden = false
            imagePicker.isHidden = true
            imagepickerHeight.constant = 0
            pickerImageHeight.constant = 180
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
