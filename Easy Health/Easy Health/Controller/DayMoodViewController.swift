//
//  DayMoodViewController.swift
//  Easy Health
//
//  Created by BJIT on 23/1/22.
//

import UIKit
import CoreData

class DayMoodViewController: UIViewController {
    
    var photos = [PhotoGallery]()
    var image: UIImage? = nil
    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var commentTextField: UITextView!
    
    @IBOutlet weak var finalImage: UIImageView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profilePicture?.layer.cornerRadius = 80
        profilePicture?.layer.maskedCorners = [ .layerMaxXMinYCorner]
        
        containerView?.layer.cornerRadius = 80
        containerView?.layer.maskedCorners = [ .layerMaxXMinYCorner]
    }
    
    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        
        let galleryImageHandler = GalleryInfoHandler()
        galleryImageHandler.image = profilePicture.image
        galleryImageHandler.comments = commentTextField.text
        galleryImageHandler.saveImage()
    }
}


// MARK: Action Sheet
extension DayMoodViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
}


// MARK: Select Image through Image Picker
extension DayMoodViewController {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            profilePicture.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
