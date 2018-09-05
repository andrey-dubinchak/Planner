//
//  TaskExtension.swift
//  Planner
//
//  Created by Andrey Dubinchak on 19.08.2018.
//  Copyright © 2018 Andrey Dubinchak. All rights reserved.
//

import Foundation

extension Task {
    
    func daysLeft() -> Int! {
        if self.deadline == nil{
            return nil
        }
        return (self.deadline?.offsetFrom(date: Date().today))
    }
}
