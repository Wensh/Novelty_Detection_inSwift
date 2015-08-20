//
//  ReadFiles.swift
//  Tweet Novelty Detection
//
//  Created by Wenjie Zhong on 17-07-15.
//  Copyright (c) 2015 Wenjie Zhong. All rights reserved.
//

import Foundation

//Input
func urlForScene(stringForUrl : String) -> NSURL {
    let filepath = stringForUrl
    var filename:NSString = "Whaling"
    return NSURL.fileURLWithPath(filepath)!
}
var arrayLength = 1680
var testArray = [String]()

//Output
var columnOfTweets1 = [String]()
var columnOfTweets2 = [String]()
var columnOfTID1 = [String]()
var columnOfTID2 = [String]()
var columnOfTweetIrrelevant1 = [String]()
var columnOfTweetIrrelevant2 = [String]()
var columnOfTweetNovel1 = [String]()
var columnOfTweetNovel2 = [String]()
var columnOfTweetsEqual = [String]()
var columnOfRelevant1 = [String]()
var columnOfRelevant2 = [String]()
var columnOfTaskID = [String]()
var columnOfUnitID = [String]()
var columnOfWorkerID = [String]()
var unitIDArray = [String]()
var workerIDArray = [String]()
var tweetNoveltySum = [Int]()

var ev0a = [String]()
var ev1a = [String]()
var ev2a = [String]()
var ev3a = [String]()
var ev4a = [String]()
var ev5a = [String]()
var ev6a = [String]()
var ev7a = [String]()
var ev8a = [String]()
var ev0b = [String]()
var ev1b = [String]()
var ev2b = [String]()
var ev3b = [String]()
var ev4b = [String]()
var ev5b = [String]()
var ev6b = [String]()
var ev7b = [String]()
var ev8b = [String]()

var nsIndexer = 0
var interTweetNoveltySum : Int = 0
//0 Win, 1 Draw, 2 Lost
var matchResult = Array(count: 20, repeatedValue: Array(count: arrayLength, repeatedValue: "0"))
//0 TID, 1 TaskID,
var resultNames = Array(count: 20, repeatedValue: Array(count: arrayLength, repeatedValue: "0"))
// Selected words from 0-8
var words = Array(count: 20, repeatedValue: Array(count: arrayLength, repeatedValue: " "))
// Tweet words from 0-8
var tweetWords = Array(count: 30, repeatedValue: Array(count: arrayLength, repeatedValue: " "))
var selectedWords = Array(count: 30, repeatedValue: Array(count: arrayLength, repeatedValue: "0"))
// Index 0 and 1, "1" is relevant and "0" is irrelevant
var relevancyOfTaskCheck = Array(count: 30, repeatedValue: Array(count: arrayLength, repeatedValue: "1"))
// Index 0 and 1, "0" is relevant and "1" is irrelevant
var irrelevancyOfTaskCheck = Array(count: 30, repeatedValue: Array(count: arrayLength, repeatedValue: "0"))

var pathOfWords1 = "/Users/wenjiezhong/Dropbox/AI/CrowdTruth/CrowdFlower/Processing/text1.txt"
var wordsOfTweets1 = String(contentsOfFile: pathOfWords1, encoding: NSUTF8StringEncoding, error: nil)
var wordsInTweetsArray1 = [String]()
var pathOfWords2 = "/Users/wenjiezhong/Dropbox/AI/CrowdTruth/CrowdFlower/Processing/text2.txt"
var wordsOfTweets2 = String(contentsOfFile: pathOfWords2, encoding: NSUTF8StringEncoding, error: nil)
var wordsInTweetsArray2 = [String]()

func calculateNoveltySum() {
    var j = 0
    var tempnsIndexerChecker = ""
    var tidIndexWriter = [String]()
    while nsIndexer < 51 {
        tweetNoveltySum.insert(0, atIndex:nsIndexer)
        if nsIndexer <= 9 {
            tempnsIndexerChecker = "tid00\(nsIndexer)"
        }
        else {
            tempnsIndexerChecker = "tid0\(nsIndexer)"
        }
        while j < columnOfTID1.count {
            if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetNovel1[j] == "true") {
                interTweetNoveltySum = tweetNoveltySum[nsIndexer] + 1
                tweetNoveltySum.removeLast()
                tweetNoveltySum.insert(interTweetNoveltySum, atIndex:nsIndexer)
            }
            else if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetsEqual[j] == "true") {
                interTweetNoveltySum = tweetNoveltySum[nsIndexer] + 1
                tweetNoveltySum.removeLast()
                tweetNoveltySum.insert(interTweetNoveltySum, atIndex:nsIndexer)
            }
            else if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetNovel2[j] == "true") {
                interTweetNoveltySum = tweetNoveltySum[nsIndexer] - 1
                tweetNoveltySum.removeLast()
                tweetNoveltySum.insert(interTweetNoveltySum, atIndex:nsIndexer)
            }
            if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetNovel2[j] == "true") {
                interTweetNoveltySum = tweetNoveltySum[nsIndexer] + 1
                tweetNoveltySum.removeLast()
                tweetNoveltySum.insert(interTweetNoveltySum, atIndex:nsIndexer)
            }
            else if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetsEqual[j] == "true") {
                interTweetNoveltySum = tweetNoveltySum[nsIndexer] + 1
                tweetNoveltySum.removeLast()
                tweetNoveltySum.insert(interTweetNoveltySum, atIndex:nsIndexer)
            }
            else if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetNovel1[j] == "true") {
                interTweetNoveltySum = tweetNoveltySum[nsIndexer] - 1
                tweetNoveltySum.removeLast()
                tweetNoveltySum.insert(interTweetNoveltySum,atIndex:nsIndexer)
            }
            j++
        }
        tidIndexWriter.append(String(nsIndexer))
        nsIndexer++
        interTweetNoveltySum = 0
        j = 0
    }
    var tweetNoveltySumString = [String]()
    for i in 0..<tweetNoveltySum.count {
        tweetNoveltySumString.insert("\(tidIndexWriter[i]),\(String(tweetNoveltySum[i]))", atIndex: i)
    }
    saveToDocument(tweetNoveltySumString, "noveltySum.csv")
}

func retrieveWordsOfTweetsA(matchIndexer: Int, j: Int){
    var tempBodyOfTweet = [String]()
    tempBodyOfTweet = wordsInTweetsArray1[j].componentsSeparatedByString(" ")
    for m in 0..<tempBodyOfTweet.count {
        tempBodyOfTweet[m] = tempBodyOfTweet[m].stringByReplacingOccurrencesOfString(",", withString: "")
        tweetWords[m][matchIndexer] = tempBodyOfTweet[m]
    }
}

func retrieveWordsOfTweetsB(matchIndexer: Int, j: Int){
    var tempBodyOfTweet = [String]()
    tempBodyOfTweet = wordsInTweetsArray2[j].componentsSeparatedByString(" ")
    for m in 0..<tempBodyOfTweet.count {
        tempBodyOfTweet[m] = tempBodyOfTweet[m].stringByReplacingOccurrencesOfString(",", withString: "")
        tweetWords[m][matchIndexer] = tempBodyOfTweet[m]
    }
}

