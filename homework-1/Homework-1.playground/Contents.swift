import Foundation
import PlaygroundSupport

/*
 1 Use and understand Swift's basic types like Bool, Int, String, and Double
Створіть константи із вказаними значеннями двома способами (явно вказуючи тип і неявно)
Перевірте себе функцією type(of: тут вкажіть назву константи)
а) ціле число 1
b) дійсне число 1.0
с) рядок, що містить фразу Hello world!
d) рядок, що містить фразу The number is та константу з числом 42
e) хибне значення
f) істинне значення
*/


//let a1 : Int = 1
//let a2 = 1
//type(of: a1)
//type(of: a2)
//
//let b1 = 1.0;
//let b2 : Double = 1.0;
//type(of: b1)
//type(of: b2)
//
//let c1 = "Hello World!"
//let c2 : String = "Hello World!"
//type(of: c1)
//type(of: c2)
//
//let theNum1 : Int = 42;
//let d1 : String = "The number is " + String(theNum1);
//let theNum2 = 42;
//let d2 = "The number is \(theNum2)";
//type(of: theNum1)
//type(of: d1)
//type(of: theNum2)
//type(of: d2)
//
//let e1 = false;
//let e2 : Bool = false;
//type(of: e1)
//type(of: e2)
//
//let f1 = true;
//let f2 : Bool = true;
//type(of: f1)
//type(of: f2)
/*
 2 Declare and use variables and constants (var let)
a) Зробіть константу цілого типу зі значенням 3
b) Зробіть змінну типу рядок зі значенням "The three is "
c) Змініть значення змінної на таке, що містить раніше створену константу
*/

//let a : Int = 3;
//var b : String = "The three is "
//b = b + String(a)


/*
 3 Handle flow control and looping constructs (if for while switch)
a) Створіть розгалуження яке до змінної b додасть число 1 якщо b додатнє і відніме - якщо від'ємне
b) Пройдіть циклом по числам від 1 до 10 і виведіть їх (використайте спочатку for потім while)
c) Використайте switch із цілочисельною змінною який виведе фразу "Low" для значень від 1 до 18, "High" для 19-36, "Zero" для 0 та "Unknown" для решти значень
*/
var b = 0;

if b != 0 {
    if b < 0 {
        b -= 1
    } else {
        b += 1
    }
}

for i in 1 ... 10{
    print(i)
}

var ind = 0
while ind < 10 {
    ind += 1
    print(ind)
}

var intVar = 17.5
switch intVar {
    case 1 ..< 18: "Low"
    case 19 ..< 36: "High"
    case 0: 0
    default: "Unknown"
}
/*
4 Create and use collections (Array Set Dictionary)
a) Створіть масив (Array) цілих чисел та посортуйте його
b) Створіть дві множини (Set) цілих чисел та знайдіть їх перетин
с) Створіть Dictionary в якому ключем виступає рядок а значенням будь-який тип і заповніть його
*/

var myArr : [Int] = [5, 2, 7, 3, 10, 19, 4, 1]
myArr.sort(by: <);

let firstSet : Set = [5, 2, 4, 3, 1, 9]
let secondSet : Set = [5, 4, 6, 7, 8, 9]

let intersect = firstSet.intersection(secondSet)

var myDict : [String : Any] = [:]
myDict.updateValue("My Value", forKey: "My Key")
print(myDict)

/*
 5 Develop and use simple functions ( inout ->  )
а) Створіть функцію яка приймає на вхід масив і віддає найчастіше повторюване значення в ньому
b) Створіть функцію яка приймає на вхід масив і змінює його ж, додаючи до кожного значення 1
*/
var myIntArr = [1, 4, 5, 2, 4, 1, 2, 3, 7, 8, 2, 1, 7, 3, 3, 4, 3]

func getMostRepeated(arr: [Int]) -> (value: Int, counts: Int)? {
    var counts = [Int:Int]()
    arr.forEach { counts[$0] = (counts[$0] ?? 0) + 1 }
    if let (value, count) = counts.max(by: { $0.1 < $1.1 }) {
        return (value, count)
    }
    return nil
}
getMostRepeated(arr: myIntArr)

func accumulateArray(arr: inout[Int]) {
    for i in 0 ..< arr.count {
        arr[i] += 1
    }
}

accumulateArray(arr: &myIntArr)


/*
 6-7 Cast objects safely from one type to another ( as! as? as init). Handle optionals and unwrap them safely (if let ; guard let ; != nil)
Створіть функцію яка приймає на вхід змінну типу Any? і вертає рядок в якому міститься тип значення переданої змінної.
(!) Для виконання цього завдання НЕ використовуйте метод type(of: ).
(!!) Для виконання цього завдання МОЖНА використовувати наступні конструкції (спробуйте кожну з них в окремії функції)
a) `if let`
b) `guard let`
c) switch.
*/

var myOptValue : Any?;
myOptValue = "123"

func getTypeIf(val: Any?) -> String {
    if val != nil {
        if val is String {
            return "String"
        }
        else if val is Int {
            return "Int"
        }
        else if val is Bool {
            return "Bool"
        }
        else if val is Double {
            return "Double"
        }
        else if val is Float {
            return "Float"
        }
        else {
            return "Unhandled type"
        }
    } else {
        return "nil"
    }
}

getTypeIf(val: myOptValue)

func getTypeSwitch(val: Any?) -> String {
    switch val {
        case is String: return "String"
        case is Int: return "Int"
        case is Bool: return "Boolean"
        case is Double: return "Double"
        case is Float: return "Float"
        case nil: return "nil"
        default: return "Unhandled type"
    }
}

getTypeSwitch(val: myOptValue)
