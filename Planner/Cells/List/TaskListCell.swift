//
//  TaskListCell.swift
//  Planner
//
//  Created by Andrey Dubinchak on 14.08.2018.
//  Copyright © 2018 Andrey Dubinchak. All rights reserved.
//

import UIKit

class TaskListCell: UITableViewCell {

    @IBOutlet weak var labelTaskName: UILabel!
    
    @IBOutlet weak var labelTaskCategory: UILabel!
    
    @IBOutlet weak var labelTaskDate: UILabel!
    
    @IBOutlet weak var labelPriority: UILabel!
    
    @IBOutlet weak var buttonInfo: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
