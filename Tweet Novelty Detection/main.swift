//  main.swift
//  Swift Tweets
//
//  Created for tweet expressions by Wenjie Zhong on 18-02-15

import Foundation

//Input
func urlForScene() -> NSURL {
    let filepath = "/Users/wenjiezhong/Dropbox/AI/CrowdTruth/Curation/TweetStream.csv"
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

func generateTweets() {
    var tweet = [Int: String]()
    let url = urlForScene()
    var error: NSErrorPointer = nil
    if let csv = CSV(contentsOfURL: url, error: error) {
        // Rows
        let rows = csv.rows
        let headers = csv.headers
        
        // Columns
        let columns = csv.columns
        columnOfTweets = columns["tweet"]!
    }
}

generateTweets()

/*
while columnOfTweets.count < 2000 {
    tweetLinkOutput[countLink] = ""
    outputOfURL[countLink] = ""
    tweetlets = columnOfTweets[indexOfColumns].componentsSeparatedByString(" ")
    while indexOfTweetlets < tweetlets.count {
        if (count(tweetlets[indexOfTweetlets]) >= 4) {
            if (tweetlets[indexOfTweetlets].substringToIndex(startIndex) == "http" && count(tweetlets[indexOfTweetlets]) > 20) {
                testURL = retrieveURL(tweetlets[indexOfTweetlets])
                checkEmptyIndex = true
                outputOfURL.insert("\(outputOfURL[countLink])\(testURL), ", atIndex: countLink)
}
if (count(testURL) >= 19 && testURL.substringToIndex(websiteIndex) == "https://www.youtub") {
tweetLinkOutput.insert("\(tweetLinkOutput[countLink])Youtube, ", atIndex: countLink)
}
else if (count(testURL) >= 19 && testURL.substringToIndex(websiteIndex) == "https://twitter.co") {
tweetLinkOutput.insert("\(tweetLinkOutput[countLink])Twitter, ", atIndex: countLink)
}
else {
tweetLinkOutput.insert("\(tweetLinkOutput[countLink])News, ", atIndex: countLink)
}
*/

/*
let handlesFileName = "handles.csv"

if let dirs : [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
let dir = dirs[0] //documents directory

let pathToWriteForHandles = dir.stringByAppendingPathComponent(handlesFileName)
let joinedHandles = "\n".join(handleOutput)
joinedHandles.writeToFile(pathToWriteForHandles, atomically:true, encoding:NSUTF8StringEncoding)
*/
