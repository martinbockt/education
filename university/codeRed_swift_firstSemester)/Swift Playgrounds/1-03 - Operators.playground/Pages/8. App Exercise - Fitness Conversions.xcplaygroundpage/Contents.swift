/*:
## App Exercise - Converting Types

 >These exercises reinforce Swift concepts in the context of a fitness tracking app.

 If you completed the Fitness Calculations exercise, you calculated the percent of the daily step goal that a user has achieved. However, you did this by having `steps` be of type `Double`. But you can't really track a partial step, so `steps` should probably be of type `Int`. Go ahead and declare `steps` as type `Int` and give it a value between 500 and 6,000. Then declare `goal` as type `Int` and set it equal to 10,000.

 Now create a constant `percentOfGoal` of type `Double` that equals the percent of the goal that has been reached so far. You'll need to convert your constants of type `Int` to be of type `Double` in your calculation.
 */
let steps:Int = 521
let goal:Int = 10_000
let percentOfGoal:Double = (Double(steps)/Double(goal)) * 100
/*:
[Previous](@previous)  |  page 8 of 8
 */
