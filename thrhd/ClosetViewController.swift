//
//  ClosetViewController.swift
//  thrhd
//
//  Created by taipaise on 2022/05/13.
//

import UIKit
import MobileCoreServices
import MBRadioCheckboxButton



class ClosetViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    @IBOutlet weak var viewGroup: CheckboxButtonContainerView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var collectionView: UICollectionView!
    var captureImage:UIImage!
    
    var topChecked : Bool!
    var btmChecked : Bool!
    var outerChecked : Bool!
    var shoesChecked : Bool!
    var springChecked : Bool!
    var summerChecked : Bool!
    var fallChecked : Bool!
    var winterChecked: Bool!
    
    var list_cloth: [String] = []
    var list_season: [String] = []
    var list_bclo: [Bool] = [false, false, false, false]
    var list_bsea: [Bool] = [false, false, false, false]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGroup()
        topChecked = false
        btmChecked = false
        outerChecked = false
        shoesChecked = false
        springChecked = false
        summerChecked = false
        fallChecked = false
        winterChecked = false
        if let data = UserDefaults.standard.value(forKey:"cloth") as? Data {
            let cloth = try? PropertyListDecoder().decode(Array<imageInfo>.self, from: data)
            appDelegate.clothInfo = cloth!
        }
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
    
    
    func setupGroup(){
        viewGroup.buttonContainer.delegate = self
    }
    
    //data source event
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appDelegate.clothInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        print("idx: ", indexPath.row)
        cell.clothImageView.image = appDelegate.clothInfo[indexPath.row].getImg()
        cell.labelClothName.text = appDelegate.clothInfo[indexPath.row].getCloName()
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
    
    @IBAction func onBtnApply(_ sender: UIButton) {
        var tmp_list: [imageInfo] = [imageInfo]()
        tmp_list.removeAll()
        for i in 0...3{
            if list_bclo[i] == true, i == 0{
                list_cloth.append("상의")
            }
            if list_bclo[i] == true, i == 1{
                list_cloth.append("하의")
            }
            if list_bclo[i] == true, i == 2{
                list_cloth.append("아우터")
            }
            if list_bclo[i] == true, i == 3{
                list_cloth.append("신발")
            }
            if list_bsea[i] == true, i == 0{
                list_season.append("봄")
            }
            if list_bsea[i] == true, i == 1{
                list_season.append("여름")
            }
            if list_bsea[i] == true, i == 2{
                list_season.append("가을")
            }
            if list_bsea[i] == true, i == 3{
                list_season.append("겨울")
            }
            
        }
        print("bp: ", appDelegate.cnt)
        for i in 0..<Int(appDelegate.clothInfo.count) {
            print(appDelegate.clothInfo.count)
            for j in 0...3{
                if list_bclo[j] == true, j == 0, appDelegate.clothInfo[i].getCloCate() == "상의"{
                    print("pass")
                    if list_bsea[0] == true, appDelegate.clothInfo[i].getSeaCate() == "봄"{
                        tmp_list.append(appDelegate.clothInfo[i])
                        print("append: ", appDelegate.clothInfo[i].getCloCate())
                    }
                    else if list_bsea[1] == true, appDelegate.clothInfo[i].getSeaCate() == "여름"{
                        tmp_list.append(appDelegate.clothInfo[i])
                        print("append: ", appDelegate.clothInfo[i].getCloCate())
                    }
                    else if list_bsea[2] == true, appDelegate.clothInfo[i].getSeaCate() == "가을"{
                        tmp_list.append(appDelegate.clothInfo[i])
                        print("append: ", appDelegate.clothInfo[i].getCloCate())
                    }
                    else if list_bsea[3] == true, appDelegate.clothInfo[i].getSeaCate() == "겨울"{
                        tmp_list.append(appDelegate.clothInfo[i])
                        print("append: ", appDelegate.clothInfo[i].getCloCate())
                    }
                }
                if list_bclo[j] == true, j == 1, appDelegate.clothInfo[i].getCloCate() == "하의"{
                    print("pass")
                    if list_bsea[0] == true, appDelegate.clothInfo[i].getSeaCate() == "봄"{
                        tmp_list.append(appDelegate.clothInfo[i])
                        print("append: ", appDelegate.clothInfo[i].getCloCate())
                    }
                    else if list_bsea[1] == true, appDelegate.clothInfo[i].getSeaCate() == "여름"{
                        tmp_list.append(appDelegate.clothInfo[i])
                        print("append: ", appDelegate.clothInfo[i].getCloCate())
                    }
                    else if list_bsea[2] == true, appDelegate.clothInfo[i].getSeaCate() == "가을"{
                        tmp_list.append(appDelegate.clothInfo[i])
                        print("append: ", appDelegate.clothInfo[i].getCloCate())
                    }
                    else if list_bsea[3] == true, appDelegate.clothInfo[i].getSeaCate() == "겨울"{
                        tmp_list.append(appDelegate.clothInfo[i])
                        print("append: ", appDelegate.clothInfo[i].getCloCate())
                    }
                }
                if list_bclo[j] == true, j == 2, appDelegate.clothInfo[i].getCloCate() == "아우터"{
                    print("pass")
                    if list_bsea[0] == true , appDelegate.clothInfo[i].getSeaCate() == "봄"{
                        tmp_list.append(appDelegate.clothInfo[i])
                        print("append: ", appDelegate.clothInfo[i].getCloCate())
                    }
                    else if list_bsea[1] == true, appDelegate.clothInfo[i].getSeaCate() == "여름"{
                        tmp_list.append(appDelegate.clothInfo[i])
                        print("append: ", appDelegate.clothInfo[i].getCloCate())
                    }
                    else if list_bsea[2] == true, appDelegate.clothInfo[i].getSeaCate() == "가을"{
                        tmp_list.append(appDelegate.clothInfo[i])
                        print("append: ", appDelegate.clothInfo[i].getCloCate())
                    }
                    else if list_bsea[3] == true, appDelegate.clothInfo[i].getSeaCate() == "겨울"{
                        tmp_list.append(appDelegate.clothInfo[i])
                        print("append: ", appDelegate.clothInfo[i].getCloCate())
                    }
                }
                if list_bclo[j] == true, j == 3, appDelegate.clothInfo[i].getCloCate() == "신발"{
                    print("pass")
                    if list_bsea[0] == true, appDelegate.clothInfo[i].getSeaCate() == "봄"{
                        tmp_list.append(appDelegate.clothInfo[i])
                        print("append: ", appDelegate.clothInfo[i].getCloCate())
                    }
                    else if list_bsea[1] == true, appDelegate.clothInfo[i].getSeaCate() == "여름"{
                        tmp_list.append(appDelegate.clothInfo[i])
                        print("append: ", appDelegate.clothInfo[i].getCloCate())
                    }
                    else if list_bsea[2] == true, appDelegate.clothInfo[i].getSeaCate() == "가을"{
                        tmp_list.append(appDelegate.clothInfo[i])
                        print("append: ", appDelegate.clothInfo[i].getCloCate())
                    }
                    else if list_bsea[3] == true, appDelegate.clothInfo[i].getSeaCate() == "겨울"{
                        tmp_list.append(appDelegate.clothInfo[i])
                        print("append: ", appDelegate.clothInfo[i].getCloCate())
                    }
                }
                
            }
        }
                if !list_bclo.contains(true) {
                    for i in 0..<Int(appDelegate.clothInfo.count) {
                        print(appDelegate.clothInfo.count)
                        for j in 0...3{
                            if list_bsea[j] == true, j == 0, appDelegate.clothInfo[i].getSeaCate() == "봄"{
                                tmp_list.append(appDelegate.clothInfo[i])
                            }
                            if list_bsea[j] == true, j == 1, appDelegate.clothInfo[i].getSeaCate() == "여름"{
                                tmp_list.append(appDelegate.clothInfo[i])
                            }
                            if list_bsea[j] == true, j == 2, appDelegate.clothInfo[i].getSeaCate() == "여름"{
                                tmp_list.append(appDelegate.clothInfo[i])
                            }
                            if list_bsea[j] == true, j == 3, appDelegate.clothInfo[i].getSeaCate() == "겨울"{
                                tmp_list.append(appDelegate.clothInfo[i])
                            }
                            
                        }
                }
                }
                if !list_bsea.contains(true) {
                    for i in 0..<Int(appDelegate.clothInfo.count) {
                        print(appDelegate.clothInfo.count)
                        for j in 0...3{
                            if list_bclo[j] == true, j == 0, appDelegate.clothInfo[i].getCloCate() == "상의"{
                                tmp_list.append(appDelegate.clothInfo[i])
                            }
                            if list_bclo[j] == true, j == 1, appDelegate.clothInfo[i].getCloCate() == "하의"{
                                tmp_list.append(appDelegate.clothInfo[i])
                            }
                            if list_bclo[j] == true, j == 2, appDelegate.clothInfo[i].getCloCate() == "아우터"{
                                tmp_list.append(appDelegate.clothInfo[i])
                            }
                            if list_bclo[j] == true, j == 3, appDelegate.clothInfo[i].getCloCate() == "신발"{
                                tmp_list.append(appDelegate.clothInfo[i])
                            }
                            
                        }
                }
                }
        
        print(list_bclo)
        print(appDelegate.clothInfo[0].getCloCate())
        //print(tmp_list[0].getCloName())
        appDelegate.tmp_clothInfo = tmp_list
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "category")
        self.navigationController?.pushViewController(pushVC!, animated: true)
    }
    
    
}

