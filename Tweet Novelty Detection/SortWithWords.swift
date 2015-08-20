//
//  SortByTaskID.swift
//  Tweet Novelty Detection
//
//  Created by Wenjie Zhong on 23-07-15.
//  Copyright (c) 2015 Wenjie Zhong. All rights reserved.
//

import Foundation
var outputVectorForPythonCTA = [String]()
var outputVectorForPythonCTB = [String]()
var outputVectorForPythonCTC = [String]()
var outputVectorForPythonCTD = [String]()
var outputVectorForPythonCTE = [String]()
var outputVectorForPythonCTF = [String]()
var outputVectorForPythonCTG = [String]()
var outputVectorForPythonCT = [String]()

func generateVectorsForCrowdTruth2() {
    var tweet = [Int: String]()
    let url = urlForScene("/Users/wenjiezhong/Desktop/ProcessForCWMetrics/SplitMatchesForPython.csv")
    var error: NSErrorPointer = nil
    if let csv = CSV(contentsOfURL: url, error: error) {
        // Rows
        let rows = csv.rows
        let headers = csv.headers
        
        // Columns
        let columns = csv.columns
        //columnOfUnitID = columns["unitID"]!
        columnOfWorkerID = columns["workerID"]!
        columnOfTID = columns["tid"]!
        columnOfJobID = columns["jobid"]!
        columnOfWin = columns["win"]!
        columnOfDraw = columns["draw"]!
        columnOfLost = columns["lost"]!
        columnOfUserIrrelevant1 = columns["byUserIrrelevant1"]!
        columnOfUserIrrelevant2 = columns["byUserIrrelevant2"]!
        /*
        columnOfRelevant1 = columns["relevant1"]!
        columnOfRelevant2 = columns["relevant2"]!
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
    //generateOutputForCrowdTruth2()
    //createVectorForPythonCT()
    createVectorForPythonCTOana()
}

func createVectorForPythonCTOana() {
    var i = 0
    var j = 0
    while i < columnOfWorkerID.count {
        if i >= columnOfWorkerID.count-1 {break}
        outputVectorForPythonCTA.append("\(columnOfWorkerID[i]),t1_\(columnOfTID[i]),\(columnOfWin[i]),\(columnOfDraw[i]),\(columnOfLost[i]),\(columnOfUserIrrelevant1[i]),\(columnOfUserIrrelevant2[i])")
        
        outputVectorForPythonCTB.append("\(columnOfWorkerID[i]),t1_\(columnOfTID[i]),\(columnOfUserIrrelevant1[i]),\(columnOfUserIrrelevant2[i])")
        
        outputVectorForPythonCTC.append("\(columnOfWorkerID[i]),t1_\(columnOfTID[i]),\(selected0[i]),\(selected1[i]),\(selected2[i]),\(selected3[i]),\(selected4[i]),\(selected5[i])")
        outputVectorForPythonCTD.append("\(selected6[i]),\(selected7[i]),\(selected8[i]),\(selected9[i]),\(selected10[i]),\(selected11[i])\(selected12[i]),\(selected13[i]),\(selected14[i])")
        outputVectorForPythonCTE.append(",\(selected15[i]),\(selected16[i]),\(selected17[i]),\(selected18[i]),\(selected19[i]),\(selected20[i]),\(selected21[i]),\(selected22[i]),\(selected23[i])")
        outputVectorForPythonCTF.append("\(selected24[i]),\(selected25[i]),\(selected26[i]),\(selected27[i])")
        
        outputVectorForPythonCT.append("\(outputVectorForPythonCTC[j]),\(outputVectorForPythonCTD[j]),\(outputVectorForPythonCTE[j]),\(outputVectorForPythonCTF[j])")
        i += 2
        j++
        println(j)
    }
    saveToDocument(outputVectorForPythonCTA, "inputPythonMatch.csv")
    saveToDocument(outputVectorForPythonCTB, "inputPythonRelevancy.csv")
    saveToDocument(outputVectorForPythonCT, "inputPythonWordsTweet1.csv")
}
func createVectorForPythonCT() {
    var i = 0
    var j = 0
    while i < columnOfWorkerID.count {
        if i >= columnOfWorkerID.count-1 {break}
        outputVectorForPythonCTA.append("\(columnOfWorkerID[i]),\(columnOfTID[i])-\(columnOfTID[i+1]),\(columnOfWin[i]),\(columnOfDraw[i]),\(columnOfLost[i]),\(columnOfUserIrrelevant1[i]),\(columnOfUserIrrelevant2[i])")
        outputVectorForPythonCTB.append("\(selected0[i]),\(selected1[i]),\(selected2[i]),\(selected3[i]),\(selected4[i]),\(selected5[i]),\(selected6[i]),\(selected7[i]),\(selected8[i]),\(selected9[i]),\(selected10[i]),\(selected11[i])")
        outputVectorForPythonCTC.append("\(selected12[i]),\(selected13[i]),\(selected14[i]),\(selected15[i]),\(selected16[i]),\(selected17[i]),\(selected18[i]),\(selected19[i]),\(selected20[i]),\(selected21[i]),\(selected22[i]),\(selected23[i])")
        outputVectorForPythonCTD.append("\(selected24[i]),\(selected25[i]),\(selected26[i]),\(selected27[i]),\(columnOfWin[i+1]),\(columnOfDraw[i+1]),\(columnOfLost[i+1]),\(columnOfUserIrrelevant1[i+1]),\(columnOfUserIrrelevant2[i+1])")
        outputVectorForPythonCTE.append("\(selected0[i+1]),\(selected1[i+1]),\(selected2[i+1]),\(selected3[i+1]),\(selected4[i+1]),\(selected5[i+1]),\(selected6[i+1]),\(selected7[i+1]),\(selected8[i+1]),\(selected9[i+1]),\(selected10[i+1]),\(selected11[i+1])")
        outputVectorForPythonCTF.append("\(selected12[i+1]),\(selected13[i+1]),\(selected14[i+1]),\(selected15[i+1]),\(selected16[i+1]),\(selected17[i+1]),\(selected18[i+1]),\(selected19[i+1]),\(selected20[i+1]),\(selected21[i+1])")
        outputVectorForPythonCTG.append("\(selected22[i+1]),\(selected23[i+1]),\(selected24[i+1]),\(selected25[i+1]),\(selected26[i+1]),\(selected27[i+1])")
        outputVectorForPythonCT.append("\(outputVectorForPythonCTA[j]),\(outputVectorForPythonCTB[j]),\(outputVectorForPythonCTC[j]),\(outputVectorForPythonCTD[j]),\(outputVectorForPythonCTE[j]),\(outputVectorForPythonCTF[j]),\(outputVectorForPythonCTG[j])")
        i += 2
        j++
    }
    saveToDocument(outputVectorForPythonCT, "inputPython.csv")
}

func generateOutputForCrowdTruth2() {
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
                vectorsForCrowdTruth[9][jCW] = word0[jCW]
                vectorsForCrowdTruth[10][jCW] = selected0[jCW]
                vectorsForCrowdTruth[11][jCW] = word1[jCW]
                vectorsForCrowdTruth[12][jCW] = selected1[jCW]
                vectorsForCrowdTruth[13][jCW] = word2[jCW]
                vectorsForCrowdTruth[14][jCW] = selected2[jCW]
                vectorsForCrowdTruth[15][jCW] = word3[jCW]
                vectorsForCrowdTruth[16][jCW] = selected3[jCW]
                vectorsForCrowdTruth[17][jCW] = word4[jCW]
                vectorsForCrowdTruth[18][jCW] = selected4[jCW]
                vectorsForCrowdTruth[19][jCW] = word5[jCW]
                vectorsForCrowdTruth[20][jCW] = selected5[jCW]
                vectorsForCrowdTruth[21][jCW] = word6[jCW]
                vectorsForCrowdTruth[22][jCW] = selected6[jCW]
                vectorsForCrowdTruth[23][jCW] = word7[jCW]
                vectorsForCrowdTruth[24][jCW] = selected7[jCW]
                vectorsForCrowdTruth[25][jCW] = word8[jCW]
                vectorsForCrowdTruth[26][jCW] = selected8[jCW]
                vectorsForCrowdTruth[27][jCW] = word9[jCW]
                vectorsForCrowdTruth[28][jCW] = selected9[jCW]
                vectorsForCrowdTruth[29][jCW] = word10[jCW]
                vectorsForCrowdTruth[30][jCW] = selected10[jCW]
                vectorsForCrowdTruth[31][jCW] = word11[jCW]
                vectorsForCrowdTruth[32][jCW] = selected11[jCW]
                vectorsForCrowdTruth[33][jCW] = word12[jCW]
                vectorsForCrowdTruth[34][jCW] = selected12[jCW]
                vectorsForCrowdTruth[35][jCW] = word13[jCW]
                vectorsForCrowdTruth[36][jCW] = selected13[jCW]
                vectorsForCrowdTruth[37][jCW] = word14[jCW]
                vectorsForCrowdTruth[38][jCW] = selected14[jCW]
                vectorsForCrowdTruth[39][jCW] = word15[jCW]
                vectorsForCrowdTruth[40][jCW] = selected15[jCW]
                vectorsForCrowdTruth[41][jCW] = word16[jCW]
                vectorsForCrowdTruth[42][jCW] = selected16[jCW]
                vectorsForCrowdTruth[43][jCW] = word17[jCW]
                vectorsForCrowdTruth[44][jCW] = selected17[jCW]
                vectorsForCrowdTruth[45][jCW] = word18[jCW]
                vectorsForCrowdTruth[46][jCW] = selected18[jCW]
                vectorsForCrowdTruth[47][jCW] = word19[jCW]
                vectorsForCrowdTruth[48][jCW] = selected19[jCW]
                vectorsForCrowdTruth[49][jCW] = word20[jCW]
                vectorsForCrowdTruth[50][jCW] = selected20[jCW]
                vectorsForCrowdTruth[51][jCW] = word21[jCW]
                vectorsForCrowdTruth[52][jCW] = selected21[jCW]
                vectorsForCrowdTruth[53][jCW] = word22[jCW]
                vectorsForCrowdTruth[54][jCW] = selected22[jCW]
                vectorsForCrowdTruth[55][jCW] = word23[jCW]
                vectorsForCrowdTruth[56][jCW] = selected23[jCW]
                vectorsForCrowdTruth[57][jCW] = word24[jCW]
                vectorsForCrowdTruth[58][jCW] = selected24[jCW]
                vectorsForCrowdTruth[59][jCW] = word25[jCW]
                vectorsForCrowdTruth[60][jCW] = selected25[jCW]
                vectorsForCrowdTruth[61][jCW] = word26[jCW]
                vectorsForCrowdTruth[62][jCW] = selected26[jCW]
                vectorsForCrowdTruth[63][jCW] = word27[jCW]
                vectorsForCrowdTruth[64][jCW] = selected27[jCW]
            }
            jCW++
        }
        cwIndexer++
        jCW = 0
    }
    combineVectorNamesToDocument2()
    combineVectorsOfTweets2()
    //splitVectorsForCW2()
}

func combineVectorNamesToDocument2() {
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
        forCombiningVectorsArrayG.append("\(vectorsForCrowdTruth[32][i]),\(vectorsForCrowdTruth[33][i]),\(vectorsForCrowdTruth[34][i]),\(vectorsForCrowdTruth[35][i]),\(vectorsForCrowdTruth[36][i])")
    }
    for i in 0..<columnOfUnitID.count {
        forCombiningVectorsArrayH.append("\(vectorsForCrowdTruth[37][i]),\(vectorsForCrowdTruth[38][i]),\(vectorsForCrowdTruth[39][i]),\(vectorsForCrowdTruth[40][i]),\(vectorsForCrowdTruth[41][i])")
    }
    for i in 0..<columnOfUnitID.count {
        forCombiningVectorsArrayI.append("\(vectorsForCrowdTruth[42][i]),\(vectorsForCrowdTruth[43][i]),\(vectorsForCrowdTruth[44][i]),\(vectorsForCrowdTruth[45][i]),\(vectorsForCrowdTruth[46][i])")
    }
    for i in 0..<columnOfUnitID.count {
        forCombiningVectorsArrayJ.append("\(vectorsForCrowdTruth[47][i]),\(vectorsForCrowdTruth[48][i]),\(vectorsForCrowdTruth[49][i]),\(vectorsForCrowdTruth[50][i]),\(vectorsForCrowdTruth[51][i])")
    }
    for i in 0..<columnOfUnitID.count {
        forCombiningVectorsArrayK.append("\(vectorsForCrowdTruth[52][i]),\(vectorsForCrowdTruth[53][i]),\(vectorsForCrowdTruth[54][i]),\(vectorsForCrowdTruth[55][i]),\(vectorsForCrowdTruth[56][i])")
    }
    for i in 0..<columnOfUnitID.count {
        forCombiningVectorsArrayL.append("\(vectorsForCrowdTruth[57][i]),\(vectorsForCrowdTruth[58][i]),\(vectorsForCrowdTruth[59][i]),\(vectorsForCrowdTruth[60][i]),\(vectorsForCrowdTruth[61][i])")
    }
    for i in 0..<columnOfUnitID.count {
        forCombiningVectorsArrayM.append("\(vectorsForCrowdTruth[62][i]),\(vectorsForCrowdTruth[63][i]),\(vectorsForCrowdTruth[64][i])")
    }
    for i in 0..<columnOfUnitID.count {
        forCombiningVectorsArray.append("\(forCombiningVectorsArrayA[i]),\(forCombiningVectorsArrayB[i]),\(forCombiningVectorsArrayC[i]),\(forCombiningVectorsArrayD[i]),\(forCombiningVectorsArrayE[i]),\(forCombiningVectorsArrayF[i]),\(forCombiningVectorsArrayG[i]),\(forCombiningVectorsArrayH[i]),\(forCombiningVectorsArrayI[i]),\(forCombiningVectorsArrayJ[i]),\(forCombiningVectorsArrayK[i]),\(forCombiningVectorsArrayL[i]),\(forCombiningVectorsArrayM[i])")
    }
    //saveToDocument(forCombiningVectorsArray, "combined")
}

func combineVectorsOfTweets2() {
    var tempSplitArrayForCT = [String]()
    var outputSplitArrayForCT = [String]()
    var outputArrayCombined = [String]()
    var j = 0
    var k = 0
    var unitIndexer = 0
    var csIndex = 0
    var csIndex2 = 15
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
        while csIndex < 15 {
            outputSplitArrayForCT.insert("\(tempSplitArrayForCT[csIndex]),\(tempSplitArrayForCT[csIndex2])", atIndex: csIndex)
            csIndex++
            csIndex2++
        }
        outputArrayCombined += outputSplitArrayForCT
        //saveToDocument(outputSplitArrayForCT, "splitCombined\(k).csv")
        tempSplitArrayForCT.removeAll()
        outputSplitArrayForCT.removeAll()
        unitIndexer=0
        k=j
        j++
        csIndex = 0
        csIndex2 = 15
    }
    saveToDocument(outputArrayCombined, "combined.csv")
}


func splitVectorsForCW2() {
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
        saveToDocument(tempSplitArrayForCT, "splitCombined\(k).csv")
        tempSplitArrayForCT.removeAll()
        unitIndexer=0
        k=j
        j++
    }
}



















