/*:
## App Exercise - Pacing

 >These exercises reinforce Swift concepts in the context of a fitness tracking app.

 In previous app exercises you've written code to help users with run pacing. You decide that you could use a dictionary to let users store different paces that they regularly run at or do interval training with.

 Create a dictionary `paces` of type [String: Double] and assign it a dictionary literal with "Easy", "Medium", and "Fast" keys corresponding to values of 10.0, 8.0, and 6.0. These numbers correspond to mile pace in minutes. Print the dictionary.
 */
var paces: [String: Double] = ["Easy": 10.0, "Medium": 8.0, "Fast": 6.0]
print(paces)
//:  Add a new key/value pair to the dictionary. The key should be "Sprint" and the value should be 4.0. Print the dictionary.
paces["Sprint"] = 4.0
print(paces)
//:  Imagine the user in question gets faster over time and decides to update his/her pacing on runs. Update the values of "Medium" and "Fast" to 7.5 and 5.8, respectively. Print the dictionary.
//paces["Medium"] = 7.5
//paces["Fast"] = 5.8
paces.updateValue(7.5, forKey: "Medium")
paces.updateValue(5.8, forKey: "Fast")
print(paces)
//:  Imagine the user in question decides not to store "Sprint" as one his/her regular paces. Remove "Sprint" from the dictionary. Print the dictionary.
paces.removeValue(forKey: "Sprint")
print(paces)
//:  When a user chooses a pace, you want the app to print a statement stating that it will keep him/her on pace. Imagine a user chooses "Medium." Accessing the value from the dictionary, print a statement saying "Okay! I'll keep you at a <INSERT PACE VALUE HERE> minute mile pace."
if let mediumPace = paces["Medium"] {
    print("Okay! I'll keep you at a \(mediumPace) minute mile pace.")
}
/*:
[Previous](@previous)  |  page 4 of 4
 */