func generateCompetitionResults() {
    var j = 0
    var matchIndexer = 0
    var tempNameTID = ""
    var tempnsIndexerChecker = ""
    while nsIndexer <= 50 {
        while j < columnOfTID1.count {
            if nsIndexer <= 9 {
                tempnsIndexerChecker = "tid00\(nsIndexer)"
            }
            else {
                tempnsIndexerChecker = "tid0\(nsIndexer)"
            }
            //Win by tweet 1
            if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetNovel1[j] == "true" && columnOfTweetIrrelevant1[j] == "false" && columnOfTweetIrrelevant2[j] == "false") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[0][matchIndexer] = "1"
                relevancyOfTaskCheck[0][matchIndexer] = columnOfRelevant1[j]
                relevancyOfTaskCheck[1][matchIndexer] = columnOfRelevant2[j]
                unitIDArray.insert(columnOfUnitID[j], atIndex: matchIndexer)
                workerIDArray.insert(columnOfWorkerID[j], atIndex: matchIndexer)
                fillWordsA(matchIndexer, j)
                retrieveWordsOfTweetsA(matchIndexer, j)
                matchIndexer++
            }
                //Draw
            else if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetsEqual[j] == "true" && columnOfTweetIrrelevant1[j] == "false" && columnOfTweetIrrelevant2[j] == "false") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[1][matchIndexer] = "1"
                relevancyOfTaskCheck[0][matchIndexer] = columnOfRelevant1[j]
                relevancyOfTaskCheck[1][matchIndexer] = columnOfRelevant2[j]
                unitIDArray.insert(columnOfUnitID[j], atIndex: matchIndexer)
                workerIDArray.insert(columnOfWorkerID[j], atIndex: matchIndexer)
                fillWordsA(matchIndexer, j)
                retrieveWordsOfTweetsA(matchIndexer, j)
                matchIndexer++
            }
                //Lost by tweet 1
            else if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetNovel2[j] == "true" && columnOfTweetIrrelevant1[j] == "false" && columnOfTweetIrrelevant2[j] == "false") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[2][matchIndexer] = "1"
                relevancyOfTaskCheck[0][matchIndexer] = columnOfRelevant1[j]
                relevancyOfTaskCheck[1][matchIndexer] = columnOfRelevant2[j]
                unitIDArray.insert(columnOfUnitID[j], atIndex: matchIndexer)
                workerIDArray.insert(columnOfWorkerID[j], atIndex: matchIndexer)
                fillWordsA(matchIndexer, j)
                retrieveWordsOfTweetsA(matchIndexer, j)
                matchIndexer++
            }
                //Worker detected both tweets as irrelevant
            else if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetIrrelevant1[j] == "true" && columnOfTweetIrrelevant2[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                irrelevancyOfTaskCheck[0][matchIndexer] = "1"
                irrelevancyOfTaskCheck[1][matchIndexer] = "1"
                relevancyOfTaskCheck[0][matchIndexer] = columnOfRelevant1[j]
                relevancyOfTaskCheck[1][matchIndexer] = columnOfRelevant2[j]
                unitIDArray.insert(columnOfUnitID[j], atIndex: matchIndexer)
                workerIDArray.insert(columnOfWorkerID[j], atIndex: matchIndexer)
                fillWordsA(matchIndexer, j)
                retrieveWordsOfTweetsA(matchIndexer, j)
                matchIndexer++
            }
                //Worker detected tweet 1 as irrelevant
            else if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetIrrelevant1[j] == "true" && columnOfTweetIrrelevant2[j] == "false") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                irrelevancyOfTaskCheck[0][matchIndexer] = "1"
                irrelevancyOfTaskCheck[1][matchIndexer] = "0"
                relevancyOfTaskCheck[0][matchIndexer] = columnOfRelevant1[j]
                relevancyOfTaskCheck[1][matchIndexer] = columnOfRelevant2[j]
                unitIDArray.insert(columnOfUnitID[j], atIndex: matchIndexer)
                workerIDArray.insert(columnOfWorkerID[j], atIndex: matchIndexer)
                fillWordsA(matchIndexer, j)
                retrieveWordsOfTweetsA(matchIndexer, j)
                matchIndexer++
                
            }
                //Worker detected tweet 2 as irrelevant
            else if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetIrrelevant1[j] == "false" && columnOfTweetIrrelevant2[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                irrelevancyOfTaskCheck[0][matchIndexer] = "1"
                irrelevancyOfTaskCheck[1][matchIndexer] = "0"
                relevancyOfTaskCheck[0][matchIndexer] = columnOfRelevant1[j]
                relevancyOfTaskCheck[1][matchIndexer] = columnOfRelevant2[j]
                unitIDArray.insert(columnOfUnitID[j], atIndex: matchIndexer)
                workerIDArray.insert(columnOfWorkerID[j], atIndex: matchIndexer)
                fillWordsA(matchIndexer, j)
                retrieveWordsOfTweetsA(matchIndexer, j)
                matchIndexer++
            }
            /*
            //
            ///
            ///Check tweet 2
            ///
            //
            */
            //Win by tweet 2
            if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetNovel2[j] == "true" && columnOfTweetIrrelevant1[j] == "false" && columnOfTweetIrrelevant2[j] == "false") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[0][matchIndexer] = "1"
                relevancyOfTaskCheck[0][matchIndexer] = columnOfRelevant1[j]
                relevancyOfTaskCheck[1][matchIndexer] = columnOfRelevant2[j]
                unitIDArray.insert(columnOfUnitID[j], atIndex: matchIndexer)
                workerIDArray.insert(columnOfWorkerID[j], atIndex: matchIndexer)
                fillWordsB(matchIndexer, j)
                retrieveWordsOfTweetsB(matchIndexer, j)
                matchIndexer++
            }
                //Draw
            else if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetsEqual[j] == "true" && columnOfTweetIrrelevant1[j] == "false" && columnOfTweetIrrelevant2[j] == "false") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[1][matchIndexer] = "1"
                relevancyOfTaskCheck[0][matchIndexer] = columnOfRelevant1[j]
                relevancyOfTaskCheck[1][matchIndexer] = columnOfRelevant2[j]
                unitIDArray.insert(columnOfUnitID[j], atIndex: matchIndexer)
                workerIDArray.insert(columnOfWorkerID[j], atIndex: matchIndexer)
                fillWordsB(matchIndexer, j)
                retrieveWordsOfTweetsB(matchIndexer, j)
                matchIndexer++
            }
                //Lost by tweet 2
            else if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetNovel1[j] == "true" && columnOfTweetIrrelevant1[j] == "false" && columnOfTweetIrrelevant2[j] == "false") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[2][matchIndexer] = "1"
                relevancyOfTaskCheck[0][matchIndexer] = columnOfRelevant1[j]
                relevancyOfTaskCheck[1][matchIndexer] = columnOfRelevant2[j]
                unitIDArray.insert(columnOfUnitID[j], atIndex: matchIndexer)
                workerIDArray.insert(columnOfWorkerID[j], atIndex: matchIndexer)
                fillWordsB(matchIndexer, j)
                retrieveWordsOfTweetsB(matchIndexer, j)
                matchIndexer++
            }
                //Worker detected both tweets as irrelevant
            else if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetIrrelevant1[j] == "true" && columnOfTweetIrrelevant2[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                irrelevancyOfTaskCheck[0][matchIndexer] = "1"
                irrelevancyOfTaskCheck[1][matchIndexer] = "1"
                relevancyOfTaskCheck[0][matchIndexer] = columnOfRelevant1[j]
                relevancyOfTaskCheck[1][matchIndexer] = columnOfRelevant2[j]
                unitIDArray.insert(columnOfUnitID[j], atIndex: matchIndexer)
                workerIDArray.insert(columnOfWorkerID[j], atIndex: matchIndexer)
                fillWordsB(matchIndexer, j)
                retrieveWordsOfTweetsB(matchIndexer, j)
                matchIndexer++
                
            }
                //Worker detected tweet 1 as irrelevant
            else if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetIrrelevant1[j] == "true" && columnOfTweetIrrelevant2[j] == "false") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                irrelevancyOfTaskCheck[0][matchIndexer] = "1"
                irrelevancyOfTaskCheck[1][matchIndexer] = "0"
                relevancyOfTaskCheck[0][matchIndexer] = columnOfRelevant1[j]
                relevancyOfTaskCheck[1][matchIndexer] = columnOfRelevant2[j]
                unitIDArray.insert(columnOfUnitID[j], atIndex: matchIndexer)
                workerIDArray.insert(columnOfWorkerID[j], atIndex: matchIndexer)
                fillWordsB(matchIndexer, j)
                retrieveWordsOfTweetsB(matchIndexer, j)
                matchIndexer++
                
            }
                //Worker detected tweet 2 as irrelevant
            else if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetIrrelevant1[j] == "false" && columnOfTweetIrrelevant2[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                irrelevancyOfTaskCheck[0][matchIndexer] = "0"
                irrelevancyOfTaskCheck[1][matchIndexer] = "1"
                relevancyOfTaskCheck[0][matchIndexer] = columnOfRelevant1[j]
                relevancyOfTaskCheck[1][matchIndexer] = columnOfRelevant2[j]
                unitIDArray.insert(columnOfUnitID[j], atIndex: matchIndexer)
                workerIDArray.insert(columnOfWorkerID[j], atIndex: matchIndexer)
                fillWordsB(matchIndexer, j)
                retrieveWordsOfTweetsB(matchIndexer, j)
                matchIndexer++
            }
            j++
        }
        j=0
        nsIndexer++
    }
}

