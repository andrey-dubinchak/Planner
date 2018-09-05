//
//  TaskDaoDbImpl.swift
//  Planner
//
//  Created by Andrey Dubinchak on 19.08.2018.
//  Copyright © 2018 Andrey Dubinchak. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class TaskDaoDbImpl: Crud {
    var items: [Task]!
    
    //var tasks: [Task]!
    
    //паттерн синглтон
    static let current = TaskDaoDbImpl()
    private init(){
        items = getAll()
    }
    
    private let categoryDao = CategoryDaoDbImpl.current
    private let priorityDao = PriorityDaoDbImpl.current
    
    //MARK: - dao
    
    func addOrUpdate(_ task: Task) {
        if !items.contains(task){
            items.append(task)
        }
        save()
    }
    
    func getAll() -> [Task] {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        do {
            items = try context.fetch(fetchRequest)
        } catch  {
            fatalError("fetching of tasks failed")
        }
        return items
    }
    
    func delete(_ task: Task) {
        context.delete(task)
        save()
    }
    
}
