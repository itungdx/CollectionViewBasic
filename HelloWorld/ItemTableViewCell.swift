//
//  ItemTableViewCell.swift
//  HelloWorld
//
//  Created by iTung on 5/6/19.
//  Copyright © 2019 iTung. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    @IBOutlet weak var nameCollectionView: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
