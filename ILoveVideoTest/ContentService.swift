//
//  ContentService.swift
//  ILoveVideoTest
//
//  Created by Roman Petrov on 26/06/15.
//  Copyright (c) 2015 Kentor. All rights reserved.
//
import UIKit

class ContentService {
    let jsonPath:String = "http://www.androidbegin.com/tutorial/jsonparsetutorial.txt"
    var countries = [CountryInfo]()
    
    func loadCountries() {
        if let jsonData: NSData = getJson(jsonPath) {
            let parsedData:NSDictionary = parseJson(jsonData)
            if let worldPopulation:NSArray = parsedData["worldpopulation"] as? NSArray {
                for country in worldPopulation {
                    let rankValue:Int = country["rank"] as! Int
                    let countryValue:String = country["country"] as! String
                    let populationValue:String = country["population"] as! String
                    let flagValue:UIImage = loadImage(country["flag"] as! String)
                    let info:CountryInfo = CountryInfo(rank: rankValue, country: countryValue, population: populationValue, flag: flagValue)
                    countries.append(info)
                }
            }
        }
    }
    
    func getRandomCountry() -> CountryInfo! {
        if countries.count > 0 {
            let size:UInt32 = UInt32(countries.count);
            let index:Int = Int(arc4random_uniform(size))
            return countries[index]
        }
        return nil
    }

    func getCountryInfoByIndex(index: Int) -> CountryInfo {
        return countries[index]
    }
    
    func getJson(urlToRequest: String) -> NSData! {
        if let url:NSURL = NSURL(string: urlToRequest) {
            if let contents:NSData = NSData(contentsOfURL: url) {
                return contents
            }
        }
        return nil
    }
    
    func parseJson(inputData: NSData) -> NSDictionary {
        var error: NSError?
        var resultDictionary: NSDictionary =
            NSJSONSerialization.JSONObjectWithData(inputData, options: NSJSONReadingOptions.MutableContainers, error: &error) as! NSDictionary
        return resultDictionary
    }
    
    func loadImage(imageUrl:String) -> UIImage {
        let url = NSURL(string: imageUrl)
        if let data = NSData(contentsOfURL: url!) {
            return UIImage(data: data)!
        } else {
            return UIImage()
        }
    }
}