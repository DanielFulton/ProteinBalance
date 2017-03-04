//
//  MealSource.swift
//  Protein
//
//  Created by FultonDaniel on 2017/03/04.
//  Copyright © 2017 FultonDaniel. All rights reserved.
//

import Foundation

class MealSource {
    static let sharedMealSoruce = MealSource()
    var meals:Set<Meal>
    var eaters:Set<Eater>
    private init() {
        meals = Set()
        eaters = Set()
    }
}
