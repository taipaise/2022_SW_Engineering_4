//
//  ClothInfoEditViewController.swift
//  thrhd
//
//  Created by 최다경 on 2022/05/26.
//

import UIKit
import Toast_Swift

class ClothInfoEditViewController: UIViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){self.view.endEditing(true) }
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var editCloImage: UIImageView!
    @IBOutlet weak var editCloName: UILabel!
    @IBOutlet weak var editClocate: UILabel!
    @IBOutlet weak var editClosea: UILabel!
    @IBOutlet weak var editCloDate: UILabel!
    
    @IBOutlet weak var changeCloName: UITextField!
    @IBOutlet weak var changeCateSeg: UISegmentedControl!
    @IBOutlet weak var changeSeaSeg: UISegmentedControl!
    
    var tmp_name: String = ""
    var clothText: String = "아우터"
    var seasonText: String = "봄"

    
    @IBAction func btnDeleteClicked(_ sender: Any) {
        let deleteAlert = UIAlertController(title: "알림", message: "정말 삭제하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let yes = UIAlertAction(title: "네", style: UIAlertAction.Style.default) {(_) in
            self.appDelegate.clothInfo.remove(at: self.appDelegate.idx)
            self.appDelegate.cnt -= 1
            if let idx = self.appDelegate.clothName.firstIndex(of: self.editCloName.text!) {
                self.appDelegate.clothName.remove(at: idx)
            }
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.appDelegate.clothInfo), forKey:"\(self.appDelegate.userID)cloth")
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.appDelegate.clothName), forKey:"\(self.appDelegate.userID)name")
        
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.navigationController?.popViewController(animated: true)
            }
        }
        let no = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
        deleteAlert.addAction(yes)
        deleteAlert.addAction(no)
        present(deleteAlert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clothText = "아우터"
        seasonText = "봄"
        editCloImage.image = appDelegate.clothInfo[appDelegate.idx].getImg()
        editCloName.text = appDelegate.clothInfo[appDelegate.idx].getCloName()
        editClocate.text = appDelegate.clothInfo[appDelegate.idx].getCloCate()
        editClosea.text = appDelegate.clothInfo[appDelegate.idx].getSeaCate()
        
        
    }
    
    @IBAction func onBtnEdit(_ sender: UIButton) {
        if let idx = appDelegate.clothName.firstIndex(of: editCloName.text!) {
            appDelegate.clothName.remove(at: idx)
        }
        appDelegate.clothInfo[appDelegate.idx].setCloName(ClothName: changeCloName.text!)
        appDelegate.clothInfo[appDelegate.idx].setCloCate(CloCate: clothText)
        appDelegate.clothInfo[appDelegate.idx].setSeaCate(SeaCate: seasonText)
        appDelegate.clothName.append(changeCloName.text!)
        
        UserDefaults.standard.set(try? PropertyListEncoder().encode(appDelegate.clothInfo), forKey:"\(appDelegate.userID)cloth")
        UserDefaults.standard.set(try? PropertyListEncoder().encode(appDelegate.clothName), forKey:"\(appDelegate.userID)name")
        self.view.makeToast("수정되었습니다.", duration: 2.0, position: .bottom)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.navigationController?.popViewController(animated: true)
        }
        
        
    }
    
    @IBAction func CloSeg(_ sender: UISegmentedControl) {
        
        switch changeCateSeg.selectedSegmentIndex {
        case 0:
            clothText = "아우터"
        case 1 :
            clothText = "상의"
        case 2:
            clothText = "하의"
        case 3:
            clothText = "신발"
        case 4:
            clothText = ""
        default:
            break
        }
    }
    
    @IBAction func SeaSeg(_ sender: UISegmentedControl) {
        switch changeSeaSeg.selectedSegmentIndex {
        case 0:
            seasonText = "봄"
        case 1 :
            seasonText = "여름"
        case 2:
            seasonText = "가을"
        case 3:
            seasonText = "겨울"
        default:
            break
        }
    }
    
}
