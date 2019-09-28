//
//  OnboardingPageViewController.swift
//  base
//
//  Created by Ahmad Maulana on 27/09/19.
//  Copyright © 2019 Ahmad Maulana. All rights reserved.
//

import UIKit

protocol OnboardingPageViewControllerDelegate: class {
    func didUpdatePageIndex(currentIndex: Int)
}

class OnboardingPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    weak var onboardingDelegate: OnboardingPageViewControllerDelegate?
    
    //MARK: - Properties
    var pageHeadings = ["Discounted Secondhand Books", "20 Book Grocers Nationally", "Sell or Recycle Your Old Books With Us"]
    var pageSubHeadings = ["Used and near new secondhand books at great prices.","We've successfully opened 20 stores across Australia.","If you're looking to downsize the Book Grocer can help."]
    var pageImages = ["onboarding1", "onboarding2", "onboarding3"]
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dataSource = self
        delegate = self
        
        //Create first walkthrough
        if let startingViewController = contentViewController(at: 0){
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    //MARK: - Page View Controller Data Source
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! OnboardingContentViewController).index
        index -= 1
        
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! OnboardingContentViewController).index
        index += 1
        
        return contentViewController(at: index)
    }
    
    func contentViewController(at index: Int) -> OnboardingContentViewController? {
        if index < 0 || index >= pageHeadings.count{
            return nil
        }
        
        //create new view controller and pass suitable data
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let pageViewController = storyboard.instantiateViewController(identifier: "OnboardingContentViewController") as? OnboardingContentViewController {
            pageViewController.imageFile = pageImages[index]
            pageViewController.heading = pageHeadings[index]
            pageViewController.subHeading = pageSubHeadings[index]
            pageViewController.index = index
            
            return pageViewController
        }
        
        return nil
    }
    
    func forwardPage(){
        currentIndex += 1
        if let nextViewController = contentViewController(at: currentIndex){
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed{
            if let contentViewController = pageViewController.viewControllers?.first as? OnboardingContentViewController{
                currentIndex = contentViewController.index
                onboardingDelegate?.didUpdatePageIndex(currentIndex: currentIndex)
            }
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

