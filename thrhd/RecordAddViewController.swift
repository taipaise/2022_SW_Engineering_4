//
//  RecordAddViewController.swift
//  thrhd
//
//  Created by taipaise on 2022/05/26.
//

import UIKit
import DropDown

class RecordAddViewController: UIViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){self.view.endEditing(true) }
    var date : String!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var topName : String!
    var bottomName : String!
    var outerName : String!
    var shoesName : String!
    var rating : Int = 0
    var comment : String!

    @IBOutlet weak var starSeg: UISegmentedControl!

    @IBOutlet weak var top: UIImageView!
    @IBOutlet weak var bottom: UIImageView!
    @IBOutlet weak var outer: UIImageView!
    @IBOutlet weak var shoes: UIImageView!

    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!


    @IBOutlet weak var dropView1: UIView!
    @IBOutlet weak var tfInput1: UITextField!
    @IBOutlet weak var ivIcon1: UIImageView!
    @IBOutlet weak var btnSelect1: UIButton!


    @IBOutlet weak var dropView2: UIView!
    @IBOutlet weak var tfInput2: UITextField!
    @IBOutlet weak var ivIcon2: UIImageView!
    @IBOutlet weak var btnSelect2: UIButton!

    @IBOutlet weak var dropView3: UIView!
    @IBOutlet weak var tfInput3: UITextField!
    @IBOutlet weak var ivIcon3: UIImageView!
    @IBOutlet weak var btnSelect3: UIButton!


    @IBOutlet weak var dropView4: UIView!
    @IBOutlet weak var tfInput4: UITextField!
    @IBOutlet weak var ivIcon4: UIImageView!
    @IBOutlet weak var btnSelect4: UIButton!

    @IBOutlet weak var tfComment: UITextField!

    @IBOutlet weak var labelDate: UILabel!

    let dropdown1 = DropDown()
    let dropdown2 = DropDown()
    let dropdown3 = DropDown()
    let dropdown4 = DropDown()

    var starRating = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        top.image = #imageLiteral(resourceName: "top")
        bottom.image = #imageLiteral(resourceName: "bottom")
        outer.image = #imageLiteral(resourceName: "outer")
        shoes.image = #imageLiteral(resourceName: "shoes")
        star1.image = #imageLiteral(resourceName: "empty_star")
        star2.image = #imageLiteral(resourceName: "empty_star")
        star3.image = #imageLiteral(resourceName: "empty_star")
        star4.image = #imageLiteral(resourceName: "empty_star")
        star5.image = #imageLiteral(resourceName: "empty_star")
        initUI()
        setDropdown1()
        setDropdown2()
        setDropdown3()
        setDropdown4()
        labelDate.text = date

    }
    // DropDown UI ?????????
    func initUI() {
        DropDown.appearance().textColor = UIColor.black
        DropDown.appearance().selectedTextColor = UIColor.gray
        DropDown.appearance().backgroundColor = UIColor.white // ????????? ?????? ?????? ??????
        DropDown.appearance().selectionBackgroundColor = UIColor.lightGray
        DropDown.appearance().setupCornerRadius(8)
        dropdown1.dismissMode = .automatic // ????????? ?????? ?????? ??????
        dropdown2.dismissMode = .automatic // ????????? ?????? ?????? ??????
        dropdown3.dismissMode = .automatic // ????????? ?????? ?????? ??????
        dropdown4.dismissMode = .automatic // ????????? ?????? ?????? ??????
 
        tfInput1.text = "??????(no_item)"
        tfInput2.text = "??????(no_item)"
        tfInput3.text = "?????????(no_item)"
        tfInput4.text = "??????(no_item)"
            
        ivIcon1.tintColor = UIColor.gray
        ivIcon2.tintColor = UIColor.gray
        ivIcon3.tintColor = UIColor.gray
        ivIcon4.tintColor = UIColor.gray
        self.ivIcon1.image = UIImage.init(named: "downarrow.png")
        self.ivIcon2.image = UIImage.init(named: "downarrow.png")
        self.ivIcon3.image = UIImage.init(named: "downarrow.png")
        self.ivIcon4.image = UIImage.init(named: "downarrow.png")
    }


    func setDropdown1() {
        // dataSource??? ItemList??? ??????
        dropdown1.dataSource = appDelegate.clothName

        // anchorView??? ?????? UI??? ??????
        dropdown1.anchorView = self.dropView1

        // View??? ????????? ?????? View????????? Item ????????? ????????? ??????
        dropdown1.bottomOffset = CGPoint(x: 0, y: dropView1.bounds.height)

        // Item ?????? ??? ??????
        dropdown1.selectionAction = { [weak self] (index, item) in
            //????????? Item??? TextField??? ????????????.
            self!.tfInput1.text = item
            self!.topName = item
            if let cloIndex = self!.appDelegate.clothInfo.firstIndex(where: {$0.getCloName() == item}){
                self!.top.image = self!.appDelegate.clothInfo[cloIndex].getImg()
            }
            self!.ivIcon1.image = UIImage.init(named: "downarrow.png")
        }

        // ?????? ??? ??????
        dropdown1.cancelAction = { [weak self] in
            //??? ?????? ?????? ??? DropDown??? ???????????? ???????????? ???????????? ??????
            self!.ivIcon1.image = UIImage.init(named: "downarrow.png")
        }
    }
    func setDropdown2() {
        // dataSource??? ItemList??? ??????
        dropdown2.dataSource = appDelegate.clothName

        // anchorView??? ?????? UI??? ??????
        dropdown2.anchorView = self.dropView2

        // View??? ????????? ?????? View????????? Item ????????? ????????? ??????
        dropdown2.bottomOffset = CGPoint(x: 0, y: dropView2.bounds.height)

        // Item ?????? ??? ??????
        dropdown2.selectionAction = { [weak self] (index: Int, item: String) in
            //????????? Item??? TextField??? ????????????.
            self!.bottomName = item
            self!.tfInput2.text = item
            if let cloIndex = self!.appDelegate.clothInfo.firstIndex(where: {$0.getCloName() == item}){
                self!.bottom.image = self!.appDelegate.clothInfo[cloIndex].getImg()
            }
            self!.ivIcon2.image = UIImage.init(named: "downarrow.png")
        }

        // ?????? ??? ??????
        dropdown2.cancelAction = { [weak self] in
            //??? ?????? ?????? ??? DropDown??? ???????????? ???????????? ???????????? ??????
            self!.ivIcon2.image = UIImage.init(named: "downarrow.png")
        }
    }
    func setDropdown3() {
        // dataSource??? ItemList??? ??????
        dropdown3.dataSource = appDelegate.clothName

        // anchorView??? ?????? UI??? ??????
        dropdown3.anchorView = self.dropView3

        // View??? ????????? ?????? View????????? Item ????????? ????????? ??????
        dropdown3.bottomOffset = CGPoint(x: 0, y: dropView3.bounds.height)

        // Item ?????? ??? ??????
        dropdown3.selectionAction = { [weak self] (index, item) in
            //????????? Item??? TextField??? ????????????.
            self!.outerName = item
            self!.tfInput3.text = item
            if let cloIndex = self!.appDelegate.clothInfo.firstIndex(where: {$0.getCloName() == item}){
                self!.outer.image = self!.appDelegate.clothInfo[cloIndex].getImg()
            }
            self!.ivIcon3.image = UIImage.init(named: "downarrow.png")
        }

        // ?????? ??? ??????
        dropdown3.cancelAction = { [weak self] in
            //??? ?????? ?????? ??? DropDown??? ???????????? ???????????? ???????????? ??????
            self!.ivIcon3.image = UIImage.init(named: "downarrow.png")
        }
    }
    func setDropdown4() {
        // dataSource??? ItemList??? ??????
        dropdown4.dataSource = appDelegate.clothName


        // anchorView??? ?????? UI??? ??????
        dropdown4.anchorView = self.dropView4

        // View??? ????????? ?????? View????????? Item ????????? ????????? ??????
        dropdown4.bottomOffset = CGPoint(x: 0, y: dropView4.bounds.height)

        // Item ?????? ??? ??????
        dropdown4.selectionAction = { [weak self] (index, item) in
            //????????? Item??? TextField??? ????????????.
            self!.shoesName = item
            self!.tfInput4.text = item
            if let cloIndex = self!.appDelegate.clothInfo.firstIndex(where: {$0.getCloName() == item}){
                self!.shoes.image = self!.appDelegate.clothInfo[cloIndex].getImg()
            }
            self!.ivIcon4.image = UIImage.init(named: "downarrow.png")
        }

        // ?????? ??? ??????
        dropdown4.cancelAction = { [weak self] in
            //??? ?????? ?????? ??? DropDown??? ???????????? ???????????? ???????????? ??????
            self!.ivIcon4.image = UIImage.init(named: "downarrow.png")
        }
    }

    @IBAction func drop1Clicked(_ sender: Any) {
        dropdown1.show()
        self.ivIcon1.image = UIImage.init(named: "uparrow.png")
    }

    @IBAction func drop2Clicked(_ sender: Any) {
        dropdown2.show()
        self.ivIcon2.image = UIImage.init(named: "uparrow.png")
    }

    @IBAction func drop3Clicked(_ sender: Any) {
        dropdown3.show()
        self.ivIcon3.image = UIImage.init(named: "uparrow.png")
    }

    @IBAction func drop4Clicked(_ sender: Any) {
        dropdown4.show()
        self.ivIcon4.image = UIImage.init(named: "uparrow.png")
    }


    @IBAction func starSegAction(_ sender: Any) {
        switch starSeg.selectedSegmentIndex {
        case 0 :
            starRating = "1"
            star1.image = #imageLiteral(resourceName: "full_star")
            star2.image = #imageLiteral(resourceName: "empty_star")
            star3.image = #imageLiteral(resourceName: "empty_star")
            star4.image = #imageLiteral(resourceName: "empty_star")
            star5.image = #imageLiteral(resourceName: "empty_star")
            rating = 1
        case 1:
            starRating = "2"
            star1.image = #imageLiteral(resourceName: "full_star")
            star2.image = #imageLiteral(resourceName: "full_star")
            star3.image = #imageLiteral(resourceName: "empty_star")
            star4.image = #imageLiteral(resourceName: "empty_star")
            star5.image = #imageLiteral(resourceName: "empty_star")
            rating = 2
        case 2:
            starRating = "3"
            star1.image = #imageLiteral(resourceName: "full_star")
            star2.image = #imageLiteral(resourceName: "full_star")
            star3.image = #imageLiteral(resourceName: "full_star")
            star4.image = #imageLiteral(resourceName: "empty_star")
            star5.image = #imageLiteral(resourceName: "empty_star")
            rating = 3
        case 3:
            starRating = "4"
            star1.image = #imageLiteral(resourceName: "full_star")
            star2.image = #imageLiteral(resourceName: "full_star")
            star3.image = #imageLiteral(resourceName: "full_star")
            star4.image = #imageLiteral(resourceName: "full_star")
            star5.image = #imageLiteral(resourceName: "empty_star")
            rating = 4
        case 4:
            starRating = "4"
            star1.image = #imageLiteral(resourceName: "full_star")
            star2.image = #imageLiteral(resourceName: "full_star")
            star3.image = #imageLiteral(resourceName: "full_star")
            star4.image = #imageLiteral(resourceName: "full_star")
            star5.image = #imageLiteral(resourceName: "full_star")
            rating = 5
        default:
            break
        }
    }

    @IBAction func btnUpdateComClicked(_ sender: Any) {
        comment = tfComment.text!

        appDelegate.recordInfo.append(record(top: topName, bottom: bottomName, outer: outerName, shoes: shoesName, date: date, rating: rating, comment: comment))
        appDelegate.recCnt += 1
//        print(appDelegate.recordInfo[appDelegate.recCnt].getCloTop())
//        print(appDelegate.recordInfo[appDelegate.recCnt].getCloBtm())
//        print(appDelegate.recordInfo[appDelegate.recCnt].getCloOut())
//        print(appDelegate.recordInfo[appDelegate.recCnt].getCloOut())
//        print(appDelegate.recordInfo[appDelegate.recCnt].getClosho())
//        print(appDelegate.recordInfo[appDelegate.recCnt].getCloRate())
//        print(appDelegate.recordInfo[appDelegate.recCnt].getCloCom())
        
        print("record struct array length: ", appDelegate.recordInfo.count)

        UserDefaults.standard.set(try? PropertyListEncoder().encode(appDelegate.recordInfo), forKey:"\(appDelegate.userID)record")
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd"
        let dateString = formatter.date(from: date)
        appDelegate.date.append(dateString!)

        UserDefaults.standard.set(try? PropertyListEncoder().encode(appDelegate.date), forKey:"\(appDelegate.userID)dates")
        
        //appDelegate.date.append(contentsOf: Date(date))
        self.view.makeToast("?????????????????????.", duration: 2.0, position: .bottom)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.navigationController?.popViewController(animated: true)
        }

    }
}
