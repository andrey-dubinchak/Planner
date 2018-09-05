//
//  CrudCategory.swift
//  Planner
//
//  Created by Andrey Dubinchak on 19.08.2018.
//  Copyright © 2018 Andrey Dubinchak. All rights reserved.
//

import Foundation

protocol CrudCategory{
    var categories:[Category]! {get set} //хранит текущие данные, выбранные из БД
    func addOrUpdate(_ category:Category) //добавляет новый объект или обновляет существующий
    func getAll() -> [Category] //получение всех объектов
    func delete(_ category: Category) //удаление объекта
    
}
