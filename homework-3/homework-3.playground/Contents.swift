

//Inheritance:
//Створіть класс Трактор який наслідується від Автомобіль у якого є додаткове поле Ковш
//Ковш має бути окремим класом із методами вкл/викл і методи для керування ковшом (підняти, повернути, опустити)
//
//Polymorphism:
//Змінити методи вкл/викл у Трактора (цей метод наслідуєтбься від класу Автомобіль) щоб вони включали і виключали окрім Двигуна ще й Ковш
//
//Incapsulation:
//Захистіть поля і методи Двигуна так щоб користувач не знав нічого про Двигун якщо використовує класс Автомобіль
//
//Сlosure:
//Створити аналог функції фільтр (в середині не можна використовувати функції масиву).
//Розібратись і написати пару прикладів map, reduce, sort.



class Car {
    var info: (brand: String, model: String, engine: Engine)
    var headlights = false
    var steeringWheel : SteeringWheelPosition = .neutral
    enum SteeringWheelPosition {
        case neutral
        case right
        case left
    }
    let engine: Engine
    let display: Display
    
    init(brand: String, model: String, maxSpeed: Int, engineCapacity: Double) {
        self.engine = Engine(maxSpeed: maxSpeed, capacity: engineCapacity)
        self.info.brand = brand
        self.info.model = model
        self.info.engine = self.engine
        self.display = Display(info: self.info)
    }
    
    func turnTheWheel(position: SteeringWheelPosition) -> String {
        steeringWheel = position
        return "Turning \(position)"
    }
    
    func setSpeed(to: Int) -> String {
        guard engine.getState() else { return "The engine is off" }
        if (to <= engine.getMaxSpeed()) {
            engine.setSpeed(to: to)
            return "Wroom Wroom! \(engine.getCurrentSpeed() < to ? "Accelerating" : "Breaking") to \(to)..."
        } else {
            engine.setSpeed(to: engine.getMaxSpeed())
            return "Wroom Wroom! Accelerating to \(engine.getMaxSpeed())..."
        }
    }
    
    func displayInfo() -> String {
        return self.display.showInfo()
    }
    
    func stop() -> String {
        return engine.brakes()
    }
    
    func toggleEngine() {
        engine.toggleEngine()
    }
}

class Engine {
    private var maxSpeed: Int
    private var currentSpeed: Int = 0
    private var isOn = false
    private var capacity: Double = 1.6
    init(maxSpeed: Int, capacity: Double) {
        self.maxSpeed = maxSpeed
        self.capacity = capacity
    }
    
    func toggleEngine() {
        isOn = !isOn
    }
    
    func setSpeed(to: Int) {
        currentSpeed = to
    }
    
    func getCurrentSpeed() -> Int {
        return currentSpeed
    }
    
    func getMaxSpeed() -> Int {
        return maxSpeed
    }
    
    func getState() -> Bool {
       return isOn
    }
    
    func brakes() -> String {
        if currentSpeed > 0 {
            currentSpeed = 0
            return "Breaking..."
        } else {
            return "Car is already stopped"
        }
    }
    
}

class Display {
    private var brand: String
    private var model: String
    private var engine: Engine
    
    init(info: (brand: String, model: String, engine: Engine)) {
        self.brand = info.brand
        self.model = info.model
        self.engine = info.engine
    }
    
    func showInfo() -> String {
        return "Brand: \(brand) \n Model: \(model) \n Engine is: \(engine.getState() ? "On" : "Off") \n Speed: \(engine.getCurrentSpeed())/\(engine.getMaxSpeed())"
    }
}

class Tractor: Car {
    var shovel = Shovel()
    
    override func toggleEngine() {
        engine.toggleEngine()
        toggleShovel()
    }
    
    func toggleShovel() {
        shovel.isOn = !shovel.isOn
    }
    
}

class Shovel {
    var isOn = false
    enum ShovelState {
        case raised
        case turned
        case omitted
    }
    
    private var shovelState: ShovelState = .omitted
    
    func move(state: ShovelState) {
        shovelState = state
    }
}

var myCar = Car(brand: "Tesla", model: "X", maxSpeed: 250, engineCapacity: 2.5)
myCar.toggleEngine()
myCar.setSpeed(to: 100)
myCar.steeringWheel
myCar.turnTheWheel(position: .right)
myCar.displayInfo()
myCar.stop()
myCar.displayInfo()
var myTractor = Tractor(brand: "CAT", model: "2R", maxSpeed: 80, engineCapacity: 3.0)
myTractor.toggleEngine()
myTractor.shovel.move(state: .raised)


//Own filter

let myArr = [123, 23, 4, 12, 6, 5, 1, 45, 62]

extension Array where Element == Int {
    func intFilter(compare: (Int) -> Bool) -> [Int] {
        var newArr = [Int]()
        for val in self {
            if compare(val) {
                newArr.append(val)
            }
        }
        return newArr
    }
}

let newArr = myArr.intFilter{$0 > 10}


// Array Map usage
var firstArr = [3, 2, 4, 1, 5, 21, 13, 73].map{$0 + 1}
print(firstArr)
//new array based on first one
let secondArr = firstArr.map{i in i * (i - i / 2)}
print(secondArr)
//first array didn't change as we just created a new one
print(firstArr)


// Array Reduce usage
let firstArrSum = firstArr.reduce(0, +)
print(firstArrSum)

let arrForReduce = [1, 5, 2]
let arrForReduceSum = arrForReduce.reduce(0){sum, i in sum + i}
print(arrForReduceSum)


//Array Sort usage
var intArrayToSort = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
var strArrayToSort = ["Vasya", "Kolia", "Musia", "Asia"]
//sort on place
intArrayToSort.sort(by: >)
print(intArrayToSort)
strArrayToSort.sort(by: <)
print(strArrayToSort)

//returns new sorted array without changing other
let newIntArrSorted: [Int] = intArrayToSort.sorted()
print(newIntArrSorted)
print(intArrayToSort)
let newStrArrSorted: [String] = strArrayToSort.sorted(by: >)
print(newStrArrSorted)
print(strArrayToSort)
