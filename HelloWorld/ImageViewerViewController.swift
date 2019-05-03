//
//  ImageViewerViewController.swift
//  HelloWorld
//
//  Created by iTung on 4/16/19.
//  Copyright © 2019 iTung. All rights reserved.
//

import UIKit

class ImageViewerViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var item: Item?
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage.init(named: item!.imageName)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    func setupView() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func swipeToRight(_ sender: UISwipeGestureRecognizer) {
        navigationController?.popViewController(animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    @IBAction func touchBtnBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
