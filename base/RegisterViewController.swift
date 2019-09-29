//
//  RegisterViewController.swift
//  base
//
//  Created by Ahmad Maulana on 28/09/19.
//  Copyright © 2019 Ahmad Maulana. All rights reserved.
//

import UIKit
extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            case fullName:
                email.becomeFirstResponder()
            case email:
                mobilePhone.becomeFirstResponder()
            case mobilePhone:
                password.becomeFirstResponder()
            default:
                fullName.resignFirstResponder()
        }
        return true
    }
}

class RegisterViewController: BaseViewController {

    @IBOutlet weak var fullName: UITextField!{
        didSet{
            fullName.layer.cornerRadius =  20
            let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 2.0))
            fullName.leftView = leftView
            fullName.leftViewMode = .always
        }
    }
    
    @IBOutlet weak var email: UITextField!{
        didSet{
            email.layer.cornerRadius =  20
            let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 2.0))
            email.leftView = leftView
            email.leftViewMode = .always
        }
    }
    
    @IBOutlet weak var mobilePhone: UITextField!{
        didSet{
            mobilePhone.layer.cornerRadius =  20
            let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 2.0))
            mobilePhone.leftView = leftView
            mobilePhone.leftViewMode = .always
        }
    }
    
    @IBOutlet weak var password: UITextField!{
        didSet{
            password.layer.cornerRadius =  20
            let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 2.0))
            password.leftView = leftView
            password.leftViewMode = .always
        }
    }
    
    @IBOutlet weak var signUpBtn: UIButton!{
        didSet{
            signUpBtn.layer.cornerRadius = 20
            signUpBtn.layer.masksToBounds = true
            signUpBtn.layer.borderWidth = 1
            signUpBtn.layer.borderColor = UIColor(red: 90/255, green: 189/255, blue: 140/255, alpha: 1).cgColor
            signUpBtn.isEnabled = false
        }
    }
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBAction func backBtn(sender: UIButton){
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mobilePhone.delegate = self

        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange(_:)), name: UITextField.textDidChangeNotification, object: nil)
    }
    
    @objc private func textDidChange(_ notification: Notification) {
        if fullName.hasText && email.hasText && mobilePhone.hasText && password.hasText {
            signUpBtn.isEnabled = true
            signUpBtn?.layer.backgroundColor = UIColor(red: 90/255, green: 189/255, blue: 140/255, alpha: 1).cgColor
            signUpBtn?.layer.borderWidth = 0
            signUpBtn.titleLabel?.textColor = UIColor.white
            signUpBtn.layer.shadowColor = UIColor(red: 90/255, green: 189/255, blue: 140/255, alpha: 1).cgColor
            signUpBtn.layer.shadowOffset = CGSize(width: 0.0, height: 20.0)
            signUpBtn.layer.shadowOpacity = 0.55
            signUpBtn.layer.shadowRadius = 15.0
            signUpBtn.layer.masksToBounds = false
        }
        else {
            signUpBtn.isEnabled = false
            signUpBtn?.layer.backgroundColor = UIColor.clear.cgColor
            signUpBtn.layer.borderWidth = 1
            signUpBtn.layer.borderColor = UIColor(red: 90/255, green: 189/255, blue: 140/255, alpha: 1).cgColor
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == mobilePhone{
            let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
            let compSepByCharInSet = string.components(separatedBy: aSet)
            let numberFiltered = compSepByCharInSet.joined(separator: "")
            return string == numberFiltered
        }
        
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