func checkTIDZeroes(nsIndexer: Int) -> String {
    var tempNameTID = ""
    if nsIndexer >= 9 {
        tempNameTID = "tid0\(nsIndexer)"
        return tempNameTID
    }
    else {
        tempNameTID = "tid00\(nsIndexer)"
        return tempNameTID
    }
}

func fillWordsA(matchIndexer: Int, j: Int) {
    var tempSelIndex = 0
    words[0][matchIndexer] = ev0a[j]
    words[1][matchIndexer] = ev1a[j]
    words[2][matchIndexer] = ev2a[j]
    words[3][matchIndexer] = ev3a[j]
    words[4][matchIndexer] = ev4a[j]
    words[5][matchIndexer] = ev5a[j]
    words[6][matchIndexer] = ev6a[j]
    words[7][matchIndexer] = ev7a[j]
    words[8][matchIndexer] = ev8a[j]
    
    if !ev0a[j].isEmpty && ev0a[j] != "NA" {selectedWords[ev0a[j].toInt()!][matchIndexer] = "1"}
    if !ev1a[j].isEmpty && ev1a[j] != "NA" {selectedWords[ev1a[j].toInt()!][matchIndexer] = "1"}
    if !ev2a[j].isEmpty && ev2a[j] != "NA" {selectedWords[ev2a[j].toInt()!][matchIndexer] = "1"}
    if !ev3a[j].isEmpty && ev3a[j] != "NA" {selectedWords[ev3a[j].toInt()!][matchIndexer] = "1"}
    if !ev4a[j].isEmpty && ev4a[j] != "NA" {selectedWords[ev4a[j].toInt()!][matchIndexer] = "1"}
    if !ev5a[j].isEmpty && ev5a[j] != "NA" {selectedWords[ev5a[j].toInt()!][matchIndexer] = "1"}
    if !ev6a[j].isEmpty && ev6a[j] != "NA" {selectedWords[ev6a[j].toInt()!][matchIndexer] = "1"}
    if !ev7a[j].isEmpty && ev7a[j] != "NA" {selectedWords[ev7a[j].toInt()!][matchIndexer] = "1"}
    if !ev8a[j].isEmpty && ev8a[j] != "NA" {selectedWords[ev8a[j].toInt()!][matchIndexer] = "1"}
}

