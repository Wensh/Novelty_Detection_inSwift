//Check if person has his or hers own wikipage.

import Cocoa
import Foundation

var nameOfTwitterUser = "Johan_Cruyff"
var sparqlRequestPrsonOnDBpedia = "http://dbpedia.org/sparql?default-graph-uri=http%3A%2F%2Fdbpedia.org&query=select+distinct+%3FConcept+where+%7B%0D%0Adbpedia%3A"+nameOfTwitterUser+"+rdf%3Atype+%3FConcept%0D%0AFILTER+regex%28%3FConcept%2C+%22Person%22%29%0D%0A%7D+&format=application%2Fsparql-results%2Bjson&timeout=30000&debug=on"

var longurl = String(contentsOfURL: NSURL(string: sparqlRequestPrsonOnDBpedia)!, encoding: NSUTF8StringEncoding, error: nil)

/*
if longurl!.rangeOfString("\"http://dbpedia.org/ontology/Person\"") != nil{
    println("exists")
}
else {
    println("doesn't exist")
}
*/