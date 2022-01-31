//
//  DummyViewController.swift
//  Easy Health
//
//  Created by BJIT on 28/1/22.
//

import UIKit

class DetailsHabitStepsViewController: UIViewController {
    
    @IBOutlet weak var EmptyView: UIView!
    @IBOutlet weak var EmptyButton: UIButton!
    @IBOutlet weak var EmptyLable: UILabel!
    
    
    @IBOutlet weak var durationTF: UITextField!
    @IBOutlet weak var startTimePicker: UIDatePicker!
    @IBOutlet weak var reminderStat: UISwitch!
    @IBOutlet weak var buttonText: UIButton!
    @IBOutlet weak var durationLabel: UILabel!
    
    
    @IBOutlet var labels: [UILabel]!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var repeatStatus: [UIButton]!
    
    
    var habits = [HabitTodoList]()
    var habitSteps = [HabitSteps]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for status in repeatStatus {
            status.layer.cornerRadius = 8
        }
        
        let data = TodoListHandler()
        habits = data.retrieveHabitListData()
        
        // Do any additional setup after loading the view.
        if habits.count == 0 {
            EmptyView.backgroundColor = .white
            EmptyButton.setTitle("Add Habit", for: .normal)
        } else {
            EmptyView.isHidden = true
            EmptyLable.isHidden = true
        }
        
        buttonText.setTitle("Update Habit", for: .normal)
        
        
        startTimePicker.isEnabled = false
        buttonText.isEnabled = false
        reminderStat.isEnabled = false
        durationTF.isEnabled = false
        
        for button in repeatStatus {
            button.isEnabled = false
        }
        buttonData()
    }
    
    @IBAction func firstHabitTapped(_ sender: UIButton) {
        let habitTodoListHandlers = HabitStepsHandler()
        habitSteps = habitTodoListHandlers.retrieveHabitStepsData()
        for button in buttons {
            button.backgroundColor = .white
            button.tintColor = .blue
        }
        buttons[0].backgroundColor = .blue
        buttons[0].tintColor = .white
        durationTF.text = habitSteps[0].duration
        durationLabel.text = habitSteps[0].parentHabit?.habitName
        startTimePicker.date = habitSteps[0].startTime!
        reminderStat.isOn = habitSteps[0].reminder
        
        for i in 0 ... 6 {
            if habitSteps[0].remindDay![i] == true {
                repeatStatus[i].backgroundColor = .blue
                repeatStatus[i].tintColor = .white
            } else {
                repeatStatus[i].backgroundColor = .white
                repeatStatus[i].tintColor = .black
            }
        }
    }
    
    @IBAction func secondHabitTapped(_ sender: UIButton) {
        let habitTodoListHandlers = HabitStepsHandler()
        habitSteps = habitTodoListHandlers.retrieveHabitStepsData()
        for button in buttons {
            button.backgroundColor = .white
            button.tintColor = .blue
        }
        buttons[1].backgroundColor = .blue
        buttons[1].tintColor = .white
        durationTF.text = habitSteps[1].duration
        durationLabel.text = habitSteps[1].parentHabit?.habitName
        startTimePicker.date = habitSteps[1].startTime!
        reminderStat.isOn = habitSteps[1].reminder
        
        for i in 0 ... 6 {
            if habitSteps[1].remindDay![i] == true {
                repeatStatus[i].backgroundColor = .blue
                repeatStatus[i].tintColor = .white
            } else {
                repeatStatus[i].backgroundColor = .white
                repeatStatus[i].tintColor = .black
            }
        }
    }
    
    @IBAction func thirdHabitTapped(_ sender: UIButton) {
        let habitTodoListHandlers = HabitStepsHandler()
        habitSteps = habitTodoListHandlers.retrieveHabitStepsData()
        for button in buttons {
            button.backgroundColor = .white
            button.tintColor = .blue
        }
        buttons[2].backgroundColor = .blue
        buttons[2].tintColor = .white
        durationTF.text = habitSteps[2].duration
        durationLabel.text = habitSteps[2].parentHabit?.habitName
        startTimePicker.date = habitSteps[2].startTime!
        reminderStat.isOn = habitSteps[2].reminder
        
        for i in 0 ... 6 {
            if habitSteps[2].remindDay![i] == true {
                repeatStatus[i].backgroundColor = .blue
                repeatStatus[i].tintColor = .white
            } else {
                repeatStatus[i].backgroundColor = .white
                repeatStatus[i].tintColor = .black
            }
        }
    }
    @IBAction func fourthHabitTapped(_ sender: UIButton) {
        let habitTodoListHandlers = HabitStepsHandler()
        habitSteps = habitTodoListHandlers.retrieveHabitStepsData()
        for button in buttons {
            button.backgroundColor = .white
            button.tintColor = .blue
        }
        buttons[3].backgroundColor = .blue
        buttons[3].tintColor = .white
        durationTF.text = habitSteps[3].duration
        durationLabel.text = habitSteps[3].parentHabit?.habitName
        startTimePicker.date = habitSteps[3].startTime!
        reminderStat.isOn = habitSteps[3].reminder
        
        for i in 0 ... 6 {
            if habitSteps[3].remindDay![i] == true {
                repeatStatus[i].backgroundColor = .blue
                repeatStatus[i].tintColor = .white
            } else {
                repeatStatus[i].backgroundColor = .white
                repeatStatus[i].tintColor = .black
            }
        }
    }
    
    @IBAction func fifthHabitTapped(_ sender: UIButton) {
        let habitTodoListHandlers = HabitStepsHandler()
        habitSteps = habitTodoListHandlers.retrieveHabitStepsData()
        for button in buttons {
            button.backgroundColor = .white
            button.tintColor = .blue
        }
        buttons[4].backgroundColor = .blue
        buttons[4].tintColor = .white
        durationTF.text = habitSteps[4].duration
        durationLabel.text = habitSteps[4].parentHabit?.habitName
        startTimePicker.date = habitSteps[4].startTime!
        reminderStat.isOn = habitSteps[4].reminder
        
        for i in 0 ... 6 {
            if habitSteps[4].remindDay![i] == true {
                repeatStatus[i].backgroundColor = .blue
                repeatStatus[i].tintColor = .white
            } else {
                repeatStatus[i].backgroundColor = .white
                repeatStatus[i].tintColor = .black
            }
        }
    }
    
    
    func buttonData() {
        let habitTodoListHandlers = HabitStepsHandler()
        habitSteps = habitTodoListHandlers.retrieveHabitStepsData()
        var j = 0
        for button in buttons {
            if j < habitSteps.count {
                button.setImage(UIImage(named: (habitSteps[j].parentHabit?.habitImage)!), for: .normal)
                j += 1
            }
        }
        
        var i = 0
        for label in labels {
            if i < habitSteps.count {
                label.text = habitSteps[i].parentHabit?.habitName
                i += 1
            }
        }
    }
}
