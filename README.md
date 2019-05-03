# CollectionViewBasic
![Screen Shot 2019-05-03 at 8 57 01 AM](https://user-images.githubusercontent.com/14018899/57116804-aea88800-6d81-11e9-840a-cf7049a09133.png)
* How to setup CollectionView Item Size?
```swift
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
```
* How to fix conflit didSelected and TapGestureRecognizer?
<br />When you set TapGestureRecognizer = 2 with cell in TableView or CollectionView, you need insert code in ItemCollectionViewCell

```swift
lazy var doubleTapRecognizer: UITapGestureRecognizer = {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didDoubleTap))
        tapRecognizer.numberOfTapsRequired = 2
        tapRecognizer.delaysTouchesBegan = true
        tapRecognizer.cancelsTouchesInView = true
        return tapRecognizer
    }()
```

