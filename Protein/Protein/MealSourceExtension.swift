//
//  MealSourceExtension.swift
//  Protein
//
//  Created by FultonDaniel on 2017/03/04.
//  Copyright © 2017 FultonDaniel. All rights reserved.
//

import Foundation

extension MealSource {
    func sortedMeals() -> [Meal] {
        return meals.sorted { (lhs, rhs) -> Bool in
            if lhs.date < rhs.date {
                return true
            }
            if lhs.date > rhs.date {
                return false
            }
            return lhs.type.rawValue < rhs.type.rawValue
        }
    }
    func nextRecommendedMealType() -> MealType {
        let today = Date.beginningOfCurrentDate()
        let todaysMeals = meals.filter { (aMeal) -> Bool in
            return aMeal.date == today
        }
        if todaysMeals.count == 0 {
            return .Breakfast
        }
        return .Dinner
    }
    func nextRecommendedProteinType() -> ProteinType {
        var remaining:Set<ProteinType> = [.RedMeat,.Bluefish,.Egg,.Soy,.Yogurt]
        let reversed = sortedMeals().reversed()
        for (index,meal) in reversed.enumerated() {
            if remaining.count == 1 {
                return meal.protein
            }
            if remaining.contains(meal.protein) {
                remaining.remove(meal.protein)
            }
            if index == reversed.count - 1 {
                return remaining.first ?? .Yogurt
            }
        }
        return .Yogurt
    }
}
