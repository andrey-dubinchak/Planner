//
//  CrudTask.swift
//  Planner
//
//  Created by Andrey Dubinchak on 19.08.2018.
//  Copyright © 2018 Andrey Dubinchak. All rights reserved.
//

import Foundation

protocol CrudTask{
    var tasks:[Task]! {get set} //хранит текущие данные, выбранные из БД
    func addOrUpdate(_ task:Task) //добавляет новый объект или обновляет существующий
    func getAll() -> [Task] //получение всех объектов
    func delete(_ task: Task) //удаление объекта
    
}
