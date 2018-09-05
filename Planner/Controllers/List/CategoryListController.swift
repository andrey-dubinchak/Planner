//
//  CategoryListController.swift
//  Planner
//
//  Created by Andrey Dubinchak on 05.09.2018.
//  Copyright © 2018 Andrey Dubinchak. All rights reserved.
//

import UIKit

class CategoryListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let categoryDao = CategoryDaoDbImpl.current
    var selectedCategory: Category! //текущая категория задачи
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryDao.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCategory", for: indexPath) as! CategoryListCell
        
        let category = categoryDao.items[indexPath.row] //получаем каждую категорию из массива, чтобы отобразить название
        
        //если категория совпадает с текущей - показываем зеленую иконку
        
        if selectedCategory != nil && selectedCategory == category {
            cell.buttonCheckCategory.setImage(UIImage(named: "check_green"), for: .normal)
        } else {
            cell.buttonCheckCategory.setImage(UIImage(named: "check_grey"), for: .normal)
        }
        
        cell.labelCategoryName.text = category.name
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
