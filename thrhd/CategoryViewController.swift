//
//  CategoryViewController.swift
//  thrhd
//
//  Created by 최다경 on 2022/06/05.
//

import UIKit

class CategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("load: ", appDelegate.tmp_clothInfo.count)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appDelegate.tmp_clothInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("idx path: ", indexPath.row)
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell2", for: indexPath) as! MyCollectionViewCell2
        print(indexPath.row)
        cell.imagevView.image = appDelegate.tmp_clothInfo[indexPath.row].getImg()
        cell.labelName.text = appDelegate.tmp_clothInfo[indexPath.row].getCloName()
        print("idx.row: ", indexPath.row, "img: ", cell.imagevView.image!)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat((180)), height: CGFloat(170))
    }
    

}
