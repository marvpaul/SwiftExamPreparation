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

//Trailing closures are simply closures at the end of a method call
let sortedFruitsTrailing = fruits.sorted{s1, s2 in s1<s2}

//Higher order functions with Closures
var myRangeArray = Array(1...10)
myRangeArray = myRangeArray.map({number in
    number+1
})
myRangeArray

//Auto Closure
//TODO: Ask what exactly an auto closure is
//Example makes no sense? --> let removedNumber = { numbers.remove(at: 2)} //Autoclosure

// MARK: - Enums, Structs, Classes // LV7

//Some enums
enum Drinks: String{
    case tequila = "Tequila"
    case water = "Water"
    case juice = "Juice"
    case beer = "Beer"
    
    func getJoke() -> String {
        switch self{
        case .beer:
            return "Have a good beer"
        case .water:
            return "Water is not white, water is not black. What does this mean to you? :O"
        case .tequila:
            return "Just enjoy your drink, nothing else to say here ..."
        default:
            return "Sorry, programmer is out of stupid jokes"
        }
    }
}

let sthToDrink = Drinks.beer
print(sthToDrink.getJoke())

//Note: The drink enum is defined to have a raw value - we can simply get it
//RAW-VALUE
print("Raw value for my drink \(sthToDrink.rawValue)")

//You can also do some crazy stuff with Enums like that ...
enum myNumberEnum {
    case Number(Int)
    case NumberString(String)
}

let numberEnum = myNumberEnum.Number(10)
let stringNumberEnum = myNumberEnum.NumberString("Ten")

switch stringNumberEnum{
case let .Number(number):
    print("Number: \(number)")
case let .NumberString(number):
    print("String: \(number)")
}

//Structs
//Structs are similar to classes, but more leightweight
//Differences between Struct and Class
//Structs can't inherit
//Structs dosen't need a constructor for initializing variables
struct myStorage{
    //Stored properties
    var pricePerPiece: Int
    var pieces: Int
    
    //Its important to initialize all stored properties in the beginning
    init(){
        pricePerPiece = 1000
        pieces = 10
    }
    
    //Computed property
    var completePrice: Int {
        //This is computed each time variable pricePerPiece or pieces change
        get{
            return pricePerPiece * pieces
        }
        //You can also set a value of a computed property. Not sure if it really makes sense ...
        set(newComplPriece){
            pricePerPiece = newComplPriece / pieces
        }
        
    }
    
    //No problem, structs can have functions
    func getPriceWithVAT() -> Float {
        return Float(pricePerPiece)/100.0*119.0
    }
    
    //Note: In case you wanna to change properties, always use mutating keyword
    //Structs are imutable by default
    mutating func changePrice(newPrice: Int){
        pricePerPiece = newPrice
    }
}

//Structs are value typed
//--> Storing a new reference, not the memory adress

var storage = myStorage()
var storage2 = storage
storage2.changePrice(newPrice: 1200)

//Note, we changed storage2, but storage price is not changing...
print(storage.pricePerPiece)


//Important: classes reference types
class myStorageClass{
    var price: Int
    init(){
        price = 1000
    }
}

//Note: We change price of 1 objects, the other price changes as well
var myStorage1 = myStorageClass()
var myStorage2 = myStorage1
myStorage1.price = 1200
print(myStorage2.price)

//Classes
class Laptop{
    //You have to initialize non optional vars
    var price: Int
    
    //You havent to initialize Optionals
    var cpuCount: Int?
    
    //Classes must have initializer
    init(){
        price = 1000
    }
}

class GamingLaptop: Laptop{
    //You have to initialize non optional vars
    var gpuCount: Int
    
    //Classes must have initializer
    init(gpuCount: Int){
        //Properties of the class itself have to be initialized first!!!
        self.gpuCount = gpuCount
        
        //Also super class have to be initialized
        super.init()
    }
}

// MARK: - Computed Props and Early Exit LV 8
//Computed Properties mit Property Observer
struct myLongString{
    var text: String {
        willSet {
            //This is executed before setting a new value
            if newValue.count < 12 {
                print("Text is too short")
            }
        }
        didSet {
            //This is executed after setting new value.
            //Note: oldValue saves the old content of the variable for us
            if text.count < 12 {
                text = oldValue
            }
        }
    }
    
