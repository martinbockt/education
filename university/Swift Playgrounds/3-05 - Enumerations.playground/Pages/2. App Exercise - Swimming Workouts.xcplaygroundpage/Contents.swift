/*:
## App Exercise - Swimming Workouts

 >These exercises reinforce Swift concepts in the context of a fitness tracking app.

 Previous app exercises have introduced the idea that your fitness tracking app may allow users to track swimming workouts. Create a `SwimmingWorkout` struct below with properties for `distance`, `time`, and `stroke`. `distance` and `time` should be of type `Double` and will represent distance in meters and time in seconds, and `stroke` should be of type `String`.
 */
struct SwimmingWorkout {
    static var freestyleWorkouts: [SwimmingWorkout] = []
    static var butterflyWorkouts: [SwimmingWorkout] = []
    static var backstrokeWorkouts: [SwimmingWorkout] = []
    static var breaststrokeWorkouts: [SwimmingWorkout] = []

    
    let distance: Double
    let time: Double
    enum Stroke {
        case freestyle, butterfly, backstroke, breaststroke
    }
    let stroke: Stroke
    
    func save() {
        switch stroke {
        case .freestyle: SwimmingWorkout.freestyleWorkouts.append(self)
        case .butterfly: SwimmingWorkout.butterflyWorkouts.append(self)
        case .backstroke: SwimmingWorkout.backstrokeWorkouts.append(self)
        case .breaststroke: SwimmingWorkout.breaststrokeWorkouts.append(self)
        }
    }
}

//:  Allowing `stroke` to be of type `String` isn't very type-safe. Inside the `SwimmingWorkout` struct, create an enum called `Stroke` that has cases for `freestyle`, `butterfly`, `backstroke`, and `breaststroke`. Change the type of `stroke` from `String` to `Stroke`. Create two instances of `SwimmingWorkout` objects.
let swimmingWorkout1 = SwimmingWorkout(distance: 300, time: 10, stroke: .freestyle)
let swimmingWorkout2 = SwimmingWorkout(distance: 250, time: 12, stroke: .backstroke)

//:  Now imagine you want to log swimming workouts separately based on the swimming stroke. You might use arrays as static variables on `SwimmingWorkout` for this. Add four static variables, `freestyleWorkouts`, `butterflyWorkouts`, `backstrokeWorkouts`, and `breaststrokeWorkouts`, to `SwimmingWorkout` above. Each should be of type `[SwimmingWorkout]` and should default to empty arrays.


//:  Now add an instance method to `SwimmingWorkout` called `save` that takes no parameters and has no return value. This method will add its instance to the static array on `SwimmingWorkout` that corresponds to its swimming stroke. Inside `save` write a switch statement that switches on the instance's `stroke` property, and appends `self` to the proper array. Call save on the two instances of `SwimmingWorkout` that you created above, and then print the array(s) to which they should have been added to see if your `save()` method works properly.
swimmingWorkout1.save()
swimmingWorkout2.save()

print(SwimmingWorkout.freestyleWorkouts)
print(SwimmingWorkout.butterflyWorkouts)
print(SwimmingWorkout.backstrokeWorkouts)
print(SwimmingWorkout.breaststrokeWorkouts)
/*:
[Previous](@previous)  |  page 2 of 2
 */
