//
//  PageTwoViewController.swift
//  ILoveVideoTest
//
//  Created by Roman Petrov on 25/06/15.
//  Copyright (c) 2015 Kentor. All rights reserved.
//

import UIKit

class PageOneViewController: UIViewController {
    @IBOutlet var flagImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    var flagLayer: CALayer {
        return flagImage.layer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentService:ContentService = ContentService()
        contentService.loadCountries()
        if let info:CountryInfo = contentService.getRandomCountry() {
            flagImage.image = info.flag
            titleLabel.text = info.country
            descriptionLabel.text = "Population: " + info.population
            
            flagLayer.shadowOpacity = 0.7
            flagLayer.shadowRadius = 10.0
        } else {
            titleLabel.text = "Can't load JSON data!"
            descriptionLabel.text = ""
        }
    }
    
    @IBAction func rightSwipe(sender: UISwipeGestureRecognizer) {
        gotoSecondTab()
    }
    
    func gotoSecondTab() {
        var tabbarController = self.view.window!.rootViewController as! UITabBarController
        tabbarController.selectedIndex = 1
    }
}
