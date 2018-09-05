//
//  DateExtension.swift
//  Planner
//
//  Created by Andrey Dubinchak on 19.08.2018.
//  Copyright © 2018 Andrey Dubinchak. All rights reserved.
//

import Foundation

extension Date {
    var today: Date {
        return rewindDays(0)
    }
    
    //получить новую дату (от текущей)
    func rewindDays(_ days: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: self)!
    }
    
    //считает разницу между двумя датами в днях
    func offsetFrom(date: Date) -> Int {
        let cal = Calendar.current
        let startOfDay = cal.startOfDay(for: date)
        let startOfOtherDay = cal.startOfDay(for: self)
        
        return cal.dateComponents([.day], from: startOfDay, to: startOfOtherDay).day!
        
    }
    
}
