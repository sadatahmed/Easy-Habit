//
//  CustomGalleryVC.swift
//  Easy Health
//
//  Created by BJIT on 24/1/22.
//

import UIKit
import CoreData

class CustomGalleryVC: UIViewController {
    
    var photos = [PhotoGallery]()
    var moodDetails: PhotoGallery?
    let galleryImageHandler = GalleryInfoHandler()
    
    
    @IBOutlet weak var galleryCollectionView: UICollectionView!
    @IBOutlet weak var containerView: UIView!
    
    static let galleryCellIdentifier = "customGalleryID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibCell = UINib(nibName: "CustomGalleryCVCell", bundle: nil)
        galleryCollectionView.register(nibCell, forCellWithReuseIdentifier: CustomGalleryVC.galleryCellIdentifier)
        
        containerView.layer.cornerRadius = 70
        containerView?.layer.maskedCorners = [ .layerMaxXMinYCorner]
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 93, height: 93)
        galleryCollectionView.collectionViewLayout = layout
    }
    
    override func viewWillAppear(_ animated: Bool) {
        galleryCollectionView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goTomoodDetails" {
            let destinationViewController = segue.destination as! DetailsMoodVC
            destinationViewController.details = moodDetails
        }
    }
}


extension CustomGalleryVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dayValidator()
        print(photos.count)
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        moodDetails = photos[indexPath.row]
        performSegue(withIdentifier: "goTomoodDetails", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = galleryCollectionView.dequeueReusableCell(withReuseIdentifier: CustomGalleryVC.galleryCellIdentifier, for: indexPath) as! CustomGalleryCVCell

        dayValidator()
        
        cell.galleryImage.image = UIImage(data: photos[indexPath.row].savedImage! as Data)
        cell.dateLabel.text = photos[indexPath.row].picTakenDate
        
        return cell
        
    }
    
    func dayValidator() {
        let dayAgo = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        let sevenDaysAgo = Calendar.current.date(byAdding: .day, value: -7, to: Date())
        let halfMonthAgo = Calendar.current.date(byAdding: .day, value: -15, to: Date())
        let monthAgo = Calendar.current.date(byAdding: .month, value: -1, to: Date())
        
        
        if GalleryFilterViewController.filterDay == 1 {
            photos = galleryImageHandler.retrieveData()
        }
        else if GalleryFilterViewController.filterDay == 2 {
            photos = galleryImageHandler.retrieveRangeData(start: galleryImageHandler.dateToTimeString(sevenDaysAgo!), end: galleryImageHandler.dateToTimeString(Date()))
        }
        else if GalleryFilterViewController.filterDay == 3 {
            photos = galleryImageHandler.retrieveRangeData(start: galleryImageHandler.dateToTimeString(halfMonthAgo!), end: galleryImageHandler.dateToTimeString(Date()))
        }
        else if GalleryFilterViewController.filterDay == 4 {
            photos = galleryImageHandler.retrieveRangeData(start: galleryImageHandler.dateToTimeString(monthAgo!), end: galleryImageHandler.dateToTimeString(Date()))
        }
        else if GalleryFilterViewController.filterDay == 5 {
            photos = galleryImageHandler.retrieveFilterData(filter: galleryImageHandler.dateToTimeString(Date()))
        }
        else if GalleryFilterViewController.filterDay == 6 {
            photos = galleryImageHandler.retrieveFilterData(filter: galleryImageHandler.dateToTimeString(dayAgo!))
        }
        else {
            photos = galleryImageHandler.retrieveData()
        }
    }
}

extension CustomGalleryVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 93, height: 93)
    }
}

