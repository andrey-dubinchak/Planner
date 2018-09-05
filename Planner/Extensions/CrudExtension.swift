//
//  CrudExtension.swift
//  Planner
//
//  Created by Andrey Dubinchak on 19.08.2018.
//  Copyright © 2018 Andrey Dubinchak. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension Crud {
    var context: NSManagedObjectContext{
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext // контекст для работы с БД
    }
    //сохранение всех изменений контекста
    func save() {
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
}
