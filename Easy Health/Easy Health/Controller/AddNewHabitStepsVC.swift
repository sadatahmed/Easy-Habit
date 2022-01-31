//
//  AddNewHabitStepsVC.swift
//  Easy Health
//
//  Created by BJIT on 28/1/22.
//

import UIKit
import UserNotifications

class AddNewHabitStepsVC: UIViewController {
    
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var startTime: UIDatePicker!
    @IBOutlet weak var reminderStatus: UISwitch!
    @IBOutlet weak var sun: UIButton!
    @IBOutlet weak var mon: UIButton!
    @IBOutlet weak var tue: UIButton!
    @IBOutlet weak var wed: UIButton!
    @IBOutlet weak var thu: UIButton!
    @IBOutlet weak var fri: UIButton!
    @IBOutlet weak var sat: UIButton!
    
    @IBOutlet var reminderDays: [UIButton]!
    
    var habitSteps = [HabitSteps]()
    static var selectedHabit: HabitTodoList? {
        didSet {
            let habitStepsHandler = HabitStepsHandler()
            habitStepsHandler.retrieveHabitStepsData()
        }
    }
    
    static var habitCount = 0
    var repeatDays = [false, false, false, false, false, false, false]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for reminderDay in reminderDays {
            reminderDay.layer.cornerRadius = 8
        }
        
        
        // Ask for permission
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
            
            // Create notification content
            let content = UNMutableNotificationContent()
            content.title = "Hey Its time to something!"
            content.body = "Hurry up"
            
            
            // create the notification trigger
            let date = Date().addingTimeInterval(60)
            
            let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            
            
            // Create the request
            let uuidString = UUID().uuidString
            let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
            
            
            // Register the request
            center.add(request) { error in
                //
            }
        }
    }
    
    
    @IBAction func sundayBtnTapped(_ sender: UIButton) {
        repeatDays[0] = !repeatDays[0]
        if sun.backgroundColor == .blue {
            sun.backgroundColor = .white
            sun.tintColor = .black
        } else if sun.backgroundColor == .white {
            sun.backgroundColor  = .blue
            sun.tintColor = .white
        }
    }
    
    @IBAction func mondayBtnTapped(_ sender: UIButton) {
        repeatDays[1] = !repeatDays[1]
        if mon.backgroundColor == .blue {
            mon.backgroundColor = .white
            mon.tintColor = .black
        } else if mon.backgroundColor == .white {
            mon.backgroundColor  = .blue
            mon.tintColor = .white
        }
    }
    
    @IBAction func tuesdayBtnTapped(_ sender: UIButton) {
        repeatDays[2] = !repeatDays[2]
        if tue.backgroundColor == .blue {
            tue.backgroundColor = .white
            tue.tintColor = .black
        } else if tue.backgroundColor == .white {
            tue.backgroundColor  = .blue
            tue.tintColor = .white
        }
    }
    
    @IBAction func wednesdayBtnTapped(_ sender: UIButton) {
        repeatDays[3] = !repeatDays[3]
        if wed.backgroundColor == .blue {
            wed.backgroundColor = .white
            wed.tintColor = .black
        } else if wed.backgroundColor == .white {
            wed.backgroundColor  = .blue
            wed.tintColor = .white
        }
    }
    @IBAction func thuBtnTapped(_ sender: UIButton) {
        repeatDays[4] = !repeatDays[4]
        if thu.backgroundColor == .blue {
            thu.backgroundColor = .white
            thu.tintColor = .black
        } else if thu.backgroundColor == .white {
            thu.backgroundColor  = .blue
            thu.tintColor = .white
        }
    }
    @IBAction func fridayBtnTapped(_ sender: UIButton) {
        repeatDays[5] = !repeatDays[5]
        if fri.backgroundColor == .blue {
            fri.backgroundColor = .white
            fri.tintColor = .black
        } else if fri.backgroundColor == .white {
            fri.backgroundColor  = .blue
            fri.tintColor = .white
        }
    }
    @IBAction func saturdayBtnTapped(_ sender: UIButton) {
        
        repeatDays[6] = !repeatDays[6]
        if sat.backgroundColor == .blue {
            sat.backgroundColor = .white
            sat.tintColor = .black
        } else if sat.backgroundColor == .white {
            sat.backgroundColor  = .blue
            sat.tintColor = .white
        }
    }
    
    
    @IBAction func addHabitBtnPressed(_ sender: UIButton) {
        
        let habitStepsHandler = HabitStepsHandler()
        habitStepsHandler.startTime = startTime.date
        habitStepsHandler.duration = durationTextField.text
        habitStepsHandler.reminder = reminderStatus.isOn
        habitStepsHandler.remindDays = repeatDays
        habitStepsHandler.saveHabitSteps()
        
        _ = navigationController?.popViewController(animated: true)
     }
}
