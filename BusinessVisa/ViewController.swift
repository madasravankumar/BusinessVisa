//
//  ViewController.swift
//  BusinessVisa
//
//  Created by Gemini on 12/6/16.
//  Copyright © 2016 Gemini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let jsonObject = BV_JsonData.sharedInstance.jsonObject
        print("Json Data \(jsonObject)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//MARK:- Action Methods
    @IBAction func startButtonTapped(sender: AnyObject) -> Void {
        
        let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
        let tabBarController = storyboard.instantiateInitialViewController()!
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = tabBarController
        
        UIView.transition(with: appDelegate.window!, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
        appDelegate.window?.makeKeyAndVisible()
    }
}

