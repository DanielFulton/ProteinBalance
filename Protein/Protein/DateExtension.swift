//
//  DateExtension.swift
//  Protein
//
//  Created by FultonDaniel on 2017/03/04.
//  Copyright © 2017 FultonDaniel. All rights reserved.
//

import Foundation

extension Date {
    static func beginningOfCurrentDate() -> Date {
        return NSCalendar(identifier: .gregorian)!.startOfDay(for: Date())
    }
}
