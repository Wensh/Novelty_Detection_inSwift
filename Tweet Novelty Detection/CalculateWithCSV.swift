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
var matchResult = Array(count: 20, repeatedValue: Array(count: 1542, repeatedValue: "0"))
//0 TID, 1 TaskID,
var resultNames = Array(count: 20, repeatedValue: Array(count: 1542, repeatedValue: "0"))
// Selected words from 0-8
var words = Array(count: 20, repeatedValue: Array(count: 1542, repeatedValue: " "))
// Tweet words from 0-8
var tweetWords = Array(count: 30, repeatedValue: Array(count: 1542, repeatedValue: " "))
var selectedWords = Array(count: 30, repeatedValue: Array(count: 1542, repeatedValue: "0"))

var pathOfWords1 = "/Users/wenjiezhong/Dropbox/AI/CrowdTruth/CrowdFlower/Processing/text1.txt"
var wordsOfTweets1 = String(contentsOfFile: pathOfWords1, encoding: NSUTF8StringEncoding, error: nil)
var wordsInTweetsArray1 = [String]()
var pathOfWords2 = "/Users/wenjiezhong/Dropbox/AI/CrowdTruth/CrowdFlower/Processing/text1.txt"
var wordsOfTweets2 = String(contentsOfFile: pathOfWords2, encoding: NSUTF8StringEncoding, error: nil)
var wordsInTweetsArray2 = [String]()

func calculateNoveltySum() {
    var j = 0
    while nsIndexer < 50 {
        tweetNoveltySum.insert(0, atIndex:nsIndexer)
        while j < columnOfTweets1.count-1 {
            if (columnOfTID1[j] == "tid00\(nsIndexer+1)" || columnOfTID1[j] == "tid0\(nsIndexer+1)" && columnOfTweetNovel1[j] == "true") {
                interTweetNoveltySum = tweetNoveltySum[nsIndexer] + 1
                tweetNoveltySum.insert(interTweetNoveltySum, atIndex:nsIndexer)
            }
            else if (columnOfTID1[j] == "tid00\(nsIndexer+1)" || columnOfTID1[j] == "tid0\(nsIndexer+1)"  && columnOfTweetsEqual[j] == "true") {
                interTweetNoveltySum = tweetNoveltySum[nsIndexer] + 1
                tweetNoveltySum.insert(interTweetNoveltySum, atIndex:nsIndexer)
            }
            else if (columnOfTID1[j] == "tid00\(nsIndexer+1)" || columnOfTID1[j] == "tid0\(nsIndexer+1)"  && columnOfTweetNovel2[j] == "true") {
                interTweetNoveltySum = tweetNoveltySum[nsIndexer] - 1
                tweetNoveltySum.insert(interTweetNoveltySum, atIndex:nsIndexer)
            }
            if (columnOfTID2[j] == "tid00\(nsIndexer+1)" || columnOfTID2[j] == "tid0\(nsIndexer+1)"  && columnOfTweetNovel2[j] == "true") {
                interTweetNoveltySum = tweetNoveltySum[nsIndexer] + 1
                tweetNoveltySum.insert(interTweetNoveltySum, atIndex:nsIndexer)
            }
            else if (columnOfTID2[j] == "tid00\(nsIndexer+1)" || columnOfTID2[j] == "tid0\(nsIndexer+1)"  && columnOfTweetsEqual[j] == "true") {
                interTweetNoveltySum = tweetNoveltySum[nsIndexer] + 1
                tweetNoveltySum.insert(interTweetNoveltySum, atIndex:nsIndexer)
            }
            else if (columnOfTID2[j] == "tid00\(nsIndexer+1)" || columnOfTID2[j] == "tid0\(nsIndexer+1)"  && columnOfTweetNovel1[j] == "true") {
                interTweetNoveltySum = tweetNoveltySum[nsIndexer] - 1
                tweetNoveltySum.insert(interTweetNoveltySum,atIndex:nsIndexer)
            }
            j++
        }
        nsIndexer++
        interTweetNoveltySum = 0
        j = 0
    }
}

func retrieveWordsOfTweetsA(matchIndexer: Int, j: Int){
    wordsInTweetsArray1 = wordsOfTweets1!.componentsSeparatedByString("\n")
    var tempBodyOfTweet = [String]()
    tempBodyOfTweet = wordsInTweetsArray1[j].componentsSeparatedByString(" ")
    for m in 0..<tempBodyOfTweet.count {
        tweetWords[m][matchIndexer] = tempBodyOfTweet[m]
    }
}

