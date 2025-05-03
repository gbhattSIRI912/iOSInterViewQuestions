import UIKit

//MARK: - Sort array without predefined function
func sortArrayWithoutPredefinedFunction(_ inputArray: [Int]) -> [Int] {
    var arr = inputArray
    let n = arr.count
    print("Original Array: \(arr)")
    for i in 0..<n-1 {
        for j in 0..<n-i-1 {
            if arr[j] > arr[j + 1] {
                let temp = arr[j]
                arr[j] = arr[j + 1]
                arr[j + 1] = temp
            }
        }
    }
    print("Sorted Array (Inside Function): \(arr)")
    return arr
}

let arrSort = [10, 15, 3, 4, 7, 9]
let sortedArray = sortArrayWithoutPredefinedFunction(arrSort)
print("Final Sorted Array: \(sortedArray)")

//MARK: -
/*Write a Swift function that finds the first non-repeating character in a given string and returns it. If all characters are repeating or the string is empty, return nil.
 
 Input: "Gaurav"
 Output: "G"
  
 */
func findFirstNonRepeatingCharactrer(in strName: String) -> Character? {
    var charCount: [Character: Int] = [:]
    
    for str in strName {
        charCount[str, default: 0] += 1
    }
    
    for str in strName {
        if charCount[str] == 1 {
            return str
        }
    }
    return nil
}

print(findFirstNonRepeatingCharactrer(in: "Gaurav") ?? "")

//MARK: - Remove Dublicate values from an array

func removeDuplicates(numbers: [Int]) -> [Int] {
    var tempArray: [Int] = []
    for number in numbers {
        if !tempArray.contains(number) {
            tempArray.append(number)
            
        }
    }
    return tempArray
}
let dublicate = removeDuplicates(numbers: [1,2,2,3,5,5,6,8])
print("Remove Dublicate value from an array \(dublicate)")

//MARK: -
////Given a string, reverse it without using the built-in reversed() method.
////revers The String value
func reversTheString(_ name: String) -> String {
    var reversedName = ""
    for letter in name {
        reversedName = "\(letter)\(reversedName)"
    }
    return reversedName
}

let reverseString = reversTheString("My Name Is Gaurav")
print("Reverse String value >>>\(reverseString)")

//MARK: - reversTheArray
func reverseArray<T>(_ array: [T]) -> [T] {
    var reversedArray = array
    var first = 0
    var last = array.count - 1

    while first < last {
        reversedArray.swapAt(first, last)
        first += 1
        last -= 1
    }
    return reversedArray
}

let reverseArrayValue = reverseArray(["Coke", "Pepsi", "Water"])
print("Reverse Array value >>>\(reverseArrayValue)")

//MARK: - flattenArray
// [1,2,[3,4],5,[6,[8]],9]

func flattenArray(_ inputArray: [Any]) -> [Int] {
    var result: [Int] = []

    for element in inputArray {
        if let number = element as? Int {
            result.append(number)
        } else if let nestedArray = element as? [Any] {
            result.append(contentsOf: flattenArray(nestedArray))
        }
    }
    
    return result
}

let nestedArray: [Any] = [1, 2, [3, 4], 5, [6, [8]], 9]
let flatArray = flattenArray(nestedArray)
print("Flat Arra>>>>\(flatArray)")

//swap two number without using third variable in swift
var a = 10
var b = 20

a = a + b
b = a - b
a = a - b

print("a: \(a), b: \(b)") // a: 20, b: 10

//MARK: - FizzBuzz Question
for number in 1...1000 {
    if number % 3 == 0 && number % 5 == 0 {
        print("FizzBuzz")
    } else if number % 3 == 0 {
        print("Fizz")
    } else if number % 5 == 0 {
        print("Buzz")
    } else {
        print(number)
    }
}

//MARK: -  write a function 'function' taht takes in two integers as in out perameters. it should also taken in another function as a parameter and this function should swap the values of the two integers passed, finally 'function' should return two strings "var1 is now \(Var1)" and "Var2 is now \(var2)" in swift
func function1(var1: Int, var2: Int, swapping: (inout Int, inout Int) -> Void)  -> (String, String) {
    var a = var1
    var b = var2
    swap(&a, &b)
    return ("var1 is \(a)", "var2 is \(b)")
}

func swapping(a: inout Int, b: inout Int) {
    let temp = a
    a = b
    b = temp
}

let output = function1(var1: 1, var2: 2, swapping: swapping)
print(output.0)
print(output.1)

 //MARK: - Define an enumeration for a traffic signal. the signal must cycle between three diffrent states (red, yellow and green) every time it's next() method is called
enum Traffic {
    case red
    case yellow
    case green

    mutating func next() {
        switch self {
        case .red:
            self = .yellow
        case .yellow:
            self = .green
        case .green:
            self = .red
        }
    }
}

var signal = Traffic.red
print(signal)

signal.next()
print(signal)

signal.next()
print(signal)


//MARK: - create a class called VendingMachine. it must contain an array of strings called 'items' as a stored property. it must also contain a function 'getitem' which takes a string and compares it to the item is present, it should print 'Here you go!' or else it should throw a custom error ' itemNotAvailable'
class VendingMachine {
    var items: [String]

    init(items: [String]) {
        self.items = items
    }

    func getItem(_ item: String) throws {
        guard items.contains(item) else {
            throw VendingMachineError.itemNotAvailable
        }
        print("Here you go!")
    }
}

enum VendingMachineError: Error {
    case itemNotAvailable
}

let myVendingMachine = VendingMachine(items: ["Coke", "Pepsi", "Water"])
try myVendingMachine.getItem("Coke")
do {
    try myVendingMachine.getItem("Sprite")
} catch {
    print(error)
}
