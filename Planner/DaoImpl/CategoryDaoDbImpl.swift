//
//  CategoryDaoDbImpl.swift
//  Planner
//
//  Created by Andrey Dubinchak on 19.08.2018.
//  Copyright © 2018 Andrey Dubinchak. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CategoryDaoDbImpl: Crud {
    var items: [Category]!
    
    //var categories: [Category]!
    
 
    //паттерн синглтон
    static let current = CategoryDaoDbImpl()
    private init(){
        items = getAll()
    }
    
    //MARK: - dao
    func addOrUpdate(_ category: Category) {
        if !items.contains(category){
            items.append(category)
        }
        save()
    }
    
    func getAll() -> [Category] {
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        do {
            items = try context.fetch(fetchRequest)
        } catch  {
            fatalError("fetching of categories failed")
        }
        return items
    }
    
    func delete(_ category: Category) {
        context.delete(category)
        save()
    }
    
   
}
