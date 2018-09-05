//
//  ActionResultDelegate.swift
//  Planner
//
//  Created by Andrey Dubinchak on 20.08.2018.
//  Copyright © 2018 Andrey Dubinchak. All rights reserved.
//

import Foundation
import UIKit
//для возврата результата из одного контроллера в другой (уведомление другого контроллера о своем действии и передача объекта если необходимо)
protocol ActionResultDelegate {
    func done(source:UIViewController, data:Any?)//ок сохранить
    func cancel(source:UIViewController, data:Any?)//отмена действия
}
//реализации по умолчанию для интерфейса
extension ActionResultDelegate{
    func done(source:UIViewController, data:Any?) {
        fatalError("not implemented")
    }
    
    func cancel(source:UIViewController, data:Any?) {
        fatalError("not implemented")
    }
}
