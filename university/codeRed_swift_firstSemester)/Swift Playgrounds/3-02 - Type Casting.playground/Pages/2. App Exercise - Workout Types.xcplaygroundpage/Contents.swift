/*:
## App Exercise - Workout Types

 >These exercises reinforce Swift concepts in the context of a fitness tracking app.

 You fitness tracking app may allow users to track different kinds of workouts. When architecting the app, you may decide to have a `Workout` base class from which other types of workout classes inherit. Below are three classes. `Workout` is the base class with `time` and `distance` properties, and `Run` and `Swim` are subclasses that add more specific properties to the `Workout` class.

 Also provided is a `workouts` array that represents a log of past workouts. You'll use these classes and the array for the exercises below.
 */
class Workout {
    let time: Double
    let distance: Double

    init(time: Double, distance: Double) {
        self.time = time
        self.distance = distance
    }
}

class Run: Workout {
    let cadence: Double

    init(cadence: Double, time: Double, distance: Double) {
        self.cadence = cadence
        super.init(time: time, distance: distance)
    }
}

class Swim: Workout {
    let stroke: String

    init(stroke: String, time: Double, distance: Double) {
        self.stroke = stroke
        super.init(time: time, distance: distance)
    }
}

var workouts: [Workout] = [
    Run(cadence: 80, time: 1200, distance: 4000),
    Swim(stroke: "Freestyle", time: 32.1, distance: 50),
    Swim(stroke: "Butterfly", time: 36.8, distance: 50),
    Swim(stroke: "Freestyle", time: 523.6, distance: 500),
    Run(cadence: 90, time: 358.9, distance: 1600)
]
//:  Write simple functions called `describeRun(runningWorkout:)` and `describeSwim(swimmingWorkout:)` that take a `Run` object and a `Swim` object, respectively. Neither should return values. Each function should print a description of the workout, including the run's cadence or the swim's stroke. Time is represented in seconds, distance is represented in meters, and cadence is represented in steps per minute.
func describeRun(runningWorkout: Run) {
    print("Distance: \(runningWorkout.distance) meters; time: \(runningWorkout.time) seconds; Cadence: \(runningWorkout.cadence) steps per minute")
}

func describeSwim(swimmingWorkout: Swim) {
    print("Distance: \(swimmingWorkout.distance) meters; time: \(swimmingWorkout.time) seconds; Stroke: \(swimmingWorkout.stroke)")
}

//:  Now loop through each workout in `workouts` and, using type casting, call either `describeRun(runningWorkout:)` or `describeSwim(swimmingWorkout:)` on each. Observe what is printed to the console.
for workout in workouts {
    if workout is Run {
        describeRun(runningWorkout: workout as! Run)
    }
    if workout is Swim {
        describeSwim(swimmingWorkout: workout as! Swim)
    }
}

/*:
[Previous](@previous)  |  page 2 of 2
 */
