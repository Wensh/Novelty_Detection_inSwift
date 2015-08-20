//
//  TweetIDMatcher.swift
//  Tweet Novelty Detection
//
//  Created by Wenjie Zhong on 20-08-15.
//  Copyright (c) 2015 Wenjie Zhong. All rights reserved.
//

import Foundation

var platformColumn = [String]()
var idapi = [String]()
var dateapi = [String]()
var user = [String]()
var datetarget = [String]()
var platformtarget = [String]()
var outputOfID = [String]()

func getAPIdata() {
    var tweet = [Int: String]()
    let url = urlForScene("/Users/wenjiezhong/Desktop/tweetstest.csv")
    var error: NSErrorPointer = nil
    if let csv = CSV(contentsOfURL: url, error: error) {
        // Rows
        let rows = csv.rows
        let headers = csv.headers
        
        // Columns
        let columns = csv.columns
        platformColumn = columns["platform"]!
        idapi = columns["id"]!
        dateapi = columns["date"]!
        user = columns["user"]!
    }
}

func getTargetData() {
    var tweet = [Int: String]()
    let url = urlForScene("/Users/wenjiezhong/Desktop/2015analysis.csv")
    var error: NSErrorPointer = nil
    if let csv = CSV(contentsOfURL: url, error: error) {
        // Rows
        let rows = csv.rows
        let headers = csv.headers
        
        // Columns
        let columns = csv.columns
        platformtarget = columns["platformtarget"]!
        datetarget = columns["datetarget"]!
    }
    getAPIdata()
    getTweetID()
    saveToDocument(outputOfID, "IDto2015.csv")
}

var idI = 0
var iOfTarget = 0
func getTweetID() {
    while iOfTarget < platformtarget.count {
        while idI < platformColumn.count {
            if platformtarget[iOfTarget] == platformColumn[idI] {
                outputOfID.insert(idapi[idI], atIndex: iOfTarget)
                println("\(iOfTarget): \(idapi[idI])")
            }
            idI++
        }
        iOfTarget++
        idI = 0
    }
}