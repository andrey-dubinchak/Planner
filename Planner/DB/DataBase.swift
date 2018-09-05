//
//  DataBase.swift
//  Planner
//
//  Created by Andrey Dubinchak on 19.08.2018.
//  Copyright © 2018 Andrey Dubinchak. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DataBase {
    
    var context: NSManagedObjectContext! //контекст для связи объектов с БД
    //context = appDelegate.persistentContainer.viewContext
    
    init() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("appDelegate error")
        }
        context = appDelegate.persistentContainer.viewContext
        //initData()
    }

    
    func getAllTasks() -> [Task] {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        let list: [Task]
        
        do {
            list = try context.fetch(fetchRequest)
        } catch  {
            fatalError("fetching failed")
        }
        return list
    }
    
    func addCategory(name: String) -> Category {
        let category = Category(context: context)
        category.name = name
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save \(error)" )
        }
        
        return category
    }
    
    func addPriority(name: String, index: Int32) -> Priority {
        let priority = Priority(context: context)
        priority.name = name
        priority.index = index
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save \(error)" )
        }
        
        return priority
    }
    
    func addTask(name: String, completed: Bool, deadline: Date?, info: String?, category: Category?, priority: Priority?) -> Task {
        let task = Task(context: context)
        
        task.name = name
        task.completed = completed
        task.deadline = deadline
        task.info = info
        task.category = category
        task.priority = priority
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save \(error)" )
        }
        return task
    }
    
    func deleteTask(task: Task) {
        context.delete(task)
        do{
            try context.save()
        } catch let error as NSError {
            print("could not save. \(error)")
        }
    }
    
    func initData() {
        //добавляем категорию
        let category1 = addCategory(name: "Спорт")
        let category2 = addCategory(name: "Семья")
        let category3 = addCategory(name: "Отдых")
        
        //добавляем приоритет
        let priority1 = addPriority(name: "Низкий", index: 1)
        let priority2 = addPriority(name: "Нормальный", index: 2)
        let priority3 = addPriority(name: "Высокий", index: 3)
        
        //добавляем задачу с категорией и пустым приоритетом
        let task1 = addTask(name: "Сходить в бассейн а дальше длинное название", completed: false, deadline: Date(), info: "доп. инфо", category: category1, priority: priority1)
        let task2 = addTask(name: "Выезд на природу", completed: false, deadline: Date(), info: "", category: category2, priority: priority2)
        let task3 = addTask(name: "Вынести мусор", completed: false, deadline: Date(), info: "доп. инфо", category: category3, priority: priority3)
        let task4 = addTask(name: "Помыть машину", completed: false, deadline: Date(), info: "", category: category3, priority: priority2)
        let task5 = addTask(name: "Найти работу", completed: false, deadline: Date(), info: "доп. инфо", category: category3, priority: priority3)
    }
}
