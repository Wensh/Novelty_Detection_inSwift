//Check if person has his or hers own wikipage.

import Cocoa
import Foundation

var nameOfTwitterUser = "Johan_Cruyff"
var sparqlRequestPrsonOnDBpedia = "http://dbpedia.org/sparql?default-graph-uri=http%3A%2F%2Fdbpedia.org&query=select+distinct+%3FConcept+where+%7B%0D%0Adbpedia%3A"+nameOfTwitterUser+"+rdf%3Atype+%3FConcept%0D%0AFILTER+regex%28%3FConcept%2C+%22Person%22%29%0D%0A%7D+&format=application%2Fsparql-results%2Bjson&timeout=30000&debug=on"

var longurl = String(contentsOfURL: NSURL(string: sparqlRequestPrsonOnDBpedia)!, encoding: NSUTF8StringEncoding, error: nil)


func matchesForRegexInText(regex: String!, text: String!) -> [String] {
    let regex = NSRegularExpression(pattern: regex,
        options: nil, error: nil)!
    let nsString = text as NSString
    let results = regex.matchesInString(text,
        options: nil, range: NSMakeRange(0, nsString.length))
        as! [NSTextCheckingResult]
    return map(results) { nsString.substringWithRange($0.range)}
}
/*
if longurl!.rangeOfString("\"http://dbpedia.org/ontology/Person\"") != nil{
println("exists")
}
else {
println("doesn't exist")
}
*/

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

func sixSort() {
    let pathOfSeed = "/Users/wenjiezhong/Desktop/naamloos.txt"
    var seedWords = String(contentsOfFile: pathOfSeed, encoding: NSUTF8StringEncoding, error: nil)
    
    var seedWordsArray = [String]()
    var pairsArray = [String]()
    var outputArray = [String]()
    seedWordsArray = seedWords!.componentsSeparatedByString("\n")
    
    var sixCount = 1
    var sixResetter = 2
    var lineCounter = 0
    
    for i in 0..<seedWordsArray.count {
        while sixCount < 12 {
            pairsArray.insert("\(i), \(seedWordsArray[i]), \(sixCount), \(seedWordsArray[sixCount])", atIndex: lineCounter)
            sixCount++
            lineCounter++
        }
        sixCount = sixResetter
        sixResetter++
    }
    
    var sixThreshold = 5
    var outputCounter = 0
    sixCount = 0
    
    for i in 0..<11 {
        outputArray.insert(" ", atIndex: i)
        while (outputCounter<=sixThreshold && sixCount<=65) {
            outputArray.insert("\(outputArray[i]),\(pairsArray[sixCount])", atIndex: i)
            outputCounter++
            sixCount++
        }
        outputCounter = 0
    }
    
    
    let sortedFileName = "sorted.csv"
    
    if let dirs : [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
        let dir = dirs[0] //documents directory
        
        let pathToWriteForSorted = dir.stringByAppendingPathComponent(sortedFileName)
        let joinedSorted = "\n".join(outputArray)
        joinedSorted.writeToFile(pathToWriteForSorted, atomically:true, encoding:NSUTF8StringEncoding)
    }
}















