//
//  DogsPinterestCollectionViewCell.swift
//  HelloWorld
//
//  Created by iTung on 5/6/19.
//  Copyright © 2019 iTung. All rights reserved.
//

import UIKit

class DogsPinterestCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imgDog: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 6
        containerView.layer.masksToBounds = true
    }
}
