
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


var myCar = Car(brand: "Tesla", model: "X", maxSpeed: 250, engineCapacity: 2.5)
myCar.toggleEngine()
myCar.setSpeed(to: 100)
myCar.steeringWheel
myCar.turnTheWheel(position: .right)
myCar.displayInfo()
myCar.stop()
myCar.displayInfo()



