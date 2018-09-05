//
//  CrudPriority.swift
//  Planner
//
//  Created by Andrey Dubinchak on 19.08.2018.
//  Copyright © 2018 Andrey Dubinchak. All rights reserved.
//

import Foundation

protocol CrudPriority{
    var priorities:[Priority]! {get set} //хранит текущие данные, выбранные из БД
    func addOrUpdate(_ priority:Priority) //добавляет новый объект или обновляет существующий
    func getAll() -> [Priority] //получение всех объектов
    func delete(_ priority: Priority) //удаление объекта
}