func fillWordsB(matchIndexer: Int, j: Int) {
    words[0][matchIndexer] = ev0b[j]
    words[1][matchIndexer] = ev1b[j]
    words[2][matchIndexer] = ev2b[j]
    words[3][matchIndexer] = ev3b[j]
    words[4][matchIndexer] = ev4b[j]
    words[5][matchIndexer] = ev5b[j]
    words[6][matchIndexer] = ev6b[j]
    words[7][matchIndexer] = ev7b[j]
    words[8][matchIndexer] = ev8b[j]
    if !ev0b[j].isEmpty && ev0b[j] != "NA" {selectedWords[ev0b[j].toInt()!][matchIndexer] = "1"}
    if !ev1b[j].isEmpty && ev1b[j] != "NA" {selectedWords[ev1b[j].toInt()!][matchIndexer] = "1"}
    if !ev2b[j].isEmpty && ev2b[j] != "NA" {selectedWords[ev2b[j].toInt()!][matchIndexer] = "1"}
    if !ev3b[j].isEmpty && ev3b[j] != "NA" {selectedWords[ev3b[j].toInt()!][matchIndexer] = "1"}
    if !ev4b[j].isEmpty && ev4b[j] != "NA" {selectedWords[ev4b[j].toInt()!][matchIndexer] = "1"}
    if !ev5b[j].isEmpty && ev5b[j] != "NA" {selectedWords[ev5b[j].toInt()!][matchIndexer] = "1"}
    if !ev6b[j].isEmpty && ev6b[j] != "NA" {selectedWords[ev6b[j].toInt()!][matchIndexer] = "1"}
    if !ev7b[j].isEmpty && ev7b[j] != "NA" {selectedWords[ev7b[j].toInt()!][matchIndexer] = "1"}
    if !ev8b[j].isEmpty && ev8b[j] != "NA" {selectedWords[ev8b[j].toInt()!][matchIndexer] = "1"}
}

