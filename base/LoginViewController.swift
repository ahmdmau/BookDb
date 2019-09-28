//
//  LoginViewController.swift
//  base
//
//  Created by Ahmad Maulana on 31/07/19.
//  Copyright © 2019 Ahmad Maulana. All rights reserved.
//

import UIKit

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            case usernameField:
                passwordField.becomeFirstResponder()
            default:
                usernameField.resignFirstResponder()
        }
        return true
    }
}

class LoginViewController: BaseViewController, ControllerType{
    
    @IBOutlet var signInBtn: UIButton!{
        didSet{
            signInBtn.layer.cornerRadius = 20
            signInBtn.layer.masksToBounds = true
            signInBtn.layer.borderWidth = 1
            signInBtn.layer.borderColor = UIColor(red: 90/255, green: 189/255, blue: 140/255, alpha: 1).cgColor
            signInBtn.isEnabled = false
        }
    }
    
    @IBOutlet weak var usernameField: UITextField! {
        didSet {
            usernameField.layer.cornerRadius =  20
            let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 2.0))
            usernameField.leftView = leftView
            usernameField.leftViewMode = .always
        }
    }
    
    @IBOutlet weak var passwordField: UITextField! {
        didSet {
            passwordField.layer.cornerRadius =  20
            let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 2.0))
            passwordField.leftView = leftView
            passwordField.leftViewMode = .always
        }
    }
    
    @IBOutlet var textFields: [UITextField]!
    
    @IBOutlet var backButton: UIButton!
    
    @IBAction func backButtonTapped(sender: UIButton){
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showNavigationBar()
        // Do any additional setup after loading the view.
        
        //MARK: - Delegate
        self.usernameField.delegate = self
        self.passwordField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange(_:)), name: UITextField.textDidChangeNotification, object: nil)
    }
    
    @objc private func textDidChange(_ notification: Notification) {
        if usernameField.hasText && passwordField.hasText {
            signInBtn.isEnabled = true
            signInBtn?.layer.backgroundColor = UIColor(red: 90/255, green: 189/255, blue: 140/255, alpha: 1).cgColor
            signInBtn?.layer.borderWidth = 0
            signInBtn.titleLabel?.textColor = UIColor.white
            signInBtn.layer.shadowColor = UIColor(red: 90/255, green: 189/255, blue: 140/255, alpha: 1).cgColor
            signInBtn.layer.shadowOffset = CGSize(width: 0.0, height: 20.0)
            signInBtn.layer.shadowOpacity = 0.55
            signInBtn.layer.shadowRadius = 15.0
            signInBtn.layer.masksToBounds = false
        }
        else {
            signInBtn.isEnabled = false
            signInBtn?.layer.backgroundColor = UIColor.clear.cgColor
            signInBtn.layer.borderWidth = 1
            signInBtn.layer.borderColor = UIColor(red: 90/255, green: 189/255, blue: 140/255, alpha: 1).cgColor
        }
    }
    
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        self.checkAllFieldFilled()
//        textField.resignFirstResponder()
//        return true
//    }
    
//    func checkAllFieldFilled(){
//        if self.passwordField.text == "" && self.usernameField.text == ""{
//            signInBtn?.layer.backgroundColor = UIColor.clear.cgColor
//            signInBtn.layer.borderWidth = 1
//            signInBtn.layer.borderColor = UIColor(red: 90/255, green: 189/255, blue: 140/255, alpha: 1).cgColor
//            signInBtn?.isUserInteractionEnabled = false
//        } else{
//            signInBtn?.isUserInteractionEnabled = true
//            signInBtn?.layer.backgroundColor = UIColor(red: 90/255, green: 189/255, blue: 140/255, alpha: 1).cgColor
//            signInBtn?.layer.borderWidth = 0
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
