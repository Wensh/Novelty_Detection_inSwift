//
//  PairUpTweets.swift
//  Tweet Novelty Detection
//
//  Created by Wenjie Zhong on 06-08-15.
//  Copyright (c) 2015 Wenjie Zhong. All rights reserved.
//

import Foundation

func pairUpTweets() {
    var i = 1
    var j = 0
    let pathOfSeed = "/Users/wenjiezhong/Desktop/china.txt"
    var seedWords = String(contentsOfFile: pathOfSeed, encoding: NSUTF8StringEncoding, error: nil)
    
    var seedWordsArray = [String]()
    var pairsArray = [String]()
    var outputArray = [String]()
    seedWordsArray = seedWords!.componentsSeparatedByString("\n")
    
    
    while i < seedWordsArray.count {
        while j < i {
            var tempTweetFirst = seedWordsArray[i].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            var tempTweetSecond = seedWordsArray[j].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            pairsArray.append("\(tempTweetSecond),\(tempTweetFirst)")
            j++
        }
        j=0
        i++
    }
    saveToDocument(pairsArray, "tweetpairs.csv")
}
