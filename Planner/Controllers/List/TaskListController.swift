//
//  TaskListController.swift
//  Planner
//
//  Created by Andrey Dubinchak on 12.08.2018.
//  Copyright © 2018 Andrey Dubinchak. All rights reserved.
//

import UIKit
import CoreData

class TaskListController: UITableViewController, ActionResultDelegate{
    
    let dateFormatter = DateFormatter()
    
    //let dataBase = DataBase()
    let taskDAO = TaskDaoDbImpl.current
    let categoryDAO = CategoryDaoDbImpl.current
    let priorityDAO = PriorityDaoDbImpl.current
    
    var taskList:[Task]!
    
  //  private var taskList: [Task] = [Task(name: "Задача1", category: "Категория1"), Task(name: "Задача2", category: "Категория2"), Task(name: "Задача3", category: "Категория3"), Task(name: "Задача4 egrgfsh jhgfjfkjy rg fggbdfdfdfdsdsds", category: "Категория4 etertrtyy hjmjkjkiy sfdsfgfddhrt", priority: "Высокая", deadline: Date())]

    //var context: NSManagedObjectContext! //контекст для связи объектов с БД
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .medium
        //dateFormatter

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//            fatalError("appDelegate error")
//        }
        
        //получаем контекст из persistentContainer
        //context = appDelegate.persistentContainer.viewContext
        //initData()
        taskList = taskDAO.getAll()
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskListCell

        let task = taskList[indexPath.row]
        
        // Configure the cell...
        cell.labelTaskName.text = task.name
        cell.labelTaskCategory.text = task.category?.name
        //cell.labelPriority.text = task.priority?.name
        
        if let priority = task.priority {
            switch priority.index {
            case 1:
                cell.labelPriority.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            case 2:
                cell.labelPriority.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            case 3:
                cell.labelPriority.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            default:
                cell.labelPriority.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
        } else {
            cell.labelPriority.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        }
        
        if task.info == nil || (task.info?.isEmpty)! {
            cell.buttonInfo.isHidden = true
        } else {
            cell.buttonInfo.isHidden = false
        }
        
        if let diff = task.daysLeft() {
            //cell.labelTaskDate.text = dateFormatter.string(from: deadline)
            //let days = deadline - Date()
            switch diff {
            case 0:
                cell.labelTaskDate.text = "Сегодня" //TODO: локализация
            case 1:
                cell.labelTaskDate.text = "Завтра"
            case 0...:
                cell.labelTaskDate.text = "\(diff) дн."
            case ..<0:
                cell.labelTaskDate.textColor = .red
                cell.labelTaskDate.text = "\(diff) дн."
            default:
                cell.labelTaskDate.text = ""
            }
        } else {
            cell.labelTaskDate.text = ""
        }
        
        //let days = d

//        cell.textLabel?.text = task.name! + " " + (task.priority?.name ?? "")
//        if let deadline = task.deadline {
//            cell.detailTextLabel?.text = (task.category?.name)! + " " + dateFormatter.string(from: deadline)
//        } else {
//            cell.detailTextLabel?.text = task.category?.name
//        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Секция " + String(section+1)
//    }
//
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 100
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //dataBase.deleteTask(task: taskList[indexPath.row])
            taskDAO.delete(taskList[indexPath.row])
            taskList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        switch segue.identifier! {
        case "UpdateTask":
            //приводим к выбранной ячейке, чтобы потом по индексу определить выбранную задачу
            let selectedCell = sender as! TaskListCell
            let selectedIndex = (tableView.indexPath(for: selectedCell)?.row)!
            let selectedTask = taskDAO.items[selectedIndex]
            
            guard let controller = segue.destination as? TaskDetailsController else {
                fatalError("error")
            }
            
            controller.title = "Редактирование"
            controller.task = selectedTask
            controller.delegate = self
        default:
            return
        }
    }
    
    //MARK: ActionResultDelegate
    //может отрабатывать ответы (слушать действия) от любых контроллеров
    func done(source: UIViewController, data: Any?) {
        //если пришел ответ от TaskDetailsController
        if source is TaskDetailsController{
            if let selectedIndexPath = tableView.indexPathForSelectedRow{ //определяем выбранную до этого строку (если была нажата строка)
                taskDAO.save() //сохраняем измененную задачу
                tableView.reloadRows(at: [selectedIndexPath], with: .fade)//обновляем только нужную строку (не всю таблицу)
            }
            
        }
    }
}
