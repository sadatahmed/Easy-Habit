//
//  ViewController.swift
//  Easy Health
//
//  Created by BJIT on 21/1/22.
//

import UIKit

class UserInformationVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pickerView: UIView!
    @IBOutlet weak var continueBtn: UIButton!
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dobTextField: UITextField!
    @IBOutlet weak var wakeUPTime: UIDatePicker!
    
    @IBOutlet weak var nameError: UILabel!
    @IBOutlet weak var dateOfBirthError: UILabel!
    
    let userDefaults = UserDefaults.standard
    var userInfo = UserInfo()
    static var checker:String  = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetForm()
        
        containerView?.layer.cornerRadius = 70
        pickerView?.layer.cornerRadius = 8
        containerView?.layer.maskedCorners = [ .layerMaxXMinYCorner]
        
        if let value = userDefaults.object(forKey: "name") as? String {
            userInfo.name = value
        }
        if let value = userDefaults.object(forKey: "dob") as? String {
            userInfo.dateOfBirth = value
        }
        if let value = userDefaults.object(forKey: "wakeUp") as? String {
            userInfo.wakeUpTime = value
            UserInformationVC.checker = value
        }
    }
    
    
    // MARK: Continue Button Pressed
    @IBAction func ContinueBtnPressed(_ sender: UIButton) {
        userInfo.name = nameTextField.text!
        userInfo.dateOfBirth = dobTextField.text!
        userInfo.wakeUpTime = dateToTimeString(wakeUPTime.date)
        
        userDefaults.set(userInfo.name, forKey: "name")
        userDefaults.set(userInfo.wakeUpTime, forKey: "wakeUp")
        userDefaults.set(userInfo.dateOfBirth, forKey: "dob")
        
        resetForm()
    }
    
}

// MARK: Form Validation
extension UserInformationVC {
    
    func resetForm() {
        continueBtn?.isEnabled = false
        
        nameError?.isHidden = false
        dateOfBirthError?.isHidden = false
        
        nameError?.text = "Required"
        dateOfBirthError?.text = "Required"
        
        nameTextField?.text = ""
        dobTextField?.text = ""
    }
    
    @IBAction func nameChanged(_ sender: UITextField) {
        if let name = nameTextField.text {
            if let errorMessage = invalidName(name) {
                nameError.text = errorMessage
                nameError.isHidden = false
            }
            else {
                nameError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    func invalidName(_ name: String) -> String? {
        if name.count > 25 {
            return "Name must not exceed 25 character"
        }
        if name.count < 1 {
            return "required"
        }
        if !isValidName(name) {
            return "remove special character"
        }
        
        return nil
    }
    
    func isValidName (_ name: String) -> Bool {
        let regularExpression = #"^([a-zA-Z]{2,}\s[a-zA-Z]{1,}'?-?[a-zA-Z]{2,}\s?([a-zA-Z]{1,})?)"#
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return predicate.evaluate(with: name)
    }
    
    @IBAction func dobChanged(_ sender: UITextField) {
        if let dob = nameTextField.text
        {
            if let errorMessage = invalidDob(dob)
            {
                dateOfBirthError.text = errorMessage
                dateOfBirthError.isHidden = false
            }
            else {
                dateOfBirthError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    func invalidDob(_ dateOfBirth: String) -> String? {
        if isValidDate(dateOfBirth) {
            return "please insert Valid date"
        }
        return nil
    }
    
    func isValidDate (_ dateOfBirth: String) -> Bool {
        let regularExpression = #"(?:\d{1,2}[-/\s]\d{1,2}[-/\s]'?\d{2,4})"#
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        
        return predicate.evaluate(with: dateOfBirth)
    }
    
    @IBAction func wakeUpTimeChanged(_ sender: UIDatePicker) {
        
    }
    
    func checkForValidForm() {
        if nameError.isHidden && dateOfBirthError.isHidden {
            continueBtn.isEnabled = true
        }
        else {
            continueBtn.isEnabled = false
        }
    }
}


// MARK: Date to String Conversion
extension UserInformationVC {
    func dateToTimeString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GTM")
        dateFormatter.dateFormat = "HH:mm"
        let timeAsString = dateFormatter.string(from: date)
        
        return timeAsString
    }
}
