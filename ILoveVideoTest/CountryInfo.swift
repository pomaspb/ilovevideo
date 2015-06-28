//
//  CountryInfo.swift
//  ILoveVideoTest
//
//  Created by Roman Petrov on 26/06/15.
//  Copyright (c) 2015 Kentor. All rights reserved.
//

import UIKit

class CountryInfo {
    var rank: Int
    var country: String
    var population: String
    var flag: UIImage

    init(rank: Int, var country: String, population: String, flag: UIImage) {
        self.rank = rank
        self.country = country
        self.population = population
        self.flag = flag
    }
}