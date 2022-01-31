//
//  HabitTodoListVC.swift
//  Easy Health
//
//  Created by BJIT on 27/1/22.
//

import UIKit

class HabitTodoListVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var supportView: UIView!
    @IBOutlet weak var warningMessage: UILabel!
    
    var habits = [HabitTodoList]()
    var selectedHabit: HabitTodoList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        warningMessage.isHidden = true
        supportView.layer.cornerRadius = 70
        supportView.layer.maskedCorners = [ .layerMaxXMinYCorner]
        
        let nibCell = UINib(nibName: "TodoListCVC", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "todoList")
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 172, height: 120)
        collectionView.collectionViewLayout = layout
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        let todoListHandler = TodoListHandler()
        habits = todoListHandler.retrieveHabitListData()
        collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoDetailsHabit" {
            _ = segue.destination as! AddNewHabitStepsVC
            AddNewHabitStepsVC.selectedHabit = selectedHabit
        }
    }
    
    @IBAction func addBtnPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add a New Habit", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { action in
            let todoListHandler = TodoListHandler()
            
            todoListHandler.habitName = textField.text
            todoListHandler.habitImage = "phone"
            
            todoListHandler.saveHabitList()
            self.collectionView.reloadData()
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create Custom Habit"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}


extension HabitTodoListVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let todoListHandler = TodoListHandler()
        habits = todoListHandler.retrieveHabitListData()
        print("#######################")
        print(habits.count)
        return habits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedHabit = habits[indexPath.row]
        if indexPath.row == 0 {
            
            var textField = UITextField()
            
            let alert = UIAlertController(title: "Add a New Habit", message: "", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Add", style: .default) { action in
                let todoListHandler = TodoListHandler()
                
                todoListHandler.habitName = textField.text
                todoListHandler.habitImage = "phone"
                
                todoListHandler.saveHabitList()
                collectionView.reloadData()
            }
            
            alert.addTextField { alertTextField in
                alertTextField.placeholder = "Create Custom Habit"
                textField = alertTextField
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        } else {
            let habitStepsHandler = HabitStepsHandler()
            if habitStepsHandler.retrieveHabitStepsData().count >= 5 {
                warningMessage.isHidden = false
                return
            }
            performSegue(withIdentifier: "gotoDetailsHabit", sender: self)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "todoList", for: indexPath) as! TodoListCVC
        
        let habitTodoListHandler = TodoListHandler()
        habits = habitTodoListHandler.retrieveHabitListData()
        
        cell.habitName.text = habits[indexPath.row].habitName
        cell.TodoIcon.image = UIImage(named: habits[indexPath.row].habitImage!)
        
        if habits[indexPath.row].habitSet == nil {
            cell.serialNumView.isHidden = true
        } else {
            cell.serialNumView.isHidden = false
            cell.serialNumber.text = habits[indexPath.row].habitSet?.serialNum
        }
        
        return cell
    }
}


extension HabitTodoListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 172, height: 120)
    }
}