func generateTweets() {
    var tweet = [Int: String]()
    let url = urlForScene("/Users/wenjiezhong/Desktop/f758430.csv")
    var error: NSErrorPointer = nil
    if let csv = CSV(contentsOfURL: url, error: error) {
        // Rows
        let rows = csv.rows
        let headers = csv.headers
        
        // Columns
        let columns = csv.columns
        //columnOfTweets1 = columns["text1"]!
        //columnOfTweets2 = columns["text2"]!
        columnOfTID1 = columns["tid1"]!
        columnOfTID2 = columns["tid2"]!
        columnOfTweetIrrelevant1 = columns["tweet1irrelevant"]!
        columnOfTweetIrrelevant2 = columns["tweet2irrelevant"]!
        columnOfTweetNovel1 = columns["tweet1novel"]!
        columnOfTweetNovel2 = columns["tweet2novel"]!
        columnOfTweetsEqual = columns["tweetsequal"]!
        columnOfRelevant1 = columns["relevant1"]!
        columnOfRelevant2 = columns["relevant2"]!
        columnOfTaskID = columns["_id"]!
        columnOfUnitID = columns["unit_id"]!
        columnOfWorkerID = columns["worker_id"]!
        
        ev0a = columns["ev0a"]!
        ev1a = columns["ev1a"]!
        ev2a = columns["ev2a"]!
        ev3a = columns["ev3a"]!
        ev4a = columns["ev4a"]!
        ev5a = columns["ev5a"]!
        ev6a = columns["ev6a"]!
        ev7a = columns["ev7a"]!
        ev8a = columns["ev8a"]!
        
        ev0b = columns["ev0b"]!
        ev1b = columns["ev1b"]!
        ev2b = columns["ev2b"]!
        ev3b = columns["ev3b"]!
        ev4b = columns["ev4b"]!
        ev5b = columns["ev5b"]!
        ev6b = columns["ev6b"]!
        ev7b = columns["ev7b"]!
        ev8b = columns["ev8b"]!
    }
    wordsInTweetsArray1 = wordsOfTweets1!.componentsSeparatedByString("\n")
    wordsInTweetsArray2 = wordsOfTweets2!.componentsSeparatedByString("\n")
    generateCompetitionResults()
    combineArraysToDocument()
    saveToDocument(combinedArarys, "aggregated.csv")
    //calculateNoveltySum()
}

var combinedArarys = [String]()
var combinedNames = [String]()
var combinedWordsA = [String]()
var combinedWordsB = [String]()
var combinedWordsC = [String]()
var combinedWordsD = [String]()
var combinedWordsE = [String]()
var combinedWordsF = [String]()
var combinedWordsG = [String]()

func combineArraysToDocument() {
    for i in 0..<resultNames[0].count {
        combinedNames.append("\(unitIDArray[i]),\(workerIDArray[i]),\(resultNames[0][i]),\(resultNames[1][i]),\(matchResult[0][i]),\(matchResult[1][i]),\(matchResult[2][i]),\(irrelevancyOfTaskCheck[0][i]),\(irrelevancyOfTaskCheck[1][i]),\(relevancyOfTaskCheck[0][i]),\(relevancyOfTaskCheck[1][i])")
    }
    for i in 0..<resultNames[0].count {
        combinedWordsA.append("\(tweetWords[0][i]),\(selectedWords[0][i]),\(tweetWords[1][i]),\(selectedWords[1][i]),\(tweetWords[2][i]),\(selectedWords[2][i]),\(tweetWords[3][i]),\(selectedWords[3][i]),\(tweetWords[4][i]),\(selectedWords[4][i])")
    }
    for i in 0..<resultNames[0].count {
        combinedWordsB.append("\(tweetWords[5][i]),\(selectedWords[5][i]),\(tweetWords[6][i]),\(selectedWords[6][i]),\(tweetWords[7][i]),\(selectedWords[7][i]),\(tweetWords[8][i]),\(selectedWords[8][i])")
    }
    for i in 0..<resultNames[0].count {
        combinedWordsC.append("\(tweetWords[9][i]),\(selectedWords[9][i]),\(tweetWords[10][i]),\(selectedWords[10][i]),\(tweetWords[11][i]),\(selectedWords[11][i]),\(tweetWords[12][i]),\(selectedWords[12][i])")
    }
    for i in 0..<resultNames[0].count {
        combinedWordsD.append("\(tweetWords[13][i]),\(selectedWords[13][i]),\(tweetWords[14][i]),\(selectedWords[14][i]),\(tweetWords[15][i]),\(selectedWords[15][i]),\(tweetWords[16][i]),\(selectedWords[16][i])")
    }
    for i in 0..<resultNames[0].count {
        combinedWordsE.append("\(tweetWords[17][i]),\(selectedWords[17][i]),\(tweetWords[18][i]),\(selectedWords[18][i]),\(tweetWords[19][i]),\(selectedWords[19][i]),\(tweetWords[20][i]),\(selectedWords[20][i])")
    }
    for i in 0..<resultNames[0].count {
        combinedWordsF.append("\(tweetWords[21][i]),\(selectedWords[21][i]),\(tweetWords[22][i]),\(selectedWords[22][i]),\(tweetWords[23][i]),\(selectedWords[23][i]),\(tweetWords[24][i]),\(selectedWords[24][i])")
    }
    for i in 0..<resultNames[0].count {
        combinedWordsG.append("\(tweetWords[25][i]),\(selectedWords[25][i]),\(tweetWords[26][i]),\(selectedWords[26][i]),\(tweetWords[27][i]),\(selectedWords[27][i])")
    }
    for i in 0..<resultNames[0].count {
        combinedArarys.append("\(combinedNames[i]),\(combinedWordsA[i]),\(combinedWordsB[i]),\(combinedWordsC[i]),\(combinedWordsD[i]),\(combinedWordsE[i]),\(combinedWordsF[i]),\(combinedWordsG[i])")
    }
}

