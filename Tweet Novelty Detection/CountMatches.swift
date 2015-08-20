//
//  CountFunctions.swift
//  Tweet Novelty Detection
//
//  Created by Wenjie Zhong on 29-06-15.
//  Copyright (c) 2015 Wenjie Zhong. All rights reserved.
//

import Foundation

func getMatches(targetString: String, regex: String, options: NSRegularExpressionOptions) -> [NSTextCheckingResult]
{
    var error: NSError?
    var exp = NSRegularExpression(pattern: regex, options: options, error: &error)
    
    if let error = error {
        println(error.description)
    }
    var matches = exp!.matchesInString(targetString, options: nil, range: NSMakeRange(0, count(targetString)))
    return matches as! [NSTextCheckingResult]
}

//Partial match
func countPartialMatch() {
    var seedCountInTweet = [String]()
    var seedCount = [String]()
    
    let pathOfLong = "/Users/wenjiezhong/Dropbox/ai/CrowdTruth/WhalingTweets/whaling2014.txt"
    let pathOfShort = "/Users/wenjiezhong/Dropbox/ai/CrowdTruth/Extraction/Expert/Seedwords.txt"
    var shortList = String(contentsOfFile: pathOfShort, encoding: NSUTF8StringEncoding, error: nil)
    var longList = String(contentsOfFile: pathOfLong, encoding: NSUTF8StringEncoding, error: nil)
    
    var shortArray = [String]()
    shortArray = shortList!.componentsSeparatedByString("\n")
    
    var longArray = [String]()
    longArray = longList!.componentsSeparatedByString("\n")
    
    var j = 0
    var k = 0
    var m = 0
    var tempStringArray = [String]()
    var tempCount = 0
    var finalCount = 0
    var countedSeedWordsToString = ""
    
    //Count words in tweet, first j than k
    while j < longArray.count {
        while k < shortArray.count {
            tempStringArray = longArray[j].componentsSeparatedByString(" ")
            while m < tempStringArray.count {
                if (tempStringArray[m].lowercaseString.rangeOfString(shortArray[k]) != nil) {
                    tempCount++
                }
                else if ((shortArray[k].rangeOfString(" ")) != nil && longArray[j].lowercaseString.rangeOfString(shortArray[k]) != nil && m == tempStringArray.count-1) {
                    tempCount++
                }
                m++
            }
            m=0
            k++
        }
        countedSeedWordsToString = String(tempCount)
        seedCountInTweet.insert(countedSeedWordsToString, atIndex: j)
        tempCount = 0
        k=0
        j++
    }
    
    //Word occurrence in whole set, first k than j
    j=0
    while j < shortArray.count {
        while k < longArray.count {
            tempStringArray = longArray[k].componentsSeparatedByString(" ")
            while m < tempStringArray.count {
                if (tempStringArray[m].lowercaseString.rangeOfString(shortArray[j]) != nil) {
                    tempCount++
                }
                else if ((shortArray[j].rangeOfString(" ")) != nil && longArray[k].lowercaseString.rangeOfString(shortArray[j]) != nil && m == tempStringArray.count-1) {
                    tempCount++
                }
                m++
            }
            m=0
            k++
        }
        countedSeedWordsToString = String(tempCount)
        seedCount.insert(countedSeedWordsToString, atIndex: j)
        tempCount = 0
        k=0
        j++
    }
    
    
    let seedWordsFileName = "countedSeedwords.txt"
    let seedWordsCountFileName = "seedWordsOccurrences.txt"
    
    if let dirs : [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
        let dir = dirs[0] //documents directory
        
        let pathToWriteForSeedWords = dir.stringByAppendingPathComponent(seedWordsFileName)
        let joinedSeedWords = "\n".join(seedCountInTweet)
        joinedSeedWords.writeToFile(pathToWriteForSeedWords, atomically:true, encoding:NSUTF8StringEncoding)
        
        let pathToWriteForSeedWordsOccurrences = dir.stringByAppendingPathComponent(seedWordsCountFileName)
        let joinedSeedWordsOccurrences = "\n".join(seedCount)
        joinedSeedWordsOccurrences.writeToFile(pathToWriteForSeedWordsOccurrences, atomically:true, encoding:NSUTF8StringEncoding)
    }
}

//Exact match
func countExactMatch() {
    var seedRelevancyScores = [String]()
    var seedCount = [String]()
    
    let pathOfLong = "/Users/wenjiezhong/Dropbox/ai/CrowdTruth/WhalingTweets/whaling2014.txt"
    let pathOfShort = "/Users/wenjiezhong/Dropbox/ai/CrowdTruth/Extraction/Expert/Seedwords.txt"
    var longList = String(contentsOfFile: pathOfLong, encoding: NSUTF8StringEncoding, error: nil)
    var shortList = String(contentsOfFile: pathOfShort, encoding: NSUTF8StringEncoding, error: nil)
    
    var longArray = [String]()
    longArray = longList!.componentsSeparatedByString("\n")
    
    var shortArray = [String]()
    shortArray = shortList!.componentsSeparatedByString("\n")
    
    var j = 0
    var k = 0
    var tempCount = 0
    var finalCount = 0
    var countedSeedWordsToString = ""
    
    while j < longArray.count {
        while k < shortArray.count {
            var matches = getMatches(longArray[j], "\\b\(shortArray[k])\\b", NSRegularExpressionOptions.CaseInsensitive)
            tempCount = matches.count
            finalCount += tempCount
            k++
        }
        countedSeedWordsToString = String(finalCount)
        seedRelevancyScores.insert(countedSeedWordsToString, atIndex: j)
        finalCount = 0
        tempCount = 0
        k=0
        j++
    }
    
    j=0
    while j < shortArray.count {
        while k < longArray.count {
            var matches = getMatches(longArray[k], "\\b\(shortArray[j])\\b", NSRegularExpressionOptions.CaseInsensitive)
            tempCount = matches.count
            finalCount += tempCount
            k++
        }
        countedSeedWordsToString = String(finalCount)
        seedCount.insert(countedSeedWordsToString, atIndex: j)
        finalCount = 0
        tempCount = 0
        k=0
        j++
    }
    
    
    let seedWordsFileName = "countLong.txt"
    let seedWordsCountFileName = "countShort.txt"
    
    if let dirs : [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
        let dir = dirs[0] //documents directory
        
        let pathToWriteForSeedWords = dir.stringByAppendingPathComponent(seedWordsFileName)
        let joinedSeedWords = "\n".join(seedRelevancyScores)
        joinedSeedWords.writeToFile(pathToWriteForSeedWords, atomically:true, encoding:NSUTF8StringEncoding)
        
        let pathToWriteForSeedWordsOccurrences = dir.stringByAppendingPathComponent(seedWordsCountFileName)
        let joinedSeedWordsOccurrences = "\n".join(seedCount)
        joinedSeedWordsOccurrences.writeToFile(pathToWriteForSeedWordsOccurrences, atomically:true, encoding:NSUTF8StringEncoding)
    }
}