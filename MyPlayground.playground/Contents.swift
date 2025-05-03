import UIKit

/*//Given a string, reverse it without using the built-in reversed() method.
var greeting = "Hello, playground"
var reverse = ""
for i in greeting {
    reverse = String(i) + reverse
}
print(reverse)

//Given a string, return the first non-repeating character. If all characters repeat, return nil.

func firstNonRepeatingChar(_ str: String) -> Character? {
    var charCount: [Character: Int] = [:]
    
    for char in str {
        charCount[char, default: 0] += 1
    }
    
    for char in str {
        if charCount[char] == 1 {
            return char
        }
    }
    
    return nil
}
print(firstNonRepeatingChar("abacabad"))
print(firstNonRepeatingChar("aabbcc"))

//Given two sorted arrays, merge them into a single sorted array.
func mergeSortedArrays(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
    var result = [Int]()
    var i = 0, j = 0
    
    while i < arr1.count && j < arr2.count {
        if arr1[i] < arr2[j] {
            result.append(arr1[i])
            i += 1
        } else {
            result.append(arr2[j])
            j += 1
        }
    }
    
    while i < arr1.count {
        result.append(arr1[i])
        i += 1
    }
    
    while j < arr2.count {
        result.append(arr2[j])
        j += 1
    }
    
    return result
}

print(mergeSortedArrays([1, 3, 5], [2, 4, 6]))*/

// MARK: - calsses vs Struct
//Class
class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
}
let person1 = Person(name: "john")
print("<<<<<<<<<<Example of Class for person1 \(person1.name)")
let person2 = Person(name: "gaurav")
print("<<<<<<<Example of Class for person2 \(person1.name)")
//MARK: - Conclusion for class:
/*1. Classes are reference types
 2. Classes support inheritance
 3. classes support both init (initializer) and deinit (deinitializer).
 */

//Struct
struct personStruct {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func funName() {
           print("name: \(name)")
       }
}
let personStru1 = personStruct(name: "kamal")
print("struct example>>>>>\(personStru1.name)")

let personStru2 = personStruct(name: "Saif")
print("struct example2>>>>>\(personStru2.name)")

//MARK: - Conclusion for Struct:
/*
 1. Structs are value types
 2. Struct does not support inheritance
 3. structs only support init but do not have deinit because they are value types
 */

// MARK: - Let vs Var
/*
 Let:
 1. The value cannot be changed after initialization.
 2. Compile-time safety
 3. Constant
 
 Example:
 let pi = 3.14159
 pi = 3.14 // Error: Cannot assign to value: 'pi' is a 'let' constant
 
 Var:
 1. The value can be changed after initialization.
 2. Used for values that change during execution
 3. variable
 
 Example:
 var age = 25
 age = 30  // ✅ Allowed: 'age' is mutable
 print(age)
 
 */

//Mark: - Access Modifire:- Swift provides five access control levels to restrict access to code entities like classes, structs, properties, and methods. These define where and how a piece of code can be accessed

/* Internal(Default), public, Private, fileprivate, open
 
 Internal(Default):- Accessible within the same module (project) but not from another module
 public:- Accessible from anywhere, including other modules but cannot be subclassed/overridden outside the module
 Private:- Accessible only within the same class/struct/extension
 fileprivate:- Accessible only within the same file where it’s declared
 open:- Accessible from anywhere, including other modules and allows subclassing & overriding
 */

//MARK: - Store and Computed Property
/*
 Store Properties: - Store property store value, Store a constant or variable value as part of an instance, Available in classes and structs.
 Example:-
 struct Car {
 var model: String  // Mutable stored property
 let year: Int      // Immutable stored property
}
 
 Computed Properties: - Do not store a value but instead calculate a value dynamically, Use a getter to return a value and an optional setter to modify related properties.
 
 Example:
 struct Rectangle {
     var width: Double
     var height: Double
     
     var area: Double {  // Computed property
         return width * height
     }
 }

 let rect = Rectangle(width: 5, height: 10)
 print(rect.area)
 
 
 */

// MARK: - Property observer
/*
 Property observers let you monitor and respond to changes in a property's value.
 
 1. willSet:- Called before the value changes.
 2. didSet:- Called after the value changes.
 
 Example:-
 class PersonAge {
     var age: Int = 0 {
         willSet(newAge) {
             print("Age is about to change from \(age) to \(newAge)")
         }
         didSet {
             print("Age changed from \(oldValue) to \(age)")
         }
     }
 }

 let personAge = PersonAge()
 personAge.age = 25
 */

