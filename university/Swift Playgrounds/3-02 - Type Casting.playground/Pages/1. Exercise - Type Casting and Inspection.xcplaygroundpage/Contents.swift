/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
let collection: [Any] = [2.2, 1, "strings", 10.23, 9, true, "test", false]

print(collection)
//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for i in collection {
    switch i {
        case is Int: print("The integer has a value of \(i)")
        case is Double: print("The double has a value of \(i)")
        case is String: print("The string has a value of \(i)")
        case is Bool: print("The boolean has a value of \(i)")
    default: break
    }
}

//:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
let dictionary: [String: Any] = ["integer1": 1, "double1": 2.2, "string1": "2.2", "bolean1": true, "integer2": 10, "double2": 6.3, "string2": "strings", "bolean2": false]
print(dictionary)
//:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
var total: Double = 0

for (_, i) in dictionary {
    switch i {
        case is Int: total += Double(i as! Int)
        case is Double: total += i as! Double
        case is String: total += 1
        case is Bool: total += i as! Bool ? 2 : -3
    default: break
    }
}
print(total)
//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
var total2: Double = 0

for (_, i) in dictionary {
    switch i {
        case is Int: total2 += Double(i as! Int)
        case is Double: total2 += i as! Double
        case is String: if (Double(i as! String) != nil) {total2 +=  Double(i as! String)!}
    default: break
    }
}
print(total2)
/*:
page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
 */
