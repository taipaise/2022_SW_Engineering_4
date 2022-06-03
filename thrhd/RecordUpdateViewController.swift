//
//  RecordUpdateViewController.swift
//  thrhd
//
//  Created by 이동현 on 2022/05/30.
//

import UIKit
import DropDown

class RecordUpdateViewController: UIViewController {
    var index : Int!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){self.view.endEditing(true) }
    var date : String!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var topName : String!
    var bottomName : String!
    var outerName : String!
    var shoesName : String!
    var rating : Int = 0
    var comment : String!
    
    let dropdown1 = DropDown()
    let dropdown2 = DropDown()
    let dropdown3 = DropDown()
    let dropdown4 = DropDown()
    
    var starRating = ""
    
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let cloIndex = self.appDelegate.clothInfo.firstIndex(where: {$0.getCloName() == appDelegate.recordInfo[index].getCloTop()}){
            self.top.image = self.appDelegate.clothInfo[cloIndex].getImg()
            self.tfInput1.text = self.appDelegate.clothInfo[cloIndex].getCloName()
            topName = tfInput1.text
        }
        
        if let cloIndex = self.appDelegate.clothInfo.firstIndex(where: {$0.getCloName() == appDelegate.recordInfo[index].getCloBtm()}){
            self.bottom.image = self.appDelegate.clothInfo[cloIndex].getImg()
            self.tfInput2.text = self.appDelegate.clothInfo[cloIndex].getCloName()
            bottomName = tfInput2.text
        }
        
        if let cloIndex = self.appDelegate.clothInfo.firstIndex(where: {$0.getCloName() == appDelegate.recordInfo[index].getCloOut()}){
            self.outer.image = self.appDelegate.clothInfo[cloIndex].getImg()
            self.tfInput3.text = self.appDelegate.clothInfo[cloIndex].getCloName()
            outerName = tfInput3.text
        }
        
        if let cloIndex = self.appDelegate.clothInfo.firstIndex(where: {$0.getCloName() == appDelegate.recordInfo[index].getClosho()}){
            self.shoes.image = self.appDelegate.clothInfo[cloIndex].getImg()
            self.tfInput4.text = self.appDelegate.clothInfo[cloIndex].getCloName()
            shoesName = tfInput4.text
        }
        rating = appDelegate.recordInfo[index].getCloRate()
        tfComment.text = appDelegate.recordInfo[index].getCloCom()
        
        switch rating {
        case 1 :
            starRating = "1"
            star1.image =  #imageLiteral(resourceName: "full_star")
            star2.image =  #imageLiteral(resourceName: "empty_star")
            star3.image =  #imageLiteral(resourceName: "empty_star")
            star4.image =  #imageLiteral(resourceName: "empty_star")
            star5.image =  #imageLiteral(resourceName: "empty_star")
        case 2:
            starRating = "2"
            star1.image =  #imageLiteral(resourceName: "full_star")
            star2.image =  #imageLiteral(resourceName: "full_star")
            star3.image =  #imageLiteral(resourceName: "empty_star")
            star4.image =  #imageLiteral(resourceName: "empty_star")
            star5.image =  #imageLiteral(resourceName: "empty_star")
        case 3:
            starRating = "3"
            star1.image =  #imageLiteral(resourceName: "full_star")
            star2.image =  #imageLiteral(resourceName: "full_star")
            star3.image =  #imageLiteral(resourceName: "full_star")
            star4.image =  #imageLiteral(resourceName: "empty_star")
            star5.image =  #imageLiteral(resourceName: "empty_star")
        case 4:
            starRating = "4"
            star1.image =  #imageLiteral(resourceName: "full_star")
            star2.image =  #imageLiteral(resourceName: "full_star")
            star3.image =  #imageLiteral(resourceName: "full_star")
            star4.image =  #imageLiteral(resourceName: "full_star")
            star5.image =  #imageLiteral(resourceName: "empty_star")
        case 5:
            starRating = "4"
            star1.image =  #imageLiteral(resourceName: "full_star")
            star2.image =  #imageLiteral(resourceName: "full_star")
            star3.image =  #imageLiteral(resourceName: "full_star")
            star4.image =  #imageLiteral(resourceName: "full_star")
            star5.image =  #imageLiteral(resourceName: "full_star")
        default:
            break
        }
        initUI()
        setDropdown1()
        setDropdown2()
        setDropdown3()
        setDropdown4()
        labelDate.text = date
        // Do any additional setup after loading the view.
    }
    
    
    func initUI() {
        DropDown.appearance().textColor = UIColor.black
        DropDown.appearance().selectedTextColor = UIColor.gray
        DropDown.appearance().backgroundColor = UIColor.white // 아이템 팝업 배경 색상
        DropDown.appearance().selectionBackgroundColor = UIColor.lightGray
        DropDown.appearance().setupCornerRadius(8)
        dropdown1.dismissMode = .automatic // 팝업을 닫을 모드 설정
        dropdown2.dismissMode = .automatic // 팝업을 닫을 모드 설정
        dropdown3.dismissMode = .automatic // 팝업을 닫을 모드 설정
        dropdown4.dismissMode = .automatic // 팝업을 닫을 모드 설정
        
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
        // dataSource로 ItemList를 연결
        dropdown1.dataSource = appDelegate.clothName

        // anchorView를 통해 UI와 연결
        dropdown1.anchorView = self.dropView1

        // View를 갖리지 않고 View아래에 Item 팝업이 붙도록 설정
        dropdown1.bottomOffset = CGPoint(x: 0, y: dropView1.bounds.height)

        // Item 선택 시 처리
        dropdown1.selectionAction = { [weak self] (index, item) in
            //선택한 Item을 TextField에 넣어준다.
            self!.tfInput1.text = item
            self!.topName = item
            if let cloIndex = self!.appDelegate.clothInfo.firstIndex(where: {$0.getCloName() == item}){
                self!.top.image = self!.appDelegate.clothInfo[cloIndex].getImg()
            }
            self!.ivIcon1.image = UIImage.init(named: "downarrow.png")
        }

        // 취소 시 처리
        dropdown1.cancelAction = { [weak self] in
            //빈 화면 터치 시 DropDown이 사라지고 아이콘을 원래대로 변경
            self!.ivIcon1.image = UIImage.init(named: "downarrow.png")
        }
    }
    func setDropdown2() {
        // dataSource로 ItemList를 연결
        dropdown2.dataSource = appDelegate.clothName

        // anchorView를 통해 UI와 연결
        dropdown2.anchorView = self.dropView2

        // View를 갖리지 않고 View아래에 Item 팝업이 붙도록 설정
        dropdown2.bottomOffset = CGPoint(x: 0, y: dropView2.bounds.height)

        // Item 선택 시 처리
        dropdown2.selectionAction = { [weak self] (index: Int, item: String) in
            //선택한 Item을 TextField에 넣어준다.
            self!.bottomName = item
            self!.tfInput2.text = item
            if let cloIndex = self!.appDelegate.clothInfo.firstIndex(where: {$0.getCloName() == item}){
                self!.bottom.image = self!.appDelegate.clothInfo[cloIndex].getImg()
            }
            self!.ivIcon2.image = UIImage.init(named: "downarrow.png")
        }

        // 취소 시 처리
        dropdown2.cancelAction = { [weak self] in
            //빈 화면 터치 시 DropDown이 사라지고 아이콘을 원래대로 변경
            self!.ivIcon2.image = UIImage.init(named: "downarrow.png")
        }
    }
    func setDropdown3() {
        // dataSource로 ItemList를 연결
        dropdown3.dataSource = appDelegate.clothName

        // anchorView를 통해 UI와 연결
        dropdown3.anchorView = self.dropView3

        // View를 갖리지 않고 View아래에 Item 팝업이 붙도록 설정
        dropdown3.bottomOffset = CGPoint(x: 0, y: dropView3.bounds.height)

        // Item 선택 시 처리
        dropdown3.selectionAction = { [weak self] (index, item) in
            //선택한 Item을 TextField에 넣어준다.
            self!.outerName = item
            self!.tfInput3.text = item
            if let cloIndex = self!.appDelegate.clothInfo.firstIndex(where: {$0.getCloName() == item}){
                self!.outer.image = self!.appDelegate.clothInfo[cloIndex].getImg()
            }
            self!.ivIcon3.image = UIImage.init(named: "downarrow.png")
        }

        // 취소 시 처리
        dropdown3.cancelAction = { [weak self] in
            //빈 화면 터치 시 DropDown이 사라지고 아이콘을 원래대로 변경
            self!.ivIcon3.image = UIImage.init(named: "downarrow.png")
        }
    }
    func setDropdown4() {
        // dataSource로 ItemList를 연결
        dropdown4.dataSource = appDelegate.clothName


        // anchorView를 통해 UI와 연결
        dropdown4.anchorView = self.dropView4

        // View를 갖리지 않고 View아래에 Item 팝업이 붙도록 설정
        dropdown4.bottomOffset = CGPoint(x: 0, y: dropView4.bounds.height)

        // Item 선택 시 처리
        dropdown4.selectionAction = { [weak self] (index, item) in
            //선택한 Item을 TextField에 넣어준다.
            self!.shoesName = item
            self!.tfInput4.text = item
            if let cloIndex = self!.appDelegate.clothInfo.firstIndex(where: {$0.getCloName() == item}){
                self!.shoes.image = self!.appDelegate.clothInfo[cloIndex].getImg()
            }
            self!.ivIcon4.image = UIImage.init(named: "downarrow.png")
        }

        // 취소 시 처리
        dropdown4.cancelAction = { [weak self] in
            //빈 화면 터치 시 DropDown이 사라지고 아이콘을 원래대로 변경
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
            star1.image =  #imageLiteral(resourceName: "full_star")
            star2.image =  #imageLiteral(resourceName: "empty_star")
            star3.image =  #imageLiteral(resourceName: "empty_star")
            star4.image =  #imageLiteral(resourceName: "empty_star")
            star5.image =  #imageLiteral(resourceName: "empty_star")
            rating = 1
        case 1:
            starRating = "2"
            star1.image =  #imageLiteral(resourceName: "full_star")
            star2.image =  #imageLiteral(resourceName: "full_star")
            star3.image =  #imageLiteral(resourceName: "empty_star")
            star4.image =  #imageLiteral(resourceName: "empty_star")
            star5.image =  #imageLiteral(resourceName: "empty_star")
            rating = 2
        case 2:
            starRating = "3"
            star1.image =  #imageLiteral(resourceName: "full_star")
            star2.image =  #imageLiteral(resourceName: "full_star")
            star3.image =  #imageLiteral(resourceName: "full_star")
            star4.image =  #imageLiteral(resourceName: "empty_star")
            star5.image =  #imageLiteral(resourceName: "empty_star")
            rating = 3
        case 3:
            starRating = "4"
            star1.image =  #imageLiteral(resourceName: "full_star")
            star2.image =  #imageLiteral(resourceName: "full_star")
            star3.image =  #imageLiteral(resourceName: "full_star")
            star4.image =  #imageLiteral(resourceName: "full_star")
            star5.image =  #imageLiteral(resourceName: "empty_star")
            rating = 4
        case 4:
            starRating = "4"
            star1.image =  #imageLiteral(resourceName: "full_star")
            star2.image =  #imageLiteral(resourceName: "full_star")
            star3.image =  #imageLiteral(resourceName: "full_star")
            star4.image =  #imageLiteral(resourceName: "full_star")
            star5.image =  #imageLiteral(resourceName: "full_star")
            rating = 5
        default:
            break
        }
    }
    
    @IBAction func btnUpdateComClicked(_ sender: Any) {
            comment = tfComment.text!
            
        appDelegate.recordInfo[index].setCloTop(cloTop: topName)
        appDelegate.recordInfo[index].setCloBtm(cloBtm: bottomName)
        appDelegate.recordInfo[index].setCloOut(cloOut: outerName)
        appDelegate.recordInfo[index].setClosho(cloSho: shoesName)
        appDelegate.recordInfo[index].setCloRate(cloRate: rating)
        appDelegate.recordInfo[index].setCloCom(cloCom: comment)
        
        print("record struct array length: ", appDelegate.recordInfo.count)

            self.view.makeToast("추가되었습니다.", duration: 2.0, position: .bottom)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.navigationController?.popViewController(animated: true)
            }

        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


