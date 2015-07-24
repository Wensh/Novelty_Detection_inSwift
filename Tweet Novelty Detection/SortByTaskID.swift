//
//  SortByTaskID.swift
//  Tweet Novelty Detection
//
//  Created by Wenjie Zhong on 23-07-15.
//  Copyright (c) 2015 Wenjie Zhong. All rights reserved.
//

import Foundation

var columnOfTID = [String]()
var columnOfJobID = [String]()
var columnOfWin = [String]()
var columnOfDraw = [String]()
var columnOfLost = [String]()
var columnOfUserIrrelevant1 = [String]()
var columnOfUserIrrelevant2 = [String]()
var vectorsForCrowdTruth = Array(count: 38, repeatedValue: Array(count: arrayLength, repeatedValue: ""))

var word0 = [String]()
var word1 = [String]()
var word2 = [String]()
var word3 = [String]()
var word4 = [String]()
var word5 = [String]()
var word6 = [String]()
var word7 = [String]()
var word8 = [String]()
var word9 = [String]()
var word10 = [String]()
var word11 = [String]()
var word12 = [String]()
var word13 = [String]()
var word14 = [String]()
var word15 = [String]()
var word16 = [String]()
var word17 = [String]()
var word18 = [String]()
var word19 = [String]()
var word20 = [String]()
var word21 = [String]()
var word22 = [String]()
var word23 = [String]()
var word24 = [String]()
var word25 = [String]()
var word26 = [String]()
var word27 = [String]()

var selected0 = [String]()
var selected1 = [String]()
var selected2 = [String]()
var selected3 = [String]()
var selected4 = [String]()
var selected5 = [String]()
var selected6 = [String]()
var selected7 = [String]()
var selected8 = [String]()
var selected9 = [String]()
var selected10 = [String]()
var selected11 = [String]()
var selected12 = [String]()
var selected13 = [String]()
var selected14 = [String]()
var selected15 = [String]()
var selected16 = [String]()
var selected17 = [String]()
var selected18 = [String]()
var selected19 = [String]()
var selected20 = [String]()
var selected21 = [String]()
var selected22 = [String]()
var selected23 = [String]()
var selected24 = [String]()
var selected25 = [String]()
var selected26 = [String]()
var selected27 = [String]()

var forCombiningVectorsArrayA = [String]()
var forCombiningVectorsArrayB = [String]()
var forCombiningVectorsArrayC = [String]()
var forCombiningVectorsArrayD = [String]()
var forCombiningVectorsArrayE = [String]()
var forCombiningVectorsArrayF = [String]()
var forCombiningVectorsArrayG = [String]()
var forCombiningVectorsArray = [String]()
var postSplitVectorsForCrowdTruth = [String]()
var splitPointer = [Int]()

func generateVectorsForCrowdTruth() {
    var tweet = [Int: String]()
    let url = urlForScene("/Users/wenjiezhong/Dropbox/AI/CrowdTruth/CrowdFlower/Processing/combinedByUnitID.csv")
    var error: NSErrorPointer = nil
    if let csv = CSV(contentsOfURL: url, error: error) {
        // Rows
        let rows = csv.rows
        let headers = csv.headers
        
        // Columns
        let columns = csv.columns
        columnOfUnitID = columns["unitID"]!
        columnOfWorkerID = columns["workerID"]!
        columnOfTID = columns["tid"]!
        columnOfJobID = columns["jobid"]!
        columnOfWin = columns["win"]!
        columnOfDraw = columns["draw"]!
        columnOfLost = columns["lost"]!
        columnOfUserIrrelevant1 = columns["byUserIrrelevant1"]!
        columnOfUserIrrelevant2 = columns["byUserIrrelevant2"]!
        columnOfRelevant1 = columns["relevant1"]!
        columnOfRelevant2 = columns["relevant2"]!
        /*
        word0 = columns["word0"]!
        word1 = columns["word1"]!
        word2 = columns["word2"]!
        word3 = columns["word3"]!
        word4 = columns["word4"]!
        word5 = columns["word5"]!
        word6 = columns["word6"]!
        word7 = columns["word7"]!
        word8 = columns["word8"]!
        word9 = columns["word9"]!
        word10 = columns["word10"]!
        word11 = columns["word11"]!
        word12 = columns["word12"]!
        word13 = columns["word13"]!
        word14 = columns["word14"]!
        word15 = columns["word15"]!
        word16 = columns["word16"]!
        word17 = columns["word17"]!
        word18 = columns["word18"]!
        word19 = columns["word19"]!
        word20 = columns["word20"]!
        word21 = columns["word21"]!
        word22 = columns["word22"]!
        word23 = columns["word23"]!
        word24 = columns["word24"]!
        word25 = columns["word25"]!
        word26 = columns["word26"]!
        word27 = columns["word27"]!
        */
        selected0 = columns["selected0"]!
        selected1 = columns["selected1"]!
        selected2 = columns["selected2"]!
        selected3 = columns["selected3"]!
        selected4 = columns["selected4"]!
        selected5 = columns["selected5"]!
        selected6 = columns["selected6"]!
        selected7 = columns["selected7"]!
        selected8 = columns["selected8"]!
        selected9 = columns["selected9"]!
        selected10 = columns["selected10"]!
        selected11 = columns["selected11"]!
        selected12 = columns["selected12"]!
        selected13 = columns["selected13"]!
        selected14 = columns["selected14"]!
        selected15 = columns["selected15"]!
        selected16 = columns["selected16"]!
        selected17 = columns["selected17"]!
        selected18 = columns["selected18"]!
        selected19 = columns["selected19"]!
        selected20 = columns["selected20"]!
        selected21 = columns["selected21"]!
        selected22 = columns["selected22"]!
        selected23 = columns["selected23"]!
        selected24 = columns["selected24"]!
        selected25 = columns["selected25"]!
        selected26 = columns["selected26"]!
        selected27 = columns["selected27"]!
    }
    generateOutputForCrowdTruth()
}

func generateOutputForCrowdTruth() {
    var cwIndexer = 755035715
    var jCW = 0
    while cwIndexer <= 755035769 {
        while jCW < columnOfUnitID.count {
            if (columnOfUnitID[jCW] == String(cwIndexer)) {
                vectorsForCrowdTruth[0][jCW] = columnOfUnitID[jCW]
                vectorsForCrowdTruth[1][jCW] = columnOfWorkerID[jCW]
                vectorsForCrowdTruth[2][jCW] = columnOfWin[jCW]
                vectorsForCrowdTruth[3][jCW] = columnOfDraw[jCW]
                vectorsForCrowdTruth[4][jCW] = columnOfLost[jCW]
                vectorsForCrowdTruth[5][jCW] = columnOfUserIrrelevant1[jCW]
                vectorsForCrowdTruth[6][jCW] = columnOfUserIrrelevant2[jCW]
                vectorsForCrowdTruth[7][jCW] = columnOfRelevant1[jCW]
                vectorsForCrowdTruth[8][jCW] = columnOfRelevant2[jCW]
                vectorsForCrowdTruth[9][jCW] = selected0[jCW]
                vectorsForCrowdTruth[10][jCW] = selected0[jCW]
                vectorsForCrowdTruth[11][jCW] = selected1[jCW]
                vectorsForCrowdTruth[12][jCW] = selected2[jCW]
                vectorsForCrowdTruth[13][jCW] = selected3[jCW]
                vectorsForCrowdTruth[14][jCW] = selected4[jCW]
                vectorsForCrowdTruth[15][jCW] = selected5[jCW]
                vectorsForCrowdTruth[16][jCW] = selected6[jCW]
                vectorsForCrowdTruth[17][jCW] = selected7[jCW]
                vectorsForCrowdTruth[18][jCW] = selected8[jCW]
                vectorsForCrowdTruth[19][jCW] = selected9[jCW]
                vectorsForCrowdTruth[20][jCW] = selected10[jCW]
                vectorsForCrowdTruth[21][jCW] = selected11[jCW]
                vectorsForCrowdTruth[22][jCW] = selected12[jCW]
                vectorsForCrowdTruth[23][jCW] = selected13[jCW]
                vectorsForCrowdTruth[24][jCW] = selected14[jCW]
                vectorsForCrowdTruth[25][jCW] = selected15[jCW]
                vectorsForCrowdTruth[26][jCW] = selected16[jCW]
                vectorsForCrowdTruth[27][jCW] = selected17[jCW]
                vectorsForCrowdTruth[28][jCW] = selected18[jCW]
                vectorsForCrowdTruth[29][jCW] = selected19[jCW]
                vectorsForCrowdTruth[30][jCW] = selected20[jCW]
                vectorsForCrowdTruth[31][jCW] = selected21[jCW]
                vectorsForCrowdTruth[32][jCW] = selected22[jCW]
                vectorsForCrowdTruth[33][jCW] = selected23[jCW]
                vectorsForCrowdTruth[34][jCW] = selected24[jCW]
                vectorsForCrowdTruth[35][jCW] = selected25[jCW]
                vectorsForCrowdTruth[36][jCW] = selected26[jCW]
                vectorsForCrowdTruth[37][jCW] = selected27[jCW]
            }
            jCW++
        }
        cwIndexer++
        jCW = 0
    }
    combineVectorNamesToDocument()
    splitVectorsForCW()
}

func combineVectorNamesToDocument() {
    for i in 0..<columnOfUnitID.count {
        forCombiningVectorsArrayA.append("\(vectorsForCrowdTruth[0][i]),\(vectorsForCrowdTruth[1][i]),\(columnOfJobID[i]),\(columnOfTID[i]),\(vectorsForCrowdTruth[2][i]),\(vectorsForCrowdTruth[3][i]),\(vectorsForCrowdTruth[4][i]),\(vectorsForCrowdTruth[5][i]),\(vectorsForCrowdTruth[6][i])")
    }
    for i in 0..<columnOfUnitID.count {
        forCombiningVectorsArrayB.append("\(vectorsForCrowdTruth[7][i]),\(vectorsForCrowdTruth[8][i]),\(vectorsForCrowdTruth[9][i]),\(vectorsForCrowdTruth[10][i]),\(vectorsForCrowdTruth[11][i])")
    }
    for i in 0..<columnOfUnitID.count {
        forCombiningVectorsArrayC.append("\(vectorsForCrowdTruth[12][i]),\(vectorsForCrowdTruth[13][i]),\(vectorsForCrowdTruth[14][i]),\(vectorsForCrowdTruth[15][i]),\(vectorsForCrowdTruth[16][i])")
    }
    for i in 0..<columnOfUnitID.count {
        forCombiningVectorsArrayD.append("\(vectorsForCrowdTruth[17][i]),\(vectorsForCrowdTruth[18][i]),\(vectorsForCrowdTruth[19][i]),\(vectorsForCrowdTruth[20][i]),\(vectorsForCrowdTruth[21][i])")
    }
    for i in 0..<columnOfUnitID.count {
        forCombiningVectorsArrayE.append("\(vectorsForCrowdTruth[22][i]),\(vectorsForCrowdTruth[23][i]),\(vectorsForCrowdTruth[24][i]),\(vectorsForCrowdTruth[25][i]),\(vectorsForCrowdTruth[26][i])")
    }
    for i in 0..<columnOfUnitID.count {
        forCombiningVectorsArrayF.append("\(vectorsForCrowdTruth[27][i]),\(vectorsForCrowdTruth[28][i]),\(vectorsForCrowdTruth[29][i]),\(vectorsForCrowdTruth[30][i]),\(vectorsForCrowdTruth[31][i])")
    }
    for i in 0..<columnOfUnitID.count {
        forCombiningVectorsArrayG.append("\(vectorsForCrowdTruth[32][i]),\(vectorsForCrowdTruth[33][i]),\(vectorsForCrowdTruth[34][i]),\(vectorsForCrowdTruth[35][i]),\(vectorsForCrowdTruth[36][i]),\(vectorsForCrowdTruth[37][i])")
    }
    for i in 0..<columnOfUnitID.count {
        forCombiningVectorsArray.append("\(forCombiningVectorsArrayA[i]),\(forCombiningVectorsArrayB[i]),\(forCombiningVectorsArrayC[i]),\(forCombiningVectorsArrayD[i]),\(forCombiningVectorsArrayE[i]),\(forCombiningVectorsArrayF[i]),\(forCombiningVectorsArrayG[i])")
    }
    //saveToDocument(forCombiningVectorsArray, "combined")
}

func splitVectorsForCW() {
    var tempSplitArrayForCT = [String]()
    var j = 0
    var k = 0
    var unitIndexer = 0
    while k < columnOfUnitID.count-1 {
        while columnOfUnitID[j] == columnOfUnitID[j+1] {
            tempSplitArrayForCT.insert(forCombiningVectorsArray[j], atIndex: unitIndexer)
            j++
            unitIndexer++
            if j+1 == columnOfUnitID.count {break}
        }
        if j != columnOfUnitID.count {
            tempSplitArrayForCT.insert(forCombiningVectorsArray[j], atIndex: unitIndexer)
        }
        saveToDocument(tempSplitArrayForCT, "splitCombined\(k)")
        tempSplitArrayForCT.removeAll()
        unitIndexer=0
        k=j
        j++
    }
}



