    init(){
        text = "This is a really long text, imagine ..."
    }
}

var longText = myLongString()
longText.text = "Kurz"
//Text hasn't changed because of property observer ...
print(longText)


//The early exit with guard
func exitWhenEmpty(sth: Int?){
    guard let notEmpty = sth else {
        return
    }
    print("Hello, your variable content is: \(notEmpty)")
}

//Note: This function call will never go to print statement cause guard forces an early exit
exitWhenEmpty(sth: nil)
exitWhenEmpty(sth: 100)

// MARK: - Static properties and subscription

//Static properties, please not to declare static computed properties in classes with keyword CLASS
class myShowcase{
    static var myText: String = "Hello hello"
    
    //Note: We use class here for some reason.
    class var myTextLength: Int {
        return myText.count
    }
}

//Subscription
//Subscription is a funny feature where you can adress classes like an array

class greetingNamesMixer{
    var names: [String]
    var greeting: [String]
    
    init(){
        names = ["Peter", "Marv"]
        greeting = ["Hay", "Hello", "Bonjour"]
    }
    
    //This functions is mapped to calls like greetingNamesMixer[x, y] --> ArrayStyle
    subscript(greeting: Int, name: Int) -> String{
        get{
             return "\(self.greeting[greeting]), \(self.names[name])"
        }
        set{
            self.greeting[greeting] = String(newValue.split(separator: ",")[0])
            self.names[name] = String(newValue.split(separator: ",")[1])
        }
    }
}

var greetingMixer = greetingNamesMixer()
//Note that we can adress the setter as well as the getter
greetingMixer[1, 0] = "Hôla, Morgan"
print(greetingMixer[1, 0])


//using generics to make a compareable list
//note: This is called: Constraints
class myGenericList<T: Comparable>{
    var list: [T]
    
    init(){
        list = [T]()
    }
    
    func add(value: T){
        list.append(value)
    }
    
    func remove(index: Int) -> T {
        return list.remove(at: index)
    }
    
    //Note that we can use this because we added the Comparable protocol
    func compare(index1: Int, index2: Int) -> Int{
        if list[index1] > list[index2]{
            return -1
        } else if list[index2] > list[index1]{
            return 1
        } else{
            return 0
        }
    }
}

//MARK: - Protocols ... LV 10
protocol hasAwareness{
    var iq: Int {get}
    //Get set says we have to implement it as this, we cant make a constant from childCount
    // --> https://medium.com/@chetan15aga/swift-protocols-properties-distinction-get-get-set-32a34a7f16e9
    var childCount: Int{get set}
    
    func sayHello()
}

struct Human: hasAwareness{
    //Note: We can choose here if our iq should be a constant or a variable
    let iq: Int
    var childCount: Int
    
    func sayHello() {
        "Hello"
    }
}

var marvin: Human = Human(iq: 80, childCount: 0)

// Advanced Operator
//: ## Operator Overloading.

prefix operator +++

struct myDrums{
    var drumCount: Int
    
    static func +(left: myDrums, right: myDrums) -> myDrums{
        return myDrums(drumCount: left.drumCount+right.drumCount)
    }
    
    
    static prefix func +++(drums: inout myDrums) -> myDrums{
        return myDrums(drumCount: drums.drumCount+2)
    }
}



var drumSet1 = myDrums(drumCount: 3)
var drumSet2 = myDrums(drumCount: 2)
var drumSet3 = drumSet1 + drumSet2
print(drumSet3.drumCount)
print(+++drumSet1)


//MARK: - LV 11 Extensions and some other stuff
//You can simply extend each class and make cool vars of functions
extension String{
    var greets: String {return "Hello, \(self)"}
    func printEachCarInRow(){
        for i in self.characters{
            print(String(i))
        }
    }
}

print("Marvin".greets.printEachCarInRow())


//Good to know --> Remove dublicates
print(Array(Set(["Hello", "Hello"])))


