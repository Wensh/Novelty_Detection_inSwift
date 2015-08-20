//  main.swift
//  Swift Tweets
//
//  Created for tweet expressions by Wenjie Zhong on 18-05-15

import Foundation

//Patterns
let urlPattern = "(http:\\/\\/t.co\\/)[a-zA-Z0-9\\-\\.]{1,16}"
let safeUrlPattern = "(https:\\/\\/t.co\\/)[a-zA-Z0-9\\-\\.]{1,16}"
let handlePattern = "([@])\\w+"
let modHandlePattern = "([@])\\w+: "
let hashtagPattern = "\\B#\\w+"
let retweetPattern = "\\bRT\\b"
let retweetWithCommentPattern = "\\040RT\\b"

//generateVectorsForCrowdTruth2()
//generateVectorsForCrowdTruth()
//generateSumOfSelectedWords()
//generateTweets()
//countPartialMatch()
//countExactMatch()
//countWikiTerms()
//sortPairsMixedWithIrrelevantTweets()
//executeSimilarityCalculation()
//generateSmallestDistances()
//tempFunc()
//pairUpTweets()
getTargetData()

/*
//URL retrieval
func retrieveURL(url_string: String) -> String {
    if var url = NSURL(string: url_string) {
        let webURL = NSURL(string:"\(url_string)")
        let cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData
        var request = NSMutableURLRequest(URL: webURL!, cachePolicy: cachePolicy, timeoutInterval: 10.0)
        
        var response: NSURLResponse? = nil
        var error: NSError? = nil
        let reply = NSURLConnection.sendSynchronousRequest(request, returningResponse:&response, error:&error)
        
        var longurl = response?.URL
        
        var longurlString = longurl?.absoluteString
        
        if (longurl != nil) {
            return longurlString!
        }
        else {
            return url_string
        }
        
    } else {
        return url_string
    }
}

var retweetOutput = [String]()
var handleOutput = [String]()
var urlOutput = [String]()
columnOfTweets = wordsOfDistance!.componentsSeparatedByString("\n")
for (var i = 0; i<columnOfTweets.count; ++i) {
    if columnOfTweets[i] =~ retweetPattern {
        columnOfTweets[i] = columnOfTweets[i].stringByReplacingOccurrencesOfString("RT", withString: "", options: .allZeros, range: nil)
        //columnOfTweets[i] = dropFirst(columnOfTweets[i])
        retweetOutput.insert("1", atIndex: i)
    }
    else {
        retweetOutput.insert("0", atIndex: i)
    }
    /*
    if columnOfTweets[i] =~ handlePattern {
    columnOfTweets[i] = columnOfTweets[i].stringByReplacingOccurrencesOfString(modHandlePattern, withString: "", options: .RegularExpressionSearch, range: nil)
    columnOfTweets[i] = dropFirst(columnOfTweets[i])
    handleOutput.insert("1", atIndex: i)
    }
    else {
    handleOutput.insert("0", atIndex: i)
    }
    */
    if columnOfTweets[i] =~ urlPattern {
        columnOfTweets[i] = columnOfTweets[i].stringByReplacingOccurrencesOfString(urlPattern, withString: "", options: .RegularExpressionSearch, range: nil)
        columnOfTweets[i] = columnOfTweets[i].stringByReplacingOccurrencesOfString(safeUrlPattern, withString: "", options: .RegularExpressionSearch, range: nil)
        /*
        let types: NSTextCheckingType = .Link
        var error : NSError?
        let detector = NSDataDetector(types: types.rawValue, error: &error)
        var matches = detector!.matchesInString(columnOfTweets[i], options: nil, range: NSMakeRange(0, count(columnOfTweets[i])))
        
        for match in matches {
        var urlToString = String(stringInterpolationSegment: match.URL)
        var tempURL = retrieveURL(urlToString.substringWithRange(Range<String.Index>(start: advance(urlToString.startIndex, 9), end: advance(urlToString.endIndex, -1))))
        columnOfTweets[i] = columnOfTweets[i].stringByReplacingOccurrencesOfString(urlPattern, withString:"", options: .RegularExpressionSearch, range: nil)
        }
        */
        urlOutput.insert("1", atIndex: i)
    }
    else {
        urlOutput.insert("0", atIndex: i)
    }
    if Array(columnOfTweets[i])[0] == " "{
        columnOfTweets[i] = dropFirst(columnOfTweets[i])
    }
}
saveToDocument(columnOfTweets, "tweet.txt")
*/