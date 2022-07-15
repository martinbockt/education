/*:
## Exercise - Create Functions

 Write a function called `introduceMyself` that prints a brief introduction of yourself. Call the function and observe the printout.
 */
func introduceMyself(_ name: String) {
    print("My name is \(name)")
}
introduceMyself("Martin")
//:  Write a function called `magicEightBall` that generates a random number and then uses either a switch statement or if-else-if statements to print different responses based on the random number generated. `let randomNum = Int.random(in: 0...4)` will generate a random number from 0 to 4, after which you can print different phrases corresponding to the number generated. Call the function multiple times and observe the different printouts.
import Foundation
func magicEightBall() -> String {
    let randomNum = Int.random(in: 0...4)
    switch randomNum {
    case 0: return "Number 0"
    case 1: return "Number 1"
    case 2: return "Number 2"
    case 3: return "Number 3"
    case 4: return "Number 4"
    default:
        return ""
    }
}
for _ in 0...20 {
    print(magicEightBall())
}
/*:
page 1 of 6  |  [Next: App Exercise - A Functioning App](@next)
 */
