//
//  Crud.swift
//  Planner
//
//  Created by Andrey Dubinchak on 19.08.2018.
//  Copyright © 2018 Andrey Dubinchak. All rights reserved.
//

import Foundation
import CoreData

protocol Crud{
    associatedtype Item : NSManagedObject
    var items:[Item]! {get set} //текущая коллекция объектов для отображения, хранит текущие данные, выбранные из БД
    func addOrUpdate(_ item:Item) //добавляет новый объект или обновляет существующий
    func getAll() -> [Item] //получение всех объектов (список с сортировкой, если значение sortType = nil, вывод без сортировки)
    func delete(_ item: Item) //удаление объекта
}
