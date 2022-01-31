//
//  GalleryImageHandler.swift
//  Easy Health
//
//  Created by BJIT on 24/1/22.
//

import Foundation
import CoreData
import UIKit


class GalleryInfoHandler {
    
    var image: UIImage? = nil
    var comments: String?
    
    
    // MARK: Save Image
    func saveImage() {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let photoObject = NSEntityDescription.insertNewObject(forEntityName: "PhotoGallery", into: context) as! PhotoGallery
        photoObject.savedImage = image?.jpegData(compressionQuality: 1) as Data?
        photoObject.moodComment = comments
        photoObject.picTakenDate = dateToTimeString(Date())
        print("----------------------")
        print(dateToTimeString(Date()))
        
        do {
            try context.save()
            print("Image saved")
        } catch {
            print("Error saving Image \(error)")
        }
    }
}


// MARK: Retrieve Image form DataBase
extension GalleryInfoHandler {
    func retrieveData() -> [PhotoGallery] {
        var photos = [PhotoGallery]()
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        do {
            photos = try (context.fetch(PhotoGallery.fetchRequest()))
        } catch {
            print("Error while Facing data")
        }
        return photos
    }
    
    
    
    func retrieveFilterData(filter: String) -> [PhotoGallery] {
        var photos = [PhotoGallery]()
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        do {
            let request = PhotoGallery.fetchRequest() as NSFetchRequest<PhotoGallery>
            let predicate = NSPredicate(format: "picTakenDate CONTAINS %@", filter)
            request.predicate = predicate
            
            
            photos = try context.fetch(request)
        } catch {
            print("Error while Facing data")
        }
        return photos
    }
    
    
    
    func retrieveRangeData(start: String, end: String) -> [PhotoGallery] {
        var photos = [PhotoGallery]()
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        do {
            let request = PhotoGallery.fetchRequest() as NSFetchRequest<PhotoGallery>
            let predicate = NSPredicate(format: "picTakenDate BETWEEN {'\(start)', '\(end)'}")
            print(predicate)
            request.predicate = predicate
            
            
            photos = try context.fetch(request)
        } catch {
            print("Error while Facing data")
        }
        return photos
    }
}


extension GalleryInfoHandler {
    func dateToTimeString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GTM")
        dateFormatter.dateFormat = "MMM-dd"
        let timeAsString = dateFormatter.string(from: date)
        
        return timeAsString
    }
}