var columnOfTweets = [String]()
var forDistanceMeasure = "/Users/wenjiezhong/Desktop/fifa.txt"
var wordsOfDistance = String(contentsOfFile: forDistanceMeasure, encoding: NSUTF8StringEncoding, error: nil)
var i = 0
var tweetlets = [String]()
var nextTweetlets = [String]()
var similarityScore = [String]()
var indexOfTweetlets: Int = 0
var indexOfColumns = 1850
var similarityScoreTemp = 0
var similarityScoreString = ""

func executeSimilarityCalculation() {
    columnOfTweets = wordsOfDistance!.componentsSeparatedByString("\n")
    while i < columnOfTweets.count-1 {
        var tweetlets = columnOfTweets[indexOfColumns].componentsSeparatedByString(" ")
        var nextTweetlets = columnOfTweets[indexOfColumns+1].componentsSeparatedByString(" ")
        while indexOfTweetlets < tweetlets.count && indexOfTweetlets < nextTweetlets.count {
            similarityScoreTemp += levenshteinDistance(tweetlets[indexOfTweetlets],nextTweetlets[indexOfTweetlets])
            indexOfTweetlets++
        }
        similarityScoreString = String(similarityScoreTemp)
        similarityScore.append(similarityScoreString)
        similarityScoreTemp = 0
        println(columnOfTweets[indexOfColumns])
        println(columnOfTweets[indexOfColumns+1])
        println("Similarity score of tweet pair \(indexOfColumns): \(similarityScore[indexOfColumns])")
        println()
        indexOfColumns++
        i++
        indexOfTweetlets = 0
    }
    
    //Write to file
    let similarityFileName = "similarity.csv"
    
    if let dirs : [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
        let dir = dirs[0] //documents directory
        
        let pathToWriteForSimilarity = dir.stringByAppendingPathComponent(similarityFileName)
        let joinedSimilarities = "\n".join(similarityScore)
        joinedSimilarities.writeToFile(pathToWriteForSimilarity, atomically:true, encoding:NSUTF8StringEncoding)
    }
}

