//
//  ContentServiceTests.swift
//  ILoveVideoTest
//
//  Created by Roman Petrov on 26/06/15.
//  Copyright (c) 2015 Kentor. All rights reserved.
//

import XCTest

class ContentServiceTests: XCTestCase {
    var contentService:ContentService = ContentService()

    override func setUp() {
        contentService.loadCountries()
    }
    
    override func tearDown() {
    }

    func testLoadCountries_ok() {
        let infoFirst:CountryInfo = contentService.getCountryInfoByIndex(0)
        XCTAssertEqual(1, infoFirst.rank)
        XCTAssertEqual("China", infoFirst.country)
        XCTAssertEqual("1,354,040,000", infoFirst.population)
        XCTAssertEqual(125, infoFirst.flag.size.width)
        XCTAssertEqual(83, infoFirst.flag.size.height)

        let infoLast:CountryInfo = contentService.getCountryInfoByIndex(9)
        XCTAssertEqual(10, infoLast.rank)
        XCTAssertEqual("Japan", infoLast.country)
        XCTAssertEqual("127,360,000", infoLast.population)
        XCTAssertEqual(125, infoLast.flag.size.width)
        XCTAssertEqual(83, infoLast.flag.size.height)
    }

    func testGetRandomCountry_ok() {
        var i:Int = 1
        while i < 30 {
            let info:CountryInfo = contentService.getRandomCountry()
            XCTAssert(info.rank > 0, "rank must be >0")
            XCTAssert(info.rank < 11, "rank must be <11")
            i++
        }
    }
}
