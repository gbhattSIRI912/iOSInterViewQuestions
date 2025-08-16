import UIKit

var greeting = "Hello, playground"

func genricsFunction<T>(age: T) {
    print("age: \(age)")
}
genricsFunction(age: "5")




