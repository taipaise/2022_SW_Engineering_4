//
//  ClothInfoEditViewController.swift
//  thrhd
//
//  Created by 최다경 on 2022/05/26.
//

import UIKit
import Toast_Swift

class ClothInfoEditViewController: UIViewController {

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
    var clothText: String = ""
    var seasonText: String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editCloImage.image = appDelegate.clothInfo[appDelegate.idx].clothImage
        editCloName.text = appDelegate.clothInfo[appDelegate.idx].clothName
        editClocate.text = appDelegate.clothInfo[appDelegate.idx].clothCategory
        editClosea.text = appDelegate.clothInfo[appDelegate.idx].seasonCategory
        
        
    }
    
    @IBAction func onBtnEdit(_ sender: UIButton) {
        appDelegate.clothInfo[appDelegate.idx].clothName = changeCloName.text!
        appDelegate.clothInfo[appDelegate.idx].clothCategory = clothText
        appDelegate.clothInfo[appDelegate.idx].seasonCategory = seasonText
        
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