var h = 0
var tempArrayOfAllDistances = [Int]()
var arrayOfAllDistances = [String]()
var indexOfColumnsReverse = 0
func generateSmallestDistances() {
    columnOfTweets = wordsOfDistance!.componentsSeparatedByString("\n")
    while indexOfColumns < columnOfTweets.count {
        while indexOfColumnsReverse != -1 {
            var tweetlets = columnOfTweets[indexOfColumns].componentsSeparatedByString(" ")
            var nextTweetlets = columnOfTweets[indexOfColumnsReverse].componentsSeparatedByString(" ")
            while indexOfTweetlets < tweetlets.count && indexOfTweetlets < nextTweetlets.count {
                similarityScoreTemp += levenshteinDistance(tweetlets[indexOfTweetlets],nextTweetlets[indexOfTweetlets])
                indexOfTweetlets++
            }
            tempArrayOfAllDistances.append(similarityScoreTemp)
            similarityScoreTemp = 0
            indexOfColumnsReverse--
            indexOfTweetlets = 0
        }
        var numMin = tempArrayOfAllDistances.reduce(Int.max, combine: { min($0, $1) })
        tempArrayOfAllDistances.removeAll()
        similarityScoreString = String(numMin)
        similarityScore.append(similarityScoreString)
        indexOfColumnsReverse = indexOfColumns
        indexOfColumns++
        println("\(h): \(similarityScore[h])")
        h++
    }
    saveToDocument(similarityScore, "minDistanceOfAll")
}

func tempFunc() {
    columnOfTweets = wordsOfDistance!.componentsSeparatedByString("\n")
    var testSentence = "News:  #Vietnam requests China to probe attack that killed 3 #Vietnamese women - Tuoitrenews"
    while indexOfColumns < columnOfTweets.count-1 {
        var tweetlets = columnOfTweets[indexOfColumns].componentsSeparatedByString(" ")
        var nextTweetlets = testSentence.componentsSeparatedByString(" ")
        while indexOfTweetlets < tweetlets.count && indexOfTweetlets < nextTweetlets.count {
            similarityScoreTemp += levenshteinDistance(tweetlets[indexOfTweetlets],nextTweetlets[indexOfTweetlets])
            indexOfTweetlets++
        }
        tempArrayOfAllDistances.append(similarityScoreTemp)
        similarityScoreTemp = 0
        indexOfColumns++
        indexOfTweetlets = 0
    }
    var numMin = tempArrayOfAllDistances.reduce(Int.max, combine: { min($0, $1) })
    println(numMin)
}

//Relevancy score Wikipedia
func countWikiTerms() {
    var wikiRelevancyScores = [String]()
    var wikiArray = [String]()
    var wikiStringTF = [String]()
    var wikiTF = [Double]()
    var calculationArray = [Double]()
    var calculationStrings = [String]()
    
    var error: NSErrorPointer = nil
    let pathOfWiki = urlForScene("/Users/wenjiezhong/Dropbox/AI/CrowdTruth/Curation/WikipediaEntitiesTF.csv")
    
    if let wikiCSV = CSV(contentsOfURL: pathOfWiki, error: error) {
        // Rows
        let rows = wikiCSV.rows
        let headers = wikiCSV.headers
        
        // Columns
        let wikiColumns = wikiCSV.columns
        wikiArray = wikiColumns["text"]!
        wikiStringTF = wikiColumns["tf"]!
        for i in 0..<wikiStringTF.count {
            var tempStringWiki = (wikiStringTF[i] as NSString).doubleValue
            wikiTF.append(tempStringWiki)
        }
    }
    
    var tempCount:Double = 0
    var countedArticlesToString = ""
    while indexOfColumns < columnOfTweets.count {
        for j in 0..<wikiArray.count {
            var matches = matchesForRegexInText("\\b\(wikiArray[j])\\b", columnOfTweets[indexOfColumns])
            var tempProduct = Double(matches.count) * wikiTF[j]
            tempCount += tempProduct
        }
        calculationArray.append(tempCount)
        countedArticlesToString = String(stringInterpolationSegment: tempCount)
        wikiRelevancyScores.insert(countedArticlesToString, atIndex: indexOfColumns)
        tempCount = 0
        indexOfColumns++
    }
    
    let calculationMax = maxElement(calculationArray)
    
    for k in 0..<calculationArray.count {
        var countedWikiCountToString = String(stringInterpolationSegment: calculationArray[k])
        calculationStrings.append(countedWikiCountToString)
    }
    
    
    let wikiFileName = "wikiCount.csv"
    
    if let dirs : [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
        let dir = dirs[0] //documents directory
        
        let pathToWriteForWiki = dir.stringByAppendingPathComponent(wikiFileName)
        let joinedWiki = "\n".join(calculationStrings)
        joinedWiki.writeToFile(pathToWriteForWiki, atomically:true, encoding:NSUTF8StringEncoding)
    }
}