// MARK: - Enum:-
/*
 group of related values
 
 Example: -
 enum enumName {
 case a:
 case b:
 let today = enumName.a
 }
 */

// MARK: - Weak, strong and Unowned
/*
 Weak:- A weak reference does not retain the object, meaning it does not increase the object's reference count.
 -: Weak references can become nil when the referenced object is deallocated.
 Example:-
 class Car {
     var model: String
     init(model: String) {
         self.model = model
     }
 }

 class Driver {
     var name: String
     weak var car: Car?  // Weak reference to avoid retain cycle
     
     init(name: String) {
         self.name = name
     }
 }

 var car: Car? = Car(model: "Tesla")
 var driver: Driver? = Driver(name: "John")
 driver?.car = car

 car = nil  // Driver's reference to car becomes nil automatically

 
 Strong:- When one object holds a strong reference to another object, the referenced object is kept in memory as long as the reference exists.
 -: If a strong reference is used, the reference count of the object increases by 1. When the reference is released, the count goes down.
 
 Example:-
 class Person {
     var name: String
     
     init(name: String) {
         self.name = name
     }
 }

 var person1: Person? = Person(name: "John")
 var person2 = person1  // Strong reference

 // Both person1 and person2 now strongly reference the same Person object
 person1 = nil  // The object is not deallocated because person2 still holds a reference to it

 
 Unowned:- An unowned reference is similar to a weak reference, but with a key difference: it assumes the referenced object will not be deallocated while the reference is still in use.
 Example:-
 class Person {
     var name: String
     var bestFriend: Person?
     
     init(name: String) {
         self.name = name
     }
 }

 class BestFriend {
     var name: String
     unowned var person: Person  // Unowned reference to avoid retain cycle
     
     init(name: String, person: Person) {
         self.name = name
         self.person = person
     }
 }

 var john: Person? = Person(name: "John")
 var jane: BestFriend? = BestFriend(name: "Jane", person: john!)

 john?.bestFriend = jane

 john = nil  // This will deallocate "John" and cause a crash if we access `jane.person`

 */

//MARK: - Singleton Pattern: -
/*
 Singleton Pattern: - There is only one instance of the class in the entire application.
 Global Access: The instance can be accessed globally via a static property or method.
 
 Example:-
 class DatabaseManager {
     // 1. Create a static constant for the shared instance
     static let shared = DatabaseManager()
 }
 */

// MARK: - Generics:- Generics allow you to write flexible, reusable code that works with any type while still maintaining type safety. They enable you to write functions, classes, structures, and enums that can work with any type, while still maintaining strong type safety.
/*
 Generic function
 func printElement<T>(element: T) {
     print(element)
 }
 
 
 */
// MARK: - Lazy:- The value of the property is not calculated or initialized until it's accessed for the first time.
// : lazy can only be applied to variables (var), not constants (let).

// MARK: - Defer: - Executes code just before leaving the current scope, used mainly for cleanup tasks (e.g., releasing resources) and ensuring cleanup happens even with early returns or errors.

// MARK: - App States in the Life Cycle
/*
 Not Running: The app is not launched or has been terminated by the system or user.
 
 Inactive: The app is running but not receiving user input (e.g., when an incoming call appears).
 -: Temporary state before entering the foreground or background.
 
 Active (Foreground Running):- The app is running and interacting with the user.
 :- Most of the app’s functionality is executed in this state.
 
 Background:- The app is running in the background but not visible to the user.
 
 Suspended:- The app is in memory but not executing any code.
 
 */

// MARK: - UIApplicationDelegate Methods
/*
 application(_:didFinishLaunchingWithOptions:): Called when the app is launched. Used for initial setup.
 
 applicationDidBecomeActive(_:): Called when the app moves from inactive to active state.
 
 applicationWillResignActive(_:): Called when the app is about to move from active to inactive state (e.g., receiving a call)
 
 applicationDidEnterBackground(_:): Called when the app enters the background. Used for saving data, releasing resources, etc.
 
 applicationWillEnterForeground(_:): Called when the app is transitioning from background to active.
 
 applicationWillTerminate(_:): Called when the app is about to terminate. Used for last-minute cleanups.
 */