func retrieveWordsOfTweetsB(matchIndexer: Int, j: Int){
    wordsInTweetsArray2 = wordsOfTweets2!.componentsSeparatedByString("\n")
    var tempBodyOfTweet = [String]()
    tempBodyOfTweet = wordsInTweetsArray2[j].componentsSeparatedByString(" ")
    for m in 0..<tempBodyOfTweet.count {
        tweetWords[m][matchIndexer] = tempBodyOfTweet[m]
    }
}

func generateOutput() {
    var j = 0
    var matchIndexer = 0
    var tempNameTID = ""
    var tempnsIndexerChecker = ""
    while nsIndexer <= 50 {
        while j < columnOfTID1.count-1 {
            if nsIndexer <= 9 {
                tempnsIndexerChecker = "tid00\(nsIndexer+1)"
            }
            else {
                tempnsIndexerChecker = "tid0\(nsIndexer+1)"
            }
            if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetNovel1[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[0][matchIndexer] = "1"
                fillWordsA(matchIndexer, j)
                retrieveWordsOfTweetsA(matchIndexer, j)
                matchIndexer++
            }
            else if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetsEqual[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[1][matchIndexer] = "1"
                fillWordsA(matchIndexer, j)
                retrieveWordsOfTweetsA(matchIndexer, j)
                matchIndexer++
            }
            else if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetNovel2[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[2][matchIndexer] = "1"
                fillWordsA(matchIndexer, j)
                retrieveWordsOfTweetsA(matchIndexer, j)
                matchIndexer++
            }
            else if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetIrrelevant2[j] == "true" && columnOfTweetIrrelevant2[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[0][matchIndexer] = "IRRELEVANT"
                matchResult[1][matchIndexer] = "IRRELEVANT"
                matchResult[2][matchIndexer] = "IRRELEVANT"
                fillWordsA(matchIndexer, j)
                retrieveWordsOfTweetsA(matchIndexer, j)
                matchIndexer++
            }
            if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetNovel2[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[0][matchIndexer] = "1"
                fillWordsB(matchIndexer, j)
                retrieveWordsOfTweetsB(matchIndexer, j)
                matchIndexer++
            }
            else if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetsEqual[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[1][matchIndexer] = "1"
                fillWordsB(matchIndexer, j)
                retrieveWordsOfTweetsB(matchIndexer, j)
                matchIndexer++
            }
            else if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetNovel1[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[2][matchIndexer] = "1"
                fillWordsB(matchIndexer, j)
                retrieveWordsOfTweetsB(matchIndexer, j)
                matchIndexer++
            }
            else if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetIrrelevant2[j] == "true" && columnOfTweetIrrelevant2[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[0][matchIndexer] = "IRRELEVANT"
                matchResult[1][matchIndexer] = "IRRELEVANT"
                matchResult[2][matchIndexer] = "IRRELEVANT"
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
        tempNameTID = "tid00\(nsIndexer+1)"
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
    let url = urlForScene("/Users/wenjiezhong/Dropbox/AI/CrowdTruth/CrowdFlower/Processing/f753477test.csv")
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
        //columnOfRelevant1 = columns["relevant1"]!
        //columnOfRelevant2 = columns["relevant2"]!
        columnOfTaskID = columns["_id"]!
        
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
    //calculateNoveltySum()
    generateOutput()
    saveToDocument(resultNames[0], "TID")
    saveToDocument(resultNames[1], "ID")
    saveToDocument(matchResult[0], "wins")
    saveToDocument(matchResult[1], "draw")
    saveToDocument(matchResult[2], "lost")
    saveMultipleDocuments()
}

func saveMultipleDocuments() {
    for i in 0..<8 {
        saveToDocument(words[i], "words\(i)")
    }
    for i in 0..<29 {
        saveToDocument(tweetWords[i], "tweetWords\(i)")
        saveToDocument(selectedWords[i],"selectedWords\(i)")
    }
}

var columnOfTweets = [String]()
var i = 0
var tweetlets = [String]()
var nextTweetlets = [String]()
var similarityScore = [String]()
var indexOfTweetlets: Int = 0
var indexOfColumns = 0
var similarityScoreTemp = 0
var similarityScoreString = ""

func executeSimilarityCalculation() {
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









