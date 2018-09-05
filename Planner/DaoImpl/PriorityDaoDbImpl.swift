//
//  PriorityDaoDbImpl.swift
//  Planner
//
//  Created by Andrey Dubinchak on 19.08.2018.
//  Copyright © 2018 Andrey Dubinchak. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PriorityDaoDbImpl: Crud {
    var items: [Priority]!

    //var priorities: [Priority]!

    //паттерн синглтон
    static let current = PriorityDaoDbImpl()
    private init(){
        items = getAll()
    }

    //MARK: - dao

    func addOrUpdate(_ priority: Priority) {
        if !items.contains(priority){
            items.append(priority)
        }
        save()
    }

    func getAll() -> [Priority] {
        let fetchRequest: NSFetchRequest<Priority> = Priority.fetchRequest()
        do {
            items = try context.fetch(fetchRequest)
        } catch  {
            fatalError("fetching of priorities failed")
        }
        return items
    }

    func delete(_ priority: Priority) {
        context.delete(priority)
        save()
    }

}
