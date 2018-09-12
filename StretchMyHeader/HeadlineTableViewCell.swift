//
//  HeadlineTableViewCell.swift
//  StretchMyHeader
//
//  Created by Kit Clark-O'Neil on 2018-09-11.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

import UIKit

class HeadlineTableViewCell: UITableViewCell {

    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
