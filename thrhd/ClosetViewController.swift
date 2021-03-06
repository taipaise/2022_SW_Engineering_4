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
        if let data = UserDefaults.standard.value(forKey: "\(appDelegate.userID)cloth") as? Data {
            let cloth = try? PropertyListDecoder().decode(Array<imageInfo>.self, from: data)
            appDelegate.clothInfo = cloth!
        }
        collectionView.delegate = self
        collectionView.dataSource = self
        initRefresh()
        list_cloth.removeAll()
        list_season.removeAll()
        print("collection view load")
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        viewDidLoad()
//        if let data = UserDefaults.standard.value(forKey: "\(appDelegate.userID)cloth") as? Data {
//            let cloth = try? PropertyListDecoder().decode(Array<imageInfo>.self, from: data)
//            appDelegate.clothInfo = cloth!
//        }
        collectionView.reloadData()
        print("appear")
        self.navigationItem.setHidesBackButton(true, animated: true)
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
        refresh.attributedTitle = NSAttributedString(string: "????????????")
        
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
                list_cloth.append("??????")
            }
            if list_bclo[i] == true, i == 1{
                list_cloth.append("??????")
            }
            if list_bclo[i] == true, i == 2{
                list_cloth.append("?????????")
            }
            if list_bclo[i] == true, i == 3{
                list_cloth.append("??????")
            }
            if list_bsea[i] == true, i == 0{
                list_season.append("???")
            }
            if list_bsea[i] == true, i == 1{
                list_season.append("??????")
            }
            if list_bsea[i] == true, i == 2{
                list_season.append("??????")
            }
            if list_bsea[i] == true, i == 3{
                list_season.append("??????")
            }
            
        }
        print("bp: ", appDelegate.cnt)
        for i in 0..<Int(appDelegate.clothInfo.count) {
                   print(appDelegate.clothInfo.count)
                   for j in 0...3{
                       if list_bclo[j] == true, j == 0, appDelegate.clothInfo[i].getCloCate() == "??????"{
                           print("pass")
                           if list_bsea[0] == true, appDelegate.clothInfo[i].getSeaCate() == "???"{
                               tmp_list.append(appDelegate.clothInfo[i])
                               print("append: ", appDelegate.clothInfo[i].getCloCate())
                           }
                           if list_bsea[1] == true, appDelegate.clothInfo[i].getSeaCate() == "??????"{
                               tmp_list.append(appDelegate.clothInfo[i])
                               print("append: ", appDelegate.clothInfo[i].getCloCate())
                           }
                           if list_bsea[2] == true, appDelegate.clothInfo[i].getSeaCate() == "??????"{
                               tmp_list.append(appDelegate.clothInfo[i])
                               print("append: ", appDelegate.clothInfo[i].getCloCate())
                           }
                           if list_bsea[3] == true, appDelegate.clothInfo[i].getSeaCate() == "??????"{
                               tmp_list.append(appDelegate.clothInfo[i])
                               print("append: ", appDelegate.clothInfo[i].getCloCate())
                           }
                       }
                       if list_bclo[j] == true, j == 1, appDelegate.clothInfo[i].getCloCate() == "??????"{
                           print("pass")
                           if list_bsea[0] == true, appDelegate.clothInfo[i].getSeaCate() == "???"{
                               tmp_list.append(appDelegate.clothInfo[i])
                               print("append: ", appDelegate.clothInfo[i].getCloCate())
                           }
                           if list_bsea[1] == true, appDelegate.clothInfo[i].getSeaCate() == "??????"{
                               tmp_list.append(appDelegate.clothInfo[i])
                               print("append: ", appDelegate.clothInfo[i].getCloCate())
                           }
                           if list_bsea[2] == true, appDelegate.clothInfo[i].getSeaCate() == "??????"{
                               tmp_list.append(appDelegate.clothInfo[i])
                               print("append: ", appDelegate.clothInfo[i].getCloCate())
                           }
                           if list_bsea[3] == true, appDelegate.clothInfo[i].getSeaCate() == "??????"{
                               tmp_list.append(appDelegate.clothInfo[i])
                               print("append: ", appDelegate.clothInfo[i].getCloCate())
                           }
                       }
                       if list_bclo[j] == true, j == 2, appDelegate.clothInfo[i].getCloCate() == "?????????"{
                           print("pass")
                           if list_bsea[0] == true , appDelegate.clothInfo[i].getSeaCate() == "???"{
                               tmp_list.append(appDelegate.clothInfo[i])
                               print("append: ", appDelegate.clothInfo[i].getCloCate())
                           }
                           if list_bsea[1] == true, appDelegate.clothInfo[i].getSeaCate() == "??????"{
                               tmp_list.append(appDelegate.clothInfo[i])
                               print("append: ", appDelegate.clothInfo[i].getCloCate())
                           }
                           if list_bsea[2] == true, appDelegate.clothInfo[i].getSeaCate() == "??????"{
                               tmp_list.append(appDelegate.clothInfo[i])
                               print("append: ", appDelegate.clothInfo[i].getCloCate())
                           }
                           if list_bsea[3] == true, appDelegate.clothInfo[i].getSeaCate() == "??????"{
                               tmp_list.append(appDelegate.clothInfo[i])
                               print("append: ", appDelegate.clothInfo[i].getCloCate())
                           }
                       }
                       if list_bclo[j] == true, j == 3, appDelegate.clothInfo[i].getCloCate() == "??????"{
                           print("pass")
                           if list_bsea[0] == true, appDelegate.clothInfo[i].getSeaCate() == "???"{
                               tmp_list.append(appDelegate.clothInfo[i])
                               print("append: ", appDelegate.clothInfo[i].getCloCate())
                           }
                           if list_bsea[1] == true, appDelegate.clothInfo[i].getSeaCate() == "??????"{
                               tmp_list.append(appDelegate.clothInfo[i])
                               print("append: ", appDelegate.clothInfo[i].getCloCate())
                           }
                           if list_bsea[2] == true, appDelegate.clothInfo[i].getSeaCate() == "??????"{
                               tmp_list.append(appDelegate.clothInfo[i])
                               print("append: ", appDelegate.clothInfo[i].getCloCate())
                           }
                           if list_bsea[3] == true, appDelegate.clothInfo[i].getSeaCate() == "??????"{
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
                                   if list_bsea[j] == true, j == 0, appDelegate.clothInfo[i].getSeaCate() == "???"{
                                       tmp_list.append(appDelegate.clothInfo[i])
                                   }
                                   if list_bsea[j] == true, j == 1, appDelegate.clothInfo[i].getSeaCate() == "??????"{
                                       tmp_list.append(appDelegate.clothInfo[i])
                                   }
                                   if list_bsea[j] == true, j == 2, appDelegate.clothInfo[i].getSeaCate() == "??????"{
                                       tmp_list.append(appDelegate.clothInfo[i])
                                   }
                                   if list_bsea[j] == true, j == 3, appDelegate.clothInfo[i].getSeaCate() == "??????"{
                                       tmp_list.append(appDelegate.clothInfo[i])
                                   }
                                   
                               }
                       }
                       }
                       if !list_bsea.contains(true) {
                           for i in 0..<Int(appDelegate.clothInfo.count) {
                               print(appDelegate.clothInfo.count)
                               for j in 0...3{
                                   if list_bclo[j] == true, j == 0, appDelegate.clothInfo[i].getCloCate() == "??????"{
                                       tmp_list.append(appDelegate.clothInfo[i])
                                   }
                                   if list_bclo[j] == true, j == 1, appDelegate.clothInfo[i].getCloCate() == "??????"{
                                       tmp_list.append(appDelegate.clothInfo[i])
                                   }
                                   if list_bclo[j] == true, j == 2, appDelegate.clothInfo[i].getCloCate() == "?????????"{
                                       tmp_list.append(appDelegate.clothInfo[i])
                                   }
                                   if list_bclo[j] == true, j == 3, appDelegate.clothInfo[i].getCloCate() == "??????"{
                                       tmp_list.append(appDelegate.clothInfo[i])
                                   }
                                   
                               }
                       }
                       }
        
        print(list_bclo)
        //print(appDelegate.clothInfo[0].getCloCate())
        //print(tmp_list[0].getCloName())
        appDelegate.tmp_clothInfo = tmp_list
        guard let pushVC =  storyboard?.instantiateViewController(identifier: "category") as? CategoryViewController else{ return }
        if list_season.isEmpty{ pushVC.seasonText = "??????"
        }else{ pushVC.seasonText = Array(Set(list_season)).joined(separator: ",") }
        if list_cloth.isEmpty{pushVC.featureText = "??????"}else{ pushVC.featureText = list_cloth.joined(separator: ",")}
        //let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "category")
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    
}