// MARK: - SceneDelegate (iOS 13+)
/*
 scene(_:willConnectTo:options:): Called when a new scene (UI window) is created.
 
 sceneDidBecomeActive(_:): Scene becomes active and interactive
 
 sceneWillResignActive(_:): Scene is about to move to the background.
 
 sceneDidEnterBackground(_:): Scene has moved to the background. Used to release resources.
 
 sceneWillEnterForeground(_:): Scene is about to enter the foreground.
 */
// MARK: - What is ARC and retain cycle
/*
 Automatic Reference Counting (ARC) is a memory management system in Swift that automatically tracks and manages the app’s memory usage. It works by keeping track of strong references to objects and deallocating them when no references remain.
 How ARC Works:
 1. When you create an instance of a class, ARC allocates memory for it.
 2. Each instance has a reference count, which increases when a new reference to it is created.
 3. When references are removed (set to nil), the reference count decreases.
 4. When the reference count reaches zero, ARC automatically deallocates the object.

 */
class PersonARC {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is initialized")
    }
    
    deinit {
        print("\(name) is deinitialized")
    }
}

// Creating an instance
var personArc1: PersonARC? = PersonARC(name: "Gaurav")

// Removing reference
personArc1 = nil  // "Gaurav is deinitialized"


// MARK: - Retain Cycle (Memory Leak)
/*
 A retain cycle (or strong reference cycle) occurs when two objects strongly reference each other, preventing ARC from deallocating them. This leads to a memory leak because the objects stay in memory even if they are no longer needed.
 
 */
class Person_Memory_Leak {
    var car: Car?
    deinit { print("Person deallocated") }
}

class Car {
    var owner: Person_Memory_Leak?
    deinit { print("Car deallocated") }
}

var personMemory: Person_Memory_Leak? = Person_Memory_Leak()
var car: Car? = Car()

personMemory?.car = car
car?.owner = personMemory

// Setting to nil (Memory Leak: Objects are not deallocated)
personMemory = nil
car = nil

// MARK: - Closures in Swift

/*
 A closure in Swift is a self-contained block of code that can be passed around and executed later. Closures are similar to functions but can capture and store references to variables and constants from their surrounding context.
 
 Closures can:
 
 ● Be stored in variables
 ● Be passed as parameters
 ● Return values
 ● Capture external values
 
 Basic Closure Syntax:-
 
 let greet = { (name: String) in
     print("Hello, \(name)!")
 }
 greet("Gaurav")  // Output: Hello, Gaurav!

 Non-Escaping Closures (Default):- A non-escaping closure is executed immediately within the function and is not stored after the function exits.
 
 Escaping Closures: - An escaping closure is executed after the function returns, meaning it is stored for later use.
 
 AutoClosure (@autoclosure):- An autoclosure automatically wraps an expression inside a closure.
 
 Trailing Closure:- A trailing closure is a closure written outside the parentheses of a function call, especially useful when the closure is the last argument.
 
 Example:-
 UIView.animate(withDuration: 0.3) {
 view.alpha = 0
 }
 
 Note:- Trailing closures make code cleaner and more readable, especially in SwiftUI or
 async tasks.
 
 
 
 
 
 typealias:- A typealias in Swift is used to create an alternative name for an existing type. It makes code more readable, flexible, and easier to maintain.
 syntax :- typealias NewName = ExistingType

 */
//  Non-Escaping Closures (Default)
func performAction(action: () -> Void) {
    print("Before action")
    action()  // Closure is executed immediately
    print("After action")
}

performAction {
    print("Executing action")
}

// Escaping Closures
var completionHandlers: [() -> Void] = []

@MainActor func performActionLater(action: @escaping () -> Void) {
    completionHandlers.append(action) // Closure is stored for later execution
}

performActionLater {
    print("Executing action later")
}

// Executing the stored closure
completionHandlers.first?()

// @autoclosure
func logMessage(message: @autoclosure () -> String) {
    print("Log: \(message())")  // Closure is automatically created
}

logMessage(message: "This is a log message")  // No `{}` needed


// MARK: -
/*MVC is the traditional architecture used in iOS development. Apple encourages using it with UIKit-based applications.

Structure
Model → Represents the data layer. It includes data structures, business logic, and APIs.
View → Handles UI components like UILabel, UIButton, and UITableView.
Controller → Acts as a mediator between the Model and View. It handles user interactions and updates the View accordingly.*/

// MARK: -MVVM
/*Model → Represents the data layer (same as MVC).
View → UI elements (UIView, UIButton, UILabel).
ViewModel → The logic layer that manages UI-related logic and prepares data for the View. It is independent of UIKit, making it more testable.
 */


