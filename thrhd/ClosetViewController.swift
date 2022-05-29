//
//  ClosetViewController.swift
//  thrhd
//
//  Created by taipaise on 2022/05/13.
//

import UIKit
import MobileCoreServices



class ClosetViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var collectionView: UICollectionView!

    var captureImage:UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        initRefresh()
        print("collection view load")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        collectionView.reloadData()
        print("appear")
    }
    
    //data source event
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appDelegate.clothInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        cell.clothImageView.image = appDelegate.clothInfo[indexPath.row].clothImage
        cell.labelClothName.text = appDelegate.clothInfo[indexPath.row].clothName
        print("idx.row: ", indexPath.row, "img: ", cell.clothImageView.image!)
        
        return cell
        
    }

    //normal event
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item selected: ", indexPath.row)
        let newVC = self.storyboard?.instantiateViewController(withIdentifier: "editVC") as! ClothInfoEditViewController
        appDelegate.idx = indexPath.row
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat((180)), height: CGFloat(170))
    }
    
    func initRefresh(){
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(updateUI(refresh: )), for: .valueChanged)
        refresh.attributedTitle = NSAttributedString(string: "새로고침")
        
        if #available(iOS 10.0, *){
            collectionView.refreshControl = refresh
        } else{
            collectionView.addSubview(refresh)
        }
    }
    
    @objc func updateUI(refresh: UIRefreshControl){
        refresh.endRefreshing()
        collectionView.reloadData()
    }
    
   
}
