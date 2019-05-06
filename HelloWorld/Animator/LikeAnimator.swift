//
//  LikeAnimator.swift
//  HelloWorld
//
//  Created by iTung on 4/16/19.
//  Copyright © 2019 iTung. All rights reserved.
//

import UIKit

class LikeAnimator {
    let container: UIView
    let layoutConstraint: NSLayoutConstraint
    init(container: UIView, layoutConstraint: NSLayoutConstraint) {
        self.container = container
        self.layoutConstraint = layoutConstraint
    }
    
    func animate(completion: @escaping () -> Void) {
        layoutConstraint.constant = 100
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .curveLinear, animations: {
            [weak self] in
            self?.container.layoutIfNeeded()
        }) { [weak self] (_) in
            self?.layoutConstraint.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
                self?.container.layoutIfNeeded()
                completion()
            })
        
        }
    }
}
