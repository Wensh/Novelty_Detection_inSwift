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
    let url = urlForScene("/Users/wenjiezhong/Dropbox/AI/CrowdTruth/Curation/TweetStreamNormalDates.csv")
    var error: NSErrorPointer = nil
    if let csv = CSV(contentsOfURL: url, error: error) {
        // Rows
        let rows = csv.rows
        let headers = csv.headers
        
        // Columns
        let columns = csv.columns
        columnOfTweets = columns["text"]!
        urlArray = columns["expanded_url"]!
        
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

/*
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
*/

/*
//Relevancy score Seed words
var seedRelevancyScores = [String]()

let pathOfSeed = "/Users/wenjiezhong/Dropbox/AI/CrowdTruth/Curation/Seedwords.txt"
var seedWords = String(contentsOfFile: pathOfSeed, encoding: NSUTF8StringEncoding, error: nil)
//seedWords = seedWords!.stringByReplacingOccurrencesOfString("\r", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
var seedWordsArray = [String]()
seedWordsArray = seedWords!.componentsSeparatedByString("\n")

var tempCount = 0
var countedSeedWordsToString = ""
while indexOfColumns < columnOfTweets.count {
for j in 0..<seedWordsArray.count {
var matches = matchesForRegexInText("\\b\(seedWordsArray[j])\\b", columnOfTweets[indexOfColumns])
tempCount += matches.count
}
countedSeedWordsToString = String(tempCount)
seedRelevancyScores.insert(countedSeedWordsToString, atIndex: indexOfColumns)
tempCount = 0
indexOfColumns++
}

let seedWordsFileName = "seedWordsRelevanceCount.csv"

if let dirs : [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
let dir = dirs[0] //documents directory

let pathToWriteForSeedWords = dir.stringByAppendingPathComponent(seedWordsFileName)
let joinedSeedWords = "\n".join(seedRelevancyScores)
joinedSeedWords.writeToFile(pathToWriteForSeedWords, atomically:true, encoding:NSUTF8StringEncoding)
}
*/

/*
//Relevancy score Articles
var articleRelevancyScores = [String]()
var articlesArray = [String]()
var articleStringTFIDF = [String]()
var articleTFIDF = [Double]()

var error: NSErrorPointer = nil
let pathOfArticle = urlForScene("/Users/wenjiezhong/Dropbox/AI/CrowdTruth/Curation/articles.csv")

if let articleCSV = CSV(contentsOfURL: pathOfArticle, error: error) {
    // Rows
    let rows = articleCSV.rows
    let headers = articleCSV.headers
    
    // Columns
    let articleColumns = articleCSV.columns
    articlesArray = articleColumns["text"]!
    articleStringTFIDF = articleColumns["tfidf"]!
    for i in 0..<articleStringTFIDF.count {
        var tempStringArticle = (articleStringTFIDF[i] as NSString).doubleValue
        articleTFIDF.append(tempStringArticle)
    }
}

var tempCount:Double = 0
var countedArticlesToString = ""
while indexOfColumns < columnOfTweets.count {
    for j in 0..<articlesArray.count {
        var matches = matchesForRegexInText("\\b\(articlesArray[j])\\b", columnOfTweets[indexOfColumns])
        var tempProduct = Double(matches.count) * articleTFIDF[j]
        tempCount += tempProduct
    }
    countedArticlesToString = String(stringInterpolationSegment: tempCount)
    articleRelevancyScores.insert(countedArticlesToString, atIndex: indexOfColumns)
    tempCount = 0
    indexOfColumns++
}

let articlesFileName = "articlesRelevanceCount.csv"

if let dirs : [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
    let dir = dirs[0] //documents directory
    
    let pathToWriteForArticles = dir.stringByAppendingPathComponent(articlesFileName)
    let joinedArticles = "\n".join(articleRelevancyScores)
    joinedArticles.writeToFile(pathToWriteForArticles, atomically:true, encoding:NSUTF8StringEncoding)
}
*/

//Relevancy score Articles
var wikiRelevancyScores = [String]()
var wikiArray = [String]()
var wikiStringTF = [String]()
var wikiTF = [Double]()

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
    println(tempCount)
    println(columnOfTweets[indexOfColumns])
    tempCount /= 37
    countedArticlesToString = String(stringInterpolationSegment: tempCount)
    println(countedArticlesToString)
    wikiRelevancyScores.insert(countedArticlesToString, atIndex: indexOfColumns)
    println(wikiRelevancyScores[indexOfColumns])
    tempCount = 0
    indexOfColumns++
}

let wikiFileName = "wikiRelevanceCount.csv"

if let dirs : [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
    let dir = dirs[0] //documents directory
    
    let pathToWriteForWiki = dir.stringByAppendingPathComponent(wikiFileName)
    let joinedWiki = "\n".join(wikiRelevancyScores)
    joinedWiki.writeToFile(pathToWriteForWiki, atomically:true, encoding:NSUTF8StringEncoding)
}







