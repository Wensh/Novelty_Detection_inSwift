// memoized Levenshtein Distance
// description given here: http://programmingpraxis.com/2014/09/12/levenshtein-distance/

import Foundation

// memoize for a two parameter recursive function
func memoize<T1: Hashable, T2: Hashable, U>(body: ((T1, T2) -> U, T1, T2) -> U) -> ((T1, T2) -> U) {
    var memo = [T1: [T2: U]]()
    var result: ((T1, T2) -> U)!
    result = {
        (value1: T1, value2: T2) -> U in
        if let cached = memo[value1]?[value2] { return cached }
        
        let toCache = body(result, value1, value2)
        if memo[value1] == nil { memo[value1] = [:] }
        memo[value1]![value2] = toCache
        return toCache
    }
    return result
}

let levenshteinDistance = memoize {
    (levenshteinDistance: (String, String) -> Int, s1: String, s2: String) -> Int in
    if isEmpty(s1) { return count(s2) }
    if isEmpty(s2) { return count(s1) }
    
    // drop first letter of each string
    let s1Crop = s1[s1.startIndex.successor()..<s1.endIndex]
    let s2Crop = s2[s2.startIndex.successor()..<s2.endIndex]
    
    // if first characters are equal, continue with both cropped
    if s1[s1.startIndex] == s2[s2.startIndex] {
        return levenshteinDistance(s1Crop, s2Crop)
    }
    
    // otherwise find smallest of the three options
    let (c1, c2, c3) = (levenshteinDistance(s1Crop, s2), levenshteinDistance(s1, s2Crop), levenshteinDistance(s1Crop, s2Crop))
    return 1 + min(min(c1, c2), c3)
}

//levenshteinDistance("hill", "hilt")