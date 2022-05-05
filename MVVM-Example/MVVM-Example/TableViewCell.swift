//
//  TableViewCell.swift
//  MVVM-Example
//
//  Created by madilyn on 2022/05/05.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data: ToDoModelElement) {
        indexLabel.text = "\(data.id)"
        titleLabel.text = data.title
    }
}
