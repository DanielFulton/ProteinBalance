//
//  NewMealTypeCell.swift
//  Protein
//
//  Created by FultonDaniel on 2017/03/04.
//  Copyright © 2017 FultonDaniel. All rights reserved.
//

import UIKit

class NewMealTypeCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    class func identifier() -> String {
        return "type"
    }
}
