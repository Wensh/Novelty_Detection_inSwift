//  main.swift
//  Swift Tweets
//
//  Created for tweet expressions by Wenjie Zhong on 18-05-15

import Foundation

//Input
func urlForScene(stringForUrl : String) -> NSURL {
    let filepath = stringForUrl
    var filename:NSString = "Whaling"
    return NSURL.fileURLWithPath(filepath)!
}

//Patterns
let urlPattern = "(http:\\/\\/t.co\\/)[a-zA-Z0-9\\-\\.]{1,16}"
let handlePattern = "([@])\\w+"
let hashtagPattern = "\\B#\\w+"
let retweetPattern = "\\bRT\\b"
let retweetWithCommentPattern = "\\040RT\\b"

//Output
var columnOfTweets = [String]()
var handleOutput : [String] = [""]
var urlArray = [String]()

func generateTweets() {
    var tweet = [Int: String]()
    let url = urlForScene("/Users/wenjiezhong/Desktop/tweets2014/mh370_pos.csv")
    var error: NSErrorPointer = nil
    if let csv = CSV(contentsOfURL: url, error: error) {
        // Rows
        let rows = csv.rows
        let headers = csv.headers
        
        // Columns
        let columns = csv.columns
        columnOfTweets = columns["text"]!
        //urlArray = columns["expanded_url"]!
        
    }
}

generateTweets()
var i = 0
var tweetlets = [String]()
var nextTweetlets = [String]()
var similarityScore = [String]()
var indexOfTweetlets: Int = 0
var indexOfColumns = 0
var similarityScoreTemp = 0
var similarityScoreString = ""

//countPartialMatch()
//countExactMatch()
//countWikiTerms()
//executeSimilarityCalculation()
//sixSort()

