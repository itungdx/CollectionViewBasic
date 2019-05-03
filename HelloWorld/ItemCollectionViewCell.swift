//
//  ItemCollectionViewCell.swift
//  HelloWorld
//
//  Created by iTung on 4/16/19.
//  Copyright © 2019 iTung. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var likedImageView: UIImageView!
    @IBOutlet weak var likeImageViewWidthConstraint: NSLayoutConstraint!
    
    lazy var likeAnimator = LikeAnimator(container: contentView, layoutConstraint: likeImageViewWidthConstraint)
    
    lazy var doubleTapRecognizer: UITapGestureRecognizer = {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didDoubleTap))
        tapRecognizer.numberOfTapsRequired = 2
        tapRecognizer.delaysTouchesBegan = true
        tapRecognizer.cancelsTouchesInView = true
        return tapRecognizer
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.addGestureRecognizer(doubleTapRecognizer)
    }
    
    @objc func didDoubleTap() {
        likeAnimator.animate {
            if self.likedImageView.isHidden == false {
                self.likedImageView.isHidden = true
            } else {
                self.likedImageView.isHidden = false
            }
        }
    }
}