extension ClosetViewController: CheckboxButtonDelegate {
    
    func chechboxButtonDidSelect(_ button: CheckboxButton) {
        print("Select: ", button.title(for: .normal)!)
        var str: String? = button.title(for: .normal)
        switch str!{
        case "상의":
            print("aa")
            topChecked = true
            list_bclo[0] = true
        case "하의":
            btmChecked = true
            list_bclo[1] = true
        case "아우터":
            outerChecked = true
            list_bclo[2] = true
        case "신발":
            shoesChecked = true
            list_bclo[3] = true
        case "봄":
            springChecked = true
            list_bsea[0] = true
        case "여름":
            summerChecked = true
            list_bsea[1] = true
        case "가을":
            fallChecked = true
            list_bsea[2] = true
        case "겨울":
            winterChecked = true
            list_bsea[3] = true
            
        default:
            print("default")
        }
    }
    
    func chechboxButtonDidDeselect(_ button: CheckboxButton) {
        print("Deselect: ", button.title(for: .normal)!)
        var str: String? = button.title(for: .normal)
        switch str!{
        case "상의":
            print("aa")
            topChecked = false
            list_bclo[0] = false
        case "하의":
            btmChecked = false
            list_bclo[1] = false
        case "아우터":
            outerChecked = false
            list_bclo[2] = false
        case "신발":
            shoesChecked = false
            list_bclo[3] = false
        case "봄":
            springChecked = false
            list_bsea[0] = false
        case "여름":
            summerChecked = false
            list_bsea[1] = false
        case "가을":
            fallChecked = false
            list_bsea[2] = false
        case "겨울":
            winterChecked = false
            list_bsea[3] = false
            
        default:
            print("default")
        }
    }
}
    
    

