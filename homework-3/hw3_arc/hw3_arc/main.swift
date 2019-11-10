//
//  main.swift
//  hw3_arc
//
//  Created by Ilia Sahaidak on 04.11.2019.
//  Copyright © 2019 Ilia Sahaidak. All rights reserved.
//

import Foundation

/**
 * ARC
 */


//Retain cycle with class
class Flower {
    let name: String
    
    init(name: String) {
        self.name = name
   }
    
    deinit {
       print("Constant \(name) was deinitialized")
    }
}

var lotus: Flower? = Flower(name: "Lotus")
lotus = nil

//Retain cycle with 3 classes

class Employee {
    weak var money: Money?
    
    deinit {
        print("money was deinitialized :'(")
    }
}

class Job {
    var employee: Employee?
    
    deinit {
        print("employee was deinitialized")
    }
}

class Money {
    var job: Job?
    
    deinit {
        print("job was deinitialized")
    }
}

var employee: Employee? = Employee()
var job: Job? = Job()
var money: Money? = Money()

employee?.money = money
job?.employee = employee
money?.job = job

employee = nil
job = nil
money = nil
