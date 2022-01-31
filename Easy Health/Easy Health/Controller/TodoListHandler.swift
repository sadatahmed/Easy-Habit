//
//  TodoListHandler.swift
//  Easy Health
//
//  Created by BJIT on 27/1/22.
//

import Foundation
import CoreData
import UIKit


class TodoListHandler {
    
    var image: UIImage? = nil
    var habitName: String?
    var habitImage: String?
    
    
    // MARK: Save Image
    func saveHabitList() {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let habitObject = NSEntityDescription.insertNewObject(forEntityName: "HabitTodoList", into: context) as! HabitTodoList
        
        habitObject.habitName = habitName
        habitObject.habitImage = habitImage
        
        do {
            try context.save()
            print("New Habit Saved")
        } catch {
            print("Error saving Habit data \(error)")
        }
    }
}


// MARK: Retrieve Image form DataBase
extension TodoListHandler {
    func retrieveHabitListData() -> [HabitTodoList] {
        var habits = [HabitTodoList]()
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        do {
            habits = try (context.fetch(HabitTodoList.fetchRequest()))
        } catch {
            print("Error while Facing Habit")
        }
        return habits
    }
}