//MARK: - Frame vs Bounds
/*
 Frame:- The position and size of a view relative to its superview's coordinate system.
 bounds:- The size and internal coordinate system of the view relative to itself.
 */
//MARK: - Any, AnyObject, and AnyClass
/*
 Any – Represents any type (including value and reference types).
 AnyObject – Represents only reference types (i.e., instances of classes).
 AnyClass – Represents a metatype of a class (Class.Type).

 */

//MARK: - SwiftUI Related
//SwiftUI vs UIKit
/*
 SwiftUI:- SwiftUI uses a declarative approach, meaning you just describe what the UI should look like.
 2. SwiftUI allows real-time UI updates without running the app
 3. SwiftUI runs on iOS, macOS, watchOS, and tvOS with the same code.
 4. SwiftUI automatically adjusts UI for Dark Mode and Accessibility.
 5. SwiftUI animations are easy with a single line of code.
 
 UIKit:-
 1. UIKit requires more manual setup and boilerplate code.
 2. UIKit needs you to run the simulator to see changes.
 3. UIKit is only for iOS/iPadOS.
 4. n UIKit, you have to handle it manually.
 5. UIKit requires delegates, notifications, or observers.
 
 */
// MARK: - Why SwiftUI uses struct for view and not class?
/*
 1. Structs are value types, meaning they are stored directly in memory and copied when needed.
 2. SwiftUI frequently recreates views, structs are lightweight and more efficient than classes.
 3. structs are value types, they don’t require Automatic Reference Counting (ARC).
 4. Structs are immutable by default, making UI updates more predictable.
 5.
 */

//MARK: - SwiftUI view Life cycle
/*
 init()
 body
 .onAppear()
 .onDisappear()
 .task
 .onChange(of:)
 */

/*
 @State
Used for local state within a view. When the value changes, the view updates.
 
 @Binding
 Used to create a two-way connection to a value that’s owned by a parent view.
 
 @ObservedObject
 Used for observing a reference type (class) that conforms to ObservableObject. Updates the view when a @Published property changes.
 
 @StateObject
 Introduced in iOS 14+, similar to @ObservedObject, but used to create and own the ObservableObject.
 
 @EnvironmentObject
 Used to inject shared data from the environment, often at a high level in the app.
 
 @Environment
 Used to access system values from the SwiftUI environment, like colorScheme, presentationMode, etc.
 
 @AppStorage
 Used for reading/writing to UserDefaults.
 
 */

//MARK: - ViewModifier
/* A ViewModifier is used to apply changes to a view, such as styling or transformations, in a reusable manner.*/

//MARK:- What is a Property Wrapper in Swift?
/*
 A property wrapper in Swift is a generic structure or class that encapsulates the behavior for a
 property. It provides a way to add logic around property access (getters and setters) while
 keeping the property declaration clean and reusable. Property wrappers can be used for
 behaviors like validation, data storage, and synchronization.
 
 A property wrapper is defined using the @ symbol and can be applied to any property.
 */

// MARK: - Core Data Related

/*What is Core Data?
 Core Data is Apple’s object graph and persistence framework. It allows you to manage the model layer objects in your app and persist data efficiently using SQLite, Binary, or In-Memory stores.
 
 
 */

// MARK: - Core Components of Core Data

/*
 The main components of Core Data Stack:

 NSManagedObject → Represents a record in Core Data.
 NSManagedObjectContext → Manages objects and tracks changes.
 NSPersistentContainer → Encapsulates the entire Core Data stack.
 NSPersistentStoreCoordinator → Connects objects to the persistent store.
 NSFetchRequest → Retrieves data from Core Data.
 NSPersistentStore → Physical storage (SQLite, XML, Binary, etc.).
 
 */

/*
// What is a Managed Object Context?
 It is a temporary workspace for managing Core Data objects. You use it to fetch, insert, delete, and save data. Changes aren’t persisted to the store until you call save().
 
 */

//MARK: - What is a Persistent Container in Core Data?
/*
 NSPersistentContainer simplifies the Core Data stack setup. It includes the context, model, and store coordinator. Introduced in iOS 10.
 */

//MARK: - What is an NSFetchedResultsController?
/*
 A controller that efficiently monitors changes in a managed object context for use in table/collection views. It fetches and observes changes in data and updates the UI automatically.
 */



