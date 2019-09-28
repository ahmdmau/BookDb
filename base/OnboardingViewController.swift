//
//  OnboardingViewController.swift
//  base
//
//  Created by Ahmad Maulana on 27/09/19.
//  Copyright © 2019 Ahmad Maulana. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController, OnboardingPageViewControllerDelegate {

    //MARK: - Outlets
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var nextBtn: UIButton!{
        didSet{
            nextBtn.layer.cornerRadius = 25.0
            nextBtn.layer.masksToBounds = true
        }
    }
    
    @IBOutlet var skipBtn: UIButton!
    
    //MARK: - Properties
    var onboardingPageViewController: OnboardingPageViewController?
    
    @IBAction func skipBtnTapped(sender: UIButton){
        UserDefaults.standard.set(true, forKey: "hasViewedOnboarding")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextBtnTapped(sender: UIButton){
        if let index = onboardingPageViewController?.currentIndex{
            switch index {
            case 0...1:
                onboardingPageViewController?.forwardPage()
            case 2:
                UserDefaults.standard.set(true, forKey: "hasViewedOnboarding")
                dismiss(animated: true, completion: nil)
            default:
                break
            }
        }
        
        updateUI()
    }
    
    func updateUI(){
        if let index = onboardingPageViewController?.currentIndex{
            switch index {
            case 0...1:
                nextBtn.setTitle("Next", for: .normal)
                skipBtn.isHidden = false
            case 2:
                nextBtn.setTitle("Get Started", for: .normal)
                skipBtn.isHidden = true
            default:
                break
            }
            
            pageControl.currentPage = index
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? OnboardingPageViewController{
            onboardingPageViewController = pageViewController
            onboardingPageViewController?.onboardingDelegate = self 
        }
    }
    
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
    

}
