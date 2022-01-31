//
//  JournalInfoHandler.swift
//  Easy Health
//
//  Created by BJIT on 26/1/22.
//

import Foundation
import CoreData
import UIKit


class JournalInfoHandler {
    
    var image: UIImage? = nil
    var journalDetails: String?
    var journalTitle: String?
    var journalMood: String?
    
    
    // MARK: Save Image
    func saveJournal() {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let journalObject = NSEntityDescription.insertNewObject(forEntityName: "JournalGallery", into: context) as! JournalGallery
        journalObject.journalImage = image?.jpegData(compressionQuality: 1) as Data?
        journalObject.publishedDate = dateToTimeString(Date())
        journalObject.journalDetails = journalDetails
        journalObject.journalTitle = journalTitle
        journalObject.journalMood = journalMood
        
        do {
            try context.save()
            print("Journal Saved")
        } catch {
            print("Error saving journal data \(error)")
        }
    }
}


// MARK: Retrieve Image form DataBase
extension JournalInfoHandler {
    func retrieveJournalData() -> [JournalGallery] {
        var journals = [JournalGallery]()
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        do {
            journals = try (context.fetch(JournalGallery.fetchRequest()))
        } catch {
            print("Error while Facing journal data")
        }
        return journals
    }
    
    
    func retrieveFilterJournalData(filterData: String) -> [JournalGallery] {
        var journals = [JournalGallery]()
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        do {
            let request = JournalGallery.fetchRequest() as NSFetchRequest<JournalGallery>
            let predicate = NSPredicate(format: "journalMood CONTAINS '\(filterData)'")
            request.predicate = predicate
            print(predicate)
            journals = try (context.fetch(request))
        } catch {
            print("Error while Facing journal data")
        }
        return journals
    }
}


extension JournalInfoHandler {
    func dateToTimeString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GTM")
        dateFormatter.dateFormat = "MMM-dd"
        let timeAsString = dateFormatter.string(from: date)
        
        return timeAsString
    }
}
