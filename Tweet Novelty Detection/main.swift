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


executeSimilarityCalculation()
//sixSort()

/*
//Relevancy score Seed words
var seedRelevancyScores = [String]()

let pathOfSeed = "/Users/wenjiezhong/Dropbox/AI/CrowdTruth/Curation/Seedwords.txt"
let pathOfWiki = "/Users/wenjiezhong/Dropbox/AI/CrowdTruth/WhalingTweets/whaling2014.txt"
var seedWords = String(contentsOfFile: pathOfSeed, encoding: NSUTF8StringEncoding, error: nil)
var wikiWhaling = String(contentsOfFile: pathOfWiki, encoding: NSUTF8StringEncoding, error: nil)
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

let seedWordsFileName = "seedWordsCountInTweets.csv"

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

/*
//Relevancy score Wikipedia
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
*/

/*
//Exact match
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
*/

/*
//Partial match
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
*/