extension ClosetViewController: CheckboxButtonDelegate {
    
    func chechboxButtonDidSelect(_ button: CheckboxButton) {
        print("Select: ", button.title(for: .normal)!)
        var str: String? = button.title(for: .normal)
        switch str!{
        case "??????":
            print("aa")
            topChecked = true
            list_bclo[0] = true
        case "??????":
            btmChecked = true
            list_bclo[1] = true
        case "?????????":
            outerChecked = true
            list_bclo[2] = true
        case "??????":
            shoesChecked = true
            list_bclo[3] = true
        case "???":
            springChecked = true
            list_bsea[0] = true
        case "??????":
            summerChecked = true
            list_bsea[1] = true
        case "??????":
            fallChecked = true
            list_bsea[2] = true
        case "??????":
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
        case "??????":
            print("aa")
            topChecked = false
            list_bclo[0] = false
        case "??????":
            btmChecked = false
            list_bclo[1] = false
        case "?????????":
            outerChecked = false
            list_bclo[2] = false
        case "??????":
            shoesChecked = false
            list_bclo[3] = false
        case "???":
            springChecked = false
            list_bsea[0] = false
        case "??????":
            summerChecked = false
            list_bsea[1] = false
        case "??????":
            fallChecked = false
            list_bsea[2] = false
        case "??????":
            winterChecked = false
            list_bsea[3] = false
            
        default:
            print("default")
        }
    }
}
    
    

