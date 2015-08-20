//
//  sumSelectedCount.swift
//  Tweet Novelty Detection
//
//  Created by Wenjie Zhong on 27-07-15.
//  Copyright (c) 2015 Wenjie Zhong. All rights reserved.
//

import Foundation

var jobCount = [String]()
var selectedWord = [String]()
var wordCount = [String]()

var combinedSelectedCount = [String]()

func generateSumOfSelectedWords() {
    var tweet = [Int: String]()
    let url = urlForScene("/Users/wenjiezhong/Dropbox/AI/CrowdTruth/CrowdFlower/Processing/selectedCountSortedByTID.csv")
    var error: NSErrorPointer = nil
    if let csv = CSV(contentsOfURL: url, error: error) {
        // Rows
        let rows = csv.rows
        let headers = csv.headers
        
        // Columns
        let columns = csv.columns
        jobCount = columns["jobcount"]!
        selectedWord = columns["selectedword"]!
        wordCount = columns["wordcount"]!
    }
    calculateSumCountSelected()
}

func calculateSumCountSelected() {
    var j = 0
    var k = 0
    var tidCounter = 0
    var tempMidTID = 0
    var midOfTID = [String]()
    while j < jobCount.count {
        if j == jobCount.count-1 {break}
        if jobCount[j] == jobCount[j+1] {
            tidCounter++
        }
        else {
            tempMidTID = tidCounter
            midOfTID.insert(String(tempMidTID), atIndex: k)
            k++
            tidCounter = 0
        }
        j++
    }
    /*
    var m = 0
    var l = 0
    var i = 0
    var x = 0
    var w = 0
    var kj = 0
    var tempCountSumSelected1 = [Int]()
    var tempCountSumSelected2 = [Int]()
    var tempContainArray = [String]()
    var tempPositionSameTID = 0
    while m < jobCount.count {
    while selectedWord[i] == "0" && selectedWord[i+1] != "0" && i < midOfTID[kj].toInt()!{
    if selectedWord[i] == "0" && selectedWord[i+1] != "0" {
    tempPositionSameTID = i+1
    l++
    i++
    }
    }
    switch l {
    case 1:
    while x < (tempPositionSameTID*2) {
    tempCountSumSelected1[x] = wordCount[x].toInt()! + wordCount[tempPositionSameTID+x].toInt()!
    x++
    }
    m = x
    case 2:
    while x < (tempPositionSameTID*3) {
    tempCountSumSelected1[w] = tempCountSumSelected1[w] + wordCount[x].toInt()! + wordCount[tempPositionSameTID+x].toInt()!
    x++
    w++
    if x == tempPositionSameTID { w = 0 }
    }
    m = x
    case 3:
    while x < (tempPositionSameTID*4) {
    tempCountSumSelected1[w] = tempCountSumSelected1[w] + wordCount[x].toInt()! + wordCount[tempPositionSameTID+x].toInt()!
    x++
    w++
    if x == tempPositionSameTID || x == tempPositionSameTID*2 { w = 0 }
    }
    m = x
    case 4:
    while x < (tempPositionSameTID*5) {
    tempCountSumSelected1[w] = tempCountSumSelected1[w] + wordCount[x].toInt()! + wordCount[tempPositionSameTID+x].toInt()!
    x++
    w++
    if x == tempPositionSameTID || x == tempPositionSameTID*2 || x == tempPositionSameTID*3 { w = 0 }
    }
    m = x
    default:
    while x < (tempPositionSameTID) {
    tempCountSumSelected1[x] = wordCount[x].toInt()!
    x++
    }
    m = x
    }
    kj++
    i++
    }
    */
}