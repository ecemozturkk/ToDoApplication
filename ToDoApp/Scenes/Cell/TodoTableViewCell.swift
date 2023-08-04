//
//  TodoTableViewCell.swift
//  ToDoApp
//
//  Created by Ecem Öztürk on 4.08.2023.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    @IBOutlet weak var todoLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
