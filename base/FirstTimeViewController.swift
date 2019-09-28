//
//  FirstTimeViewController.swift
//  base
//
//  Created by Ahmad Maulana on 28/09/19.
//  Copyright © 2019 Ahmad Maulana. All rights reserved.
//

import UIKit

class FirstTimeViewController: BaseViewController, ControllerType {

    @IBOutlet var signInBtn: UIButton!{
        didSet{
            signInBtn.layer.cornerRadius = 20
            signInBtn.layer.masksToBounds = true
        }
    }
    
    @IBOutlet var signUpBtn: UIButton!{
        didSet{
            signUpBtn.layer.cornerRadius = 20
            signUpBtn.layer.masksToBounds = true
        }
    }
    
    @IBOutlet var headlineText: UILabel!{
        didSet{
            headlineText.text = "Books For Every Taste"
        }
    }
    
    @IBAction func signInBtnTapped(sender: UIButton){
        performSegue(withIdentifier: "Login", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.bool(forKey: "hasViewedOnboarding") {
            return
        }
        
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let onboardingViewController = storyboard.instantiateViewController(withIdentifier: "OnboardingViewController") as? OnboardingViewController{
            onboardingViewController.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
            self.present(onboardingViewController, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Login" {
            let vc = segue.destination as! LoginViewController
            vc.modalPresentationStyle = .fullScreen
        }
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
