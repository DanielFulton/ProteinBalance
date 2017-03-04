//
//  Meal.swift
//  Protein
//
//  Created by FultonDaniel on 2017/03/04.
//  Copyright © 2017 FultonDaniel. All rights reserved.
//

import Foundation

struct Meal {
    let id:Int
    let type:MealType
    let protein:ProteinType
    let date:Date
    let portion:Float
    var eaters:[Eater]
}

struct Eater {
    let id:Int
    var name:String
    let birthday:Date
}

enum MealType:Int {
    case Breakfast
    case Lunch
    case Dinner
    func string() -> String {
        switch self {
        case .Breakfast:
            return "Breakfast"
        case .Lunch:
            return "Lunch"
        case .Dinner:
            return "Dinner"
        }
    }
}

enum ProteinType {
    case Bluefish
    case RedMeat
    case Soy
    case Egg
    case Yogurt
    func allTypes() -> [ProteinType] {
        return [.RedMeat,.Bluefish,.Egg,.Soy,.Yogurt]
    }
    func string() -> String {
        switch self {
        case .Bluefish:
            return "Blue Fish"
        case .RedMeat:
            return "Red Meat"
        case .Egg:
            return "Egg"
        case .Soy:
            return "Soy"
        case .Yogurt:
            return "Yogurt"
        }
    }
}

extension Meal : Hashable {
    var hashValue: Int {
        return id
    }
}
func ==(lhs:Meal,rhs:Meal) -> Bool {
    return lhs.id == rhs.id
}

extension Eater : Hashable {
    var hashValue: Int {
        return id
    }
}
func ==(lhs:Eater,rhs:Eater) -> Bool {
    return lhs.id == rhs.id
}
