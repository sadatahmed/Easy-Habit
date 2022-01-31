//
//  HabitStepsHandler.swift
//  Easy Health
//
//  Created by BJIT on 28/1/22.
//

import Foundation
import CoreData
import UIKit


class HabitStepsHandler {
    
    var duration: String?
    var startTime: Date?
    var reminder: Bool?
    var remindDays: [Bool]?
    
    
    // MARK: Save Image
    func saveHabitSteps() {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let stepObject = NSEntityDescription.insertNewObject(forEntityName: "HabitSteps", into: context) as! HabitSteps
        
        stepObject.reminder = reminder!
        stepObject.startTime = startTime! //dateToTimeString(startTime!)
        stepObject.duration = duration!
        stepObject.remindDay = remindDays
        stepObject.parentHabit = AddNewHabitStepsVC.selectedHabit
        stepObject.serialNum = String(retrieveHabitStepsData().count)
        
        do {
            try context.save()
            print("Habit Stapes Saved")
        } catch {
            print("Error saving Habit steps data \(error)")
        }
    }
}


// MARK: Retrieve Image form DataBase
extension HabitStepsHandler {
    func retrieveHabitStepsData() -> [HabitSteps] {
        var habitSteps = [HabitSteps]()
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        do {
            habitSteps = try (context.fetch(HabitSteps.fetchRequest()))
        } catch {
            print("Error while Facing data")
        }
        return habitSteps
    }
}


//extension HabitStepsHandler {
//    func dateToTimeString(_ date: Date) -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//        dateFormatter.timeZone = TimeZone(abbreviation: "GTM")
//        dateFormatter.dateFormat = "hh-mm"
//        let timeAsString = dateFormatter.string(from: date)
//
//        return timeAsString
//    }
//}
