//
//  PageTwoViewController.swift
//  ILoveVideoTest
//
//  Created by Roman Petrov on 25/06/15.
//  Copyright (c) 2015 Kentor. All rights reserved.
//

import UIKit

class PageTwoViewController: UIViewController {
    @IBAction func backTapped(sender : AnyObject) {
        gotoFirstTab()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func leftSwipe(sender: UISwipeGestureRecognizer) {
        gotoFirstTab()
    }
    
    func gotoFirstTab() {
        var tabbarController = self.view.window!.rootViewController as! UITabBarController
        tabbarController.selectedIndex = 0
    }
}
