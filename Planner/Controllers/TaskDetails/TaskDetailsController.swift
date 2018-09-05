//
//  ViewController.swift
//  Planner
//
//  Created by Andrey Dubinchak on 12.08.2018.
//  Copyright © 2018 Andrey Dubinchak. All rights reserved.
//

import UIKit

class TaskDetailsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var delegate: ActionResultDelegate!// нужен для уведомления и вызова функции из контроллера списка задач
    
    //текущая задача для редактирования (создания)
    var task: Task!
    
    //для хранения ссылок на компоненты
    var textTaskName: UITextField!
    var textviewTaskInfo: UITextView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 4{
            return 90
        } else {
            return 45
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 25
//    }
    
    //заполняем данные задачи
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //какую секцию в данный момент заполняем
        switch indexPath.section {
        case 0:                     //имя
            //получаем ссылку на ячейку
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellTaskName", for: indexPath) as? TaskNameCell else {
                fatalError("cell type")
            }
            //заполняем компонент данными из задачи
            cell.textTaskName.text = task.name
            textTaskName = cell.textTaskName //чтобы можно было использовать объект вне метода TableView
            return cell
            return UITableViewCell()
            
        case 1:                     //категория
            //получаем ссылку на ячейку
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellTaskCategory", for: indexPath) as? TaskCategoryCell else {
                fatalError("cell type")
            }
            
            var value: String
            if let name = task.category?.name {
                value = name
            }else{
                value = "не выбрано"
            }
            //заполняем компонент данными из задачи
            cell.labelTaskCategory.text = value
            return cell
            
        case 2:                     //приоритет
            //получаем ссылку на ячейку
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellTaskPriority", for: indexPath) as? TaskPriorityCell else {
                fatalError("cell type")
            }
            
            var value: String
            if let name = task.priority?.name {
                value = name
            }else{
                value = "не выбрано"
            }
            //заполняем компонент данными из задачи
            cell.lableTaskPriority.text = value
            return cell
            
        case 3:                     //дата
            //получаем ссылку на ячейку
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellTaskDeadline", for: indexPath) as? TaskDeadlineCell else {
                fatalError("cell type")
            }
            //let deadline = task.deadline!
            var value: String
            if let deadline = task.deadline {
                value = dateFormatter.string(from: deadline)
                //value = name
            }else{
                value = "не указана"
            }
            //заполняем компонент данными из задачи
            cell.lableTaskDeadline.text = value
            return cell
            
        case 4:                     //доп.инфо
            //получаем ссылку на ячейку
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellTaskInfo", for: indexPath) as? TaskInfoCell else {
                fatalError("cell type")
            }
            
            var value: String
            if let name = task.info {
                value = name
            }else{
                value = "не выбрано"
            }
            
            //заполняем компонент данными из задачи
            cell.textViewTaskInfo.text = value
            textviewTaskInfo = cell.textViewTaskInfo //чтобы использовать обхект вне метода
            return cell

        default:
            fatalError()
        }
//        let cell = tableView.dequeueReusableCell(withIdentifier: "taskDetailsCell", for: indexPath) as UITableViewCell
//        cell.textLabel?.text = task.name
        //return cell
    }
    //названия для каждой секции
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Название"
        case 1:
            return "Категория"
        case 2:
            return "Приоритет"
        case 3:
            return "Дата"
        case 4:
            return "Доп. инфо"
        default:
            return ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //for i in 0...20000{
        //    print(i)
        //}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: IBActions
    
    @IBAction func tapCancel(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapSave(_ sender: UIBarButtonItem) {
        task.name = textTaskName.text
        task.info = textviewTaskInfo.text
        delegate.done(source: self, data: nil)
        navigationController?.popViewController(animated: true)
    }


}

