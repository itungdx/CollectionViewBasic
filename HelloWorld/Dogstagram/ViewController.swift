//
//  ViewController.swift
//  HelloWorld
//
//  Created by iTung on 4/3/19.
//  Copyright © 2019 iTung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    let cellIndentifier = "ItemCollectionViewCell"
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
        setupCollectionView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        registerForPreviewing(with: self, sourceView: collectionView)
        let nib = UINib(nibName: "ItemCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIndentifier)
    }
    
    private func setupCollectionViewItemSize() {
        if collectionViewFlowLayout == nil {
            let numberOfItemFerRow: CGFloat = 2
            let lineSpacing: CGFloat = 5
            let interItemSpacing: CGFloat = 5
            
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
    
    @IBAction func swipeToRight(_ sender: UISwipeGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIndentifier, for: indexPath) as! ItemCollectionViewCell
        cell.imageView.image = UIImage(named: items[indexPath.item].imageName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelect")
        let imageViewerViewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "ImageViewerViewController") as! ImageViewerViewController
        imageViewerViewController.item = items[indexPath.item]
        navigationController?.pushViewController(imageViewerViewController, animated: true)
    }
}

extension ViewController: UIViewControllerPreviewingDelegate {
    //show preview VC
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard let indexPath = collectionView.indexPathForItem(at: location) else {
            return nil
        }
        let imageViewerViewController = createDetailInterviewScheduleViewControllerIndexPath(indexPath: indexPath)
        return imageViewerViewController
    }
    //show final VC
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
    }
    //
    private func createDetailInterviewScheduleViewControllerIndexPath(indexPath: IndexPath) -> ImageViewerViewController {
        let imageViewerViewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "ImageViewerViewController") as! ImageViewerViewController
        imageViewerViewController.item = self.items[indexPath.row]
        return imageViewerViewController
    }
}

struct Item {
    var imageName: String
}
