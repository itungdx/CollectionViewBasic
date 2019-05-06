//
//  DogsPinterestViewController.swift
//  HelloWorld
//
//  Created by iTung on 5/6/19.
//  Copyright © 2019 iTung. All rights reserved.
//

import UIKit
import AVFoundation

class DogsPinterestViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    var collectionViewLayout: UICollectionViewLayout!
    var items : [Item] = [Item(imageName: "1"),
                          Item(imageName: "2"),
                          Item(imageName: "3"),
                          Item(imageName: "4"),
                          Item(imageName: "5"),
                          Item(imageName: "6"),
                          Item(imageName: "7"),
                          Item(imageName: "8"),
                          Item(imageName: "9"),
                          Item(imageName: "10"),
                          Item(imageName: "11"),
                          Item(imageName: "12")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
            }
        }
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        setupCollectionViewItemSize()
//    }

    @IBAction func swipeToRight(_ sender: UISwipeGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupCollectionViewItemSize() {
        if collectionViewFlowLayout == nil {
            let numberOfItemFerRow: CGFloat = 2
            let lineSpacing: CGFloat = 15
            let interItemSpacing: CGFloat = 15
            
            let width = (UIScreen.main.bounds.width - (numberOfItemFerRow - 1) * interItemSpacing) / numberOfItemFerRow
            
            let height = width

            collectionViewFlowLayout = UICollectionViewFlowLayout()
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true, completion: nil)
        }
    }
}

extension DogsPinterestViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DogsPinterestCollectionViewCell", for: indexPath) as! DogsPinterestCollectionViewCell
        cell.imgDog.image = UIImage(named: items[indexPath.item].imageName)
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
//        return CGSize(width: itemSize, height: itemSize)
//    }
}

extension DogsPinterestViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let imageDog = UIImage(named: items[indexPath.item].imageName)
        return imageDog!.size.height
    }
}
