import UIKit
// MARK: - Optionals & Constants // LV1

//Const, swift determine dt for us ...
let myConst = "20"

//Optionals
//The parse option could fail and result could be null --> myParsedInt must be optional
var myParsedInt: Int? = Int(myConst)
var IntVar: Int

//Conditional Unwrapping / Optional Binding
//this block is only executed in case myParsedInt != nil
if let auchDreiundzwanzig = myParsedInt {
    IntVar = auchDreiundzwanzig
}

//Forced Unwrapping
//In case we definetly know an optional has a value, we can assign it to not optional
let myOptionalWithValue: Int? = 12
let myForedUnwrappedVar: Int = myOptionalWithValue!

//MARK: - Tupel, Collections ... // LV2 & LV3

//Tupel
var myTuple: (first: Int, second: Int)
//Adress each value via label
myTuple.first = 1
myTuple.second = 2
//Adress tuple with index
myTuple.1 = 1

//Arrays
var intArray: [Int] = [1, 2, 3, 4]
intArray.append(2)
//Alternative declaration
let anyArray: Array<Any> = ["Swift rocks", 10, 10.0, 1]
//Empty array
var emptyArray: [Int] = [Int]()

//Iterate over array
for number in intArray{
    print(number)
}

//Iterate with index
for (index, number) in intArray.enumerated(){
    print("Index: \(index) :  \(number)")
}


//Set - store values, unique and without index
//All values have to be hashable
var zeichen = Set<Character>()
zeichen.insert("a")
zeichen.insert("b")

zeichen.contains("c")
for character in zeichen{
    print(character)
}

//Some cool operations
var zeichenSecond: Set<Character> = ["b", "c", "d"]
zeichen.union(zeichenSecond).sorted()
zeichen.intersection(zeichenSecond)


//Dictionaries
//Storing key:value pairs
var numbersWithSpelling: [Int: String] = [1: "one", 10: "ten"]
numbersWithSpelling[10]

for(number, spelling) in numbersWithSpelling{
    print("\(number): \(spelling)")
}

for key in numbersWithSpelling.keys{
    print(key)
}

for value in numbersWithSpelling.values{
    print(value)
}

// MARK: - Cool operators
//Range operator
for i in 1..<5{
    print(i)
}

//Ternär operator
var optional: Int? = nil
var nonOptional: Int = 2
var myNumber = optional ?? nonOptional

// MARK: - Functions // LV4
//Function with optional params and return type
func getArea(length: Int = 1, height: Int = 1) -> Int{
    return length * height
}

getArea()
getArea(length: 10)
getArea(length: 10, height: 10)

// MARK: - Some more functions, some fancy stuff with type aliases and functions stored in variables // LV5

//Function with multiple / variable param list
func myMultipleParamList(_ ints: Int...){
    for number in ints{
        print(number)
    }
}

myMultipleParamList(1, 2, 3, 5, 7)

//Defer operator
//This operator is called before return statement

func myDeferExample() -> Bool{
    defer{
        print("In the end ...")
    }
    print("This is called before defer, please note!")
    return true
}

myDeferExample()

//Stride operator
for num in stride(from: 0, to: 10, by: 2){
    print(num)
}

//Nested functions
func myFunc(inputNumber: Int)-> Int{
    func myNestedFunction(number: Int) -> Int{
        return number*2
    }
    return myNestedFunction(number: inputNumber)
}

//Expected 4
myFunc(inputNumber: 2)

//Type alias
typealias getIntReturnInt = (Int) -> Int

func addOne(number: Int) -> Int{
    return number+1
}

func subOne(number: Int) -> Int{
    return number-1
}

//Note: We use typealias here to specify the expected operator function to be (int)->Int
func performMathOperation(operatorFunction: getIntReturnInt, number: Int) -> Int{
    return operatorFunction(number)
}

//Note: We can change the input function while it matchs the type from our typealias (int)->Int
print(performMathOperation(operatorFunction: addOne, number: 10))
print(performMathOperation(operatorFunction: subOne, number: 10))

//We can assign functions to variables, awesome!
var mySubFunction = subOne
print(mySubFunction(10))


// MARK: - Some Closures

//Closures are small, reuseable blocks of code

func printFunc(_ printFunc: (String)-> String){
    print(printFunc("Marvin"))
}
printFunc({ s1 in
    return "Hello " + s1
})

//Sorting with closure
let fruits = ["Banana", "Apples", "Nuits", "NoFruits"]
let sortedFruits = fruits.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1<s2
})
sortedFruits

//Minimalistic
let sortedFruitsShort = fruits.sorted(by: {s1, s2 in s1<s2})
sortedFruits

//Shorthand arguments
let sortedFruitsUsingShorthandArguments = fruits.sorted(by: {$0 < $1})

//Higher order functions with Closures
var myRangeArray = Array(1...10)
myRangeArray = myRangeArray.map({number in
    number+1
})
myRangeArray

//Auto Closure
//TODO: Ask what exactly an auto closure is
//Example makes no sense? --> let removedNumber = { numbers.remove(at: 2)} //Autoclosure




