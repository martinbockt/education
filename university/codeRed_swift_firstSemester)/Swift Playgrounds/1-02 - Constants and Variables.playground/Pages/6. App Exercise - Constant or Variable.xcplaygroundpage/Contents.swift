/*:
## App Exercise - Fitness Tracker: Constant or Variable?
 
 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 There are all sorts of things that a fitness tracking app needs to keep track of in order to display the right information to the user. Similar to the last exercise, declare either a constant or a variable for each of the following items, and assign each a sensible value. Be sure to use proper naming conventions.
 
- Name: The user's name
- Age: The user's age
- Number of steps taken today: The number of steps that a user has taken today
- Goal number of steps: The user's goal for number of steps to take each day
- Average heart rate: The user's average heart rate over the last 24 hours
 */
let name = "Martin Bock"
print("The person should have a fixed name, but if I want to give the option to change the name afterwards, I also could use a variable")
var age = 21
print("each year the person get older, thats why the age gets also updated each year and it needs to be a variable")
var steps = 20
print("the app is supposed to track the steps, therefore the value of steps is going to change and needs to be a variable")
let stepsGoal = 10_000
print("the goal is fixed to 10000 therefore its a constant, but if the person should be able to change the value it also could be a variable")
var heartRate = 85
print("the average heart rate will change over time, therefore it's a variable")
/*:
 Now go back and add a line after each constant or variable declaration. On those lines, print a statement explaining why you chose to declare the piece of information as a constant or variable.
 
[Previous](@previous)  |  page 6 of 10  |  [Next: Exercise - Types and Type Safety](@next)
 */
