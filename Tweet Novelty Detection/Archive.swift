//
//  Archive.swift
//  Tweet Novelty Detection
//
//  Created by Wenjie Zhong on 22-07-15.
//  Copyright (c) 2015 Wenjie Zhong. All rights reserved.
//
/*
import Foundation

func generateOutput() {
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
            //Win by tweet 1, both tweets are relevant
            if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetNovel1[j] == "true" && columnOfRelevant1[j] == "true" && columnOfRelevant2[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[0][matchIndexer] = "1"
                fillWordsA(matchIndexer, j)
                retrieveWordsOfTweetsA(matchIndexer, j)
                matchIndexer++
                
            }
                //UNDETECTED Win by tweet 1, tweet 1 is irrelevant
            else if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetNovel1[j] == "true" && columnOfRelevant1[j] == "false" && columnOfRelevant2[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[0][matchIndexer] = "1"
                relevancyOfTaskCheck[0][matchIndexer] = "UNDETECTED"
                relevancyOfTaskCheck[1][matchIndexer] = "UNDETECTED"
                irrelevancyOfTaskCheck[0][matchIndexer] = "UNDETECTED"
                irrelevancyOfTaskCheck[1][matchIndexer] = "UNDETECTED"
                fillWordsA(matchIndexer, j)
                retrieveWordsOfTweetsA(matchIndexer, j)
                matchIndexer++
                
            }
                //UNDETECTED Win by tweet 1, tweet 2 is irrelevant
            else if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetNovel1[j] == "true" && columnOfRelevant1[j] == "true" && columnOfRelevant2[j] == "false") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[0][matchIndexer] = "1"
                relevancyOfTaskCheck[0][matchIndexer] = "UNDETECTED"
                relevancyOfTaskCheck[1][matchIndexer] = "UNDETECTED"
                irrelevancyOfTaskCheck[0][matchIndexer] = "UNDETECTED"
                irrelevancyOfTaskCheck[1][matchIndexer] = "UNDETECTED"
                fillWordsA(matchIndexer, j)
                retrieveWordsOfTweetsA(matchIndexer, j)
                matchIndexer++
                
            }
                //Draw, both tweets are relevant
            else if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetsEqual[j] == "true" && columnOfRelevant1[j] == "true" && columnOfRelevant2[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[1][matchIndexer] = "1"
                fillWordsA(matchIndexer, j)
                retrieveWordsOfTweetsA(matchIndexer, j)
                matchIndexer++
                
            }
                //UNDETECTED Draw, tweet 1 is irrelevant
            else if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetsEqual[j] == "true" && columnOfRelevant1[j] == "false" && columnOfRelevant2[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[1][matchIndexer] = "1"
                relevancyOfTaskCheck[0][matchIndexer] = "UNDETECTED"
                relevancyOfTaskCheck[1][matchIndexer] = "UNDETECTED"
                irrelevancyOfTaskCheck[0][matchIndexer] = "UNDETECTED"
                irrelevancyOfTaskCheck[1][matchIndexer] = "UNDETECTED"
                fillWordsA(matchIndexer, j)
                retrieveWordsOfTweetsA(matchIndexer, j)
                matchIndexer++
                
            }
                //UNDETECTED Draw, tweet 2 is irrelevant
            else if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetsEqual[j] == "true" && columnOfRelevant1[j] == "true" && columnOfRelevant2[j] == "false") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[1][matchIndexer] = "1"
                relevancyOfTaskCheck[0][matchIndexer] = "UNDETECTED"
                relevancyOfTaskCheck[1][matchIndexer] = "UNDETECTED"
                irrelevancyOfTaskCheck[0][matchIndexer] = "UNDETECTED"
                irrelevancyOfTaskCheck[1][matchIndexer] = "UNDETECTED"
                fillWordsA(matchIndexer, j)
                retrieveWordsOfTweetsA(matchIndexer, j)
                matchIndexer++
                
            }
                //Lost
            else if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetNovel2[j] == "true" && columnOfRelevant1[j] == "true" && columnOfRelevant2[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[2][matchIndexer] = "1"
                fillWordsA(matchIndexer, j)
                retrieveWordsOfTweetsA(matchIndexer, j)
                matchIndexer++
                
            }
                //UNDETECTED Lost, tweet 1 is irrelevant.
            else if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetNovel2[j] == "true" && columnOfRelevant1[j] == "false" && columnOfRelevant2[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[2][matchIndexer] = "1"
                relevancyOfTaskCheck[0][matchIndexer] = "UNDETECTED"
                relevancyOfTaskCheck[1][matchIndexer] = "UNDETECTED"
                irrelevancyOfTaskCheck[0][matchIndexer] = "UNDETECTED"
                irrelevancyOfTaskCheck[1][matchIndexer] = "UNDETECTED"
                fillWordsA(matchIndexer, j)
                retrieveWordsOfTweetsA(matchIndexer, j)
                matchIndexer++
                
            }
                //UNDETECTED Lost, tweet 2 is irrelevant.
            else if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetNovel2[j] == "true" && columnOfRelevant1[j] == "true" && columnOfRelevant2[j] == "false") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[2][matchIndexer] = "1"
                relevancyOfTaskCheck[0][matchIndexer] = "UNDETECTED"
                relevancyOfTaskCheck[1][matchIndexer] = "UNDETECTED"
                irrelevancyOfTaskCheck[0][matchIndexer] = "UNDETECTED"
                irrelevancyOfTaskCheck[1][matchIndexer] = "UNDETECTED"
                fillWordsA(matchIndexer, j)
                retrieveWordsOfTweetsA(matchIndexer, j)
                matchIndexer++
                
            }
                //Worker detected both tweets as irrelevant
            else if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetIrrelevant1[j] == "true" && columnOfTweetIrrelevant2[j] == "true" && columnOfRelevant1[j] == "false" && columnOfRelevant2[j] == "false") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[0][matchIndexer] = "IRRELEVANT"
                matchResult[1][matchIndexer] = "IRRELEVANT"
                matchResult[2][matchIndexer] = "IRRELEVANT"
                relevancyOfTaskCheck[0][matchIndexer] = "0"
                relevancyOfTaskCheck[1][matchIndexer] = "0"
                irrelevancyOfTaskCheck[0][matchIndexer] = "1"
                irrelevancyOfTaskCheck[1][matchIndexer] = "1"
                fillWordsA(matchIndexer, j)
                retrieveWordsOfTweetsA(matchIndexer, j)
                matchIndexer++
            }
                //Worker detected tweet 1 as irrelevant
            else if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetIrrelevant1[j] == "true" && columnOfTweetIrrelevant2[j] == "false" && columnOfRelevant1[j] == "false" && columnOfRelevant2[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[0][matchIndexer] = "IRRELEVANT"
                matchResult[1][matchIndexer] = "IRRELEVANT"
                matchResult[2][matchIndexer] = "IRRELEVANT"
                relevancyOfTaskCheck[0][matchIndexer] = "0"
                relevancyOfTaskCheck[1][matchIndexer] = "1"
                irrelevancyOfTaskCheck[0][matchIndexer] = "1"
                irrelevancyOfTaskCheck[1][matchIndexer] = "0"
                fillWordsA(matchIndexer, j)
                retrieveWordsOfTweetsA(matchIndexer, j)
                matchIndexer++
            }
                //Worker detected tweet 1 as irrelevant, FALSE
            else if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetIrrelevant1[j] == "true" && columnOfTweetIrrelevant2[j] == "false" && columnOfRelevant1[j] == "true" && columnOfRelevant2[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[0][matchIndexer] = "IRRELEVANT"
                matchResult[1][matchIndexer] = "IRRELEVANT"
                matchResult[2][matchIndexer] = "IRRELEVANT"
                relevancyOfTaskCheck[0][matchIndexer] = "0"
                relevancyOfTaskCheck[1][matchIndexer] = "1"
                irrelevancyOfTaskCheck[0][matchIndexer] = "1"
                irrelevancyOfTaskCheck[1][matchIndexer] = "0"
                fillWordsA(matchIndexer, j)
                retrieveWordsOfTweetsA(matchIndexer, j)
                matchIndexer++
            }
                //Worker detected tweet 2 as irrelevant
            else if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetIrrelevant1[j] == "false" && columnOfTweetIrrelevant2[j] == "true" && columnOfRelevant1[j] == "true" && columnOfRelevant2[j] == "false") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[0][matchIndexer] = "IRRELEVANT"
                matchResult[1][matchIndexer] = "IRRELEVANT"
                matchResult[2][matchIndexer] = "IRRELEVANT"
                relevancyOfTaskCheck[0][matchIndexer] = "1"
                relevancyOfTaskCheck[1][matchIndexer] = "0"
                irrelevancyOfTaskCheck[0][matchIndexer] = "0"
                irrelevancyOfTaskCheck[1][matchIndexer] = "1"
                fillWordsA(matchIndexer, j)
                retrieveWordsOfTweetsA(matchIndexer, j)
                matchIndexer++
            }
                //Worker detected tweet 2 as irrelevant, FALSE
            else if (columnOfTID1[j] == tempnsIndexerChecker && columnOfTweetIrrelevant1[j] == "false" && columnOfTweetIrrelevant2[j] == "true" && columnOfRelevant1[j] == "false" && columnOfRelevant2[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[0][matchIndexer] = "IRRELEVANT"
                matchResult[1][matchIndexer] = "IRRELEVANT"
                matchResult[2][matchIndexer] = "IRRELEVANT"
                relevancyOfTaskCheck[0][matchIndexer] = "1"
                relevancyOfTaskCheck[1][matchIndexer] = "0"
                irrelevancyOfTaskCheck[0][matchIndexer] = "0"
                irrelevancyOfTaskCheck[1][matchIndexer] = "1"
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
            //Win by tweet 2, both tweets are relevant
            if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetNovel2[j] == "true" && columnOfRelevant1[j] == "true" && columnOfRelevant2[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[0][matchIndexer] = "1"
                fillWordsB(matchIndexer, j)
                retrieveWordsOfTweetsB(matchIndexer, j)
                matchIndexer++
            }
                //UNDETECTED Win by tweet 2, tweet 1 is irrelevant
            else if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetNovel2[j] == "true" && columnOfRelevant1[j] == "false" && columnOfRelevant2[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[0][matchIndexer] = "1"
                relevancyOfTaskCheck[0][matchIndexer] = "UNDETECTED"
                relevancyOfTaskCheck[1][matchIndexer] = "UNDETECTED"
                irrelevancyOfTaskCheck[0][matchIndexer] = "UNDETECTED"
                irrelevancyOfTaskCheck[1][matchIndexer] = "UNDETECTED"
                fillWordsB(matchIndexer, j)
                retrieveWordsOfTweetsB(matchIndexer, j)
                matchIndexer++
            }
                //UNDETECTED Win by tweet 2, tweet 2 is irrelevant
            else if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetNovel2[j] == "true" && columnOfRelevant1[j] == "true" && columnOfRelevant2[j] == "false") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[0][matchIndexer] = "1"
                relevancyOfTaskCheck[0][matchIndexer] = "UNDETECTED"
                relevancyOfTaskCheck[1][matchIndexer] = "UNDETECTED"
                irrelevancyOfTaskCheck[0][matchIndexer] = "UNDETECTED"
                irrelevancyOfTaskCheck[1][matchIndexer] = "UNDETECTED"
                fillWordsB(matchIndexer, j)
                retrieveWordsOfTweetsB(matchIndexer, j)
                matchIndexer++
            }
                //Draw, both tweets are relevant
            else if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetsEqual[j] == "true" && columnOfRelevant1[j] == "true" && columnOfRelevant2[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[1][matchIndexer] = "1"
                fillWordsB(matchIndexer, j)
                retrieveWordsOfTweetsB(matchIndexer, j)
                matchIndexer++
            }
                //UNDETECTED Draw, tweet 1 is irrelevant
            else if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetsEqual[j] == "true" && columnOfRelevant1[j] == "false" && columnOfRelevant2[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[1][matchIndexer] = "1"
                relevancyOfTaskCheck[0][matchIndexer] = "UNDETECTED"
                relevancyOfTaskCheck[1][matchIndexer] = "UNDETECTED"
                irrelevancyOfTaskCheck[0][matchIndexer] = "UNDETECTED"
                irrelevancyOfTaskCheck[1][matchIndexer] = "UNDETECTED"
                fillWordsB(matchIndexer, j)
                retrieveWordsOfTweetsB(matchIndexer, j)
                matchIndexer++
            }
                //UNDETECTED Draw, tweet 2 is irrelevant
            else if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetsEqual[j] == "true" && columnOfRelevant1[j] == "true" && columnOfRelevant2[j] == "false") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[1][matchIndexer] = "1"
                relevancyOfTaskCheck[0][matchIndexer] = "UNDETECTED"
                relevancyOfTaskCheck[1][matchIndexer] = "UNDETECTED"
                irrelevancyOfTaskCheck[0][matchIndexer] = "UNDETECTED"
                irrelevancyOfTaskCheck[1][matchIndexer] = "UNDETECTED"
                fillWordsB(matchIndexer, j)
                retrieveWordsOfTweetsB(matchIndexer, j)
                matchIndexer++
            }
                //Lost
            else if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetNovel1[j] == "true" && columnOfRelevant1[j] == "true" && columnOfRelevant2[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[2][matchIndexer] = "1"
                fillWordsB(matchIndexer, j)
                retrieveWordsOfTweetsB(matchIndexer, j)
                matchIndexer++
            }
                //UNDETECTED Lost, tweet 1 is irrelevant.
            else if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetNovel1[j] == "true" && columnOfRelevant1[j] == "false" && columnOfRelevant2[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[2][matchIndexer] = "1"
                relevancyOfTaskCheck[0][matchIndexer] = "UNDETECTED"
                relevancyOfTaskCheck[1][matchIndexer] = "UNDETECTED"
                irrelevancyOfTaskCheck[0][matchIndexer] = "UNDETECTED"
                irrelevancyOfTaskCheck[1][matchIndexer] = "UNDETECTED"
                fillWordsB(matchIndexer, j)
                retrieveWordsOfTweetsB(matchIndexer, j)
                matchIndexer++
            }
                //UNDETECTED Lost, tweet 2 is irrelevant.
            else if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetNovel1[j] == "true" && columnOfRelevant1[j] == "true" && columnOfRelevant2[j] == "false") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[2][matchIndexer] = "1"
                relevancyOfTaskCheck[0][matchIndexer] = "UNDETECTED"
                relevancyOfTaskCheck[1][matchIndexer] = "UNDETECTED"
                irrelevancyOfTaskCheck[0][matchIndexer] = "UNDETECTED"
                irrelevancyOfTaskCheck[1][matchIndexer] = "UNDETECTED"
                fillWordsB(matchIndexer, j)
                retrieveWordsOfTweetsB(matchIndexer, j)
                matchIndexer++
            }
                //Worker detected both tweets as irrelevant
            else if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetIrrelevant1[j] == "true" && columnOfTweetIrrelevant2[j] == "true" && columnOfRelevant1[j] == "false" && columnOfRelevant2[j] == "false") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[0][matchIndexer] = "IRRELEVANT"
                matchResult[1][matchIndexer] = "IRRELEVANT"
                matchResult[2][matchIndexer] = "IRRELEVANT"
                relevancyOfTaskCheck[0][matchIndexer] = "0"
                relevancyOfTaskCheck[1][matchIndexer] = "0"
                irrelevancyOfTaskCheck[0][matchIndexer] = "1"
                irrelevancyOfTaskCheck[1][matchIndexer] = "1"
                fillWordsB(matchIndexer, j)
                retrieveWordsOfTweetsB(matchIndexer, j)
                matchIndexer++
            }
                //Worker detected tweet 1 as irrelevant
            else if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetIrrelevant1[j] == "true" && columnOfTweetIrrelevant2[j] == "false" && columnOfRelevant1[j] == "false" && columnOfRelevant2[j] == "true") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[0][matchIndexer] = "IRRELEVANT"
                matchResult[1][matchIndexer] = "IRRELEVANT"
                matchResult[2][matchIndexer] = "IRRELEVANT"
                relevancyOfTaskCheck[0][matchIndexer] = "0"
                relevancyOfTaskCheck[1][matchIndexer] = "1"
                irrelevancyOfTaskCheck[0][matchIndexer] = "1"
                irrelevancyOfTaskCheck[1][matchIndexer] = "0"
                fillWordsB(matchIndexer, j)
                retrieveWordsOfTweetsB(matchIndexer, j)
                matchIndexer++
            }
                //Worker detected tweet 2 as irrelevant
            else if (columnOfTID2[j] == tempnsIndexerChecker && columnOfTweetIrrelevant1[j] == "false" && columnOfTweetIrrelevant2[j] == "true" && columnOfRelevant1[j] == "true" && columnOfRelevant2[j] == "false") {
                tempNameTID = checkTIDZeroes(nsIndexer)
                resultNames[0][matchIndexer] = tempNameTID
                resultNames[1][matchIndexer] = columnOfTaskID[j]
                matchResult[0][matchIndexer] = "IRRELEVANT"
                matchResult[1][matchIndexer] = "IRRELEVANT"
                matchResult[2][matchIndexer] = "IRRELEVANT"
                relevancyOfTaskCheck[0][matchIndexer] = "1"
                relevancyOfTaskCheck[1][matchIndexer] = "0"
                irrelevancyOfTaskCheck[0][matchIndexer] = "0"
                irrelevancyOfTaskCheck[1][matchIndexer] = "1"
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
*/
