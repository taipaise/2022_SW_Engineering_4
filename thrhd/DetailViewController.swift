//
//  DetailViewController.swift
//  thrhd
//
//  Created by taipaise on 2022/05/20.
//

//
//struct record{
//    var cloth_top : String
//    var cloth_bottom : String
//    var cloth_outer : String
//    var cloth_shoes : String
//    var date : Date
//    var rating : Int
//    var comment : String
//
//    init(top : String, bottom : String, outer : String, shoes : String, date : Date, rating : Int, comment : String){
//        self.cloth_top = top
//        self.cloth_bottom = bottom
//        self.cloth_outer = outer
//        self.cloth_shoes = shoes
//        self.date = date
//        self.rating = rating
//        self.comment = comment
//    }
//}



import UIKit

class DetailViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    
    @IBOutlet var all: UIView!
    
    @IBOutlet weak var top: UIImageView!
    @IBOutlet weak var bottom: UIImageView!
    @IBOutlet weak var outer: UIImageView!
    @IBOutlet weak var shoes: UIImageView!
    
    @IBOutlet weak var top_label: UILabel!
    @IBOutlet weak var bottom_label: UILabel!
    @IBOutlet weak var outer_label: UILabel!
    @IBOutlet weak var shoes_label: UILabel!
    
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    
    @IBOutlet weak var myLabel: UILabel!

    @IBOutlet weak var labelComment: UILabel!
    
    var date: String!
    
    @IBAction func btnUpdateClicked(_ sender: Any) {

        if let isExist = self.appDelegate.recordInfo.firstIndex(where: {$0.getCloDate() == date}){
            guard let recordUpdateVC = self.storyboard?.instantiateViewController(identifier: "RecordUpdateViewController") as? RecordUpdateViewController else { return }
            recordUpdateVC.index = isExist
            recordUpdateVC.date = date
            self.navigationController?.pushViewController(recordUpdateVC, animated: true)
        }else{
            guard let recordAddVC = self.storyboard?.instantiateViewController(identifier: "RecordAddViewController") as? RecordAddViewController else { return }
            recordAddVC.date = date
            self.navigationController?.pushViewController(recordAddVC, animated: true)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        self.viewDidLoad()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myLabel.text = date
        top.image = #imageLiteral(resourceName: "top")
        bottom.image = #imageLiteral(resourceName: "bottom")
        outer.image = #imageLiteral(resourceName: "outer")
        shoes.image = #imageLiteral(resourceName: "shoes")
        star1.image = #imageLiteral(resourceName: "empty_star")
        star2.image = #imageLiteral(resourceName: "empty_star")
        star3.image = #imageLiteral(resourceName: "empty_star")
        star4.image = #imageLiteral(resourceName: "empty_star")
        star5.image = #imageLiteral(resourceName: "empty_star")
        top_label.text = "없음"
        bottom_label.text = "없음"
        outer_label.text = "없음"
        shoes_label.text = "없음"
        if let dateInx = self.appDelegate.recordInfo.firstIndex(where: {$0.getCloDate() == date}){
            //상의 기록 설정
            if let topIndex = self.appDelegate.clothInfo.firstIndex(where: {$0.getCloName() == appDelegate.recordInfo[dateInx].getCloTop()}){
                self.top.image = self.appDelegate.clothInfo[topIndex].getImg()
                self.top_label.text = self.appDelegate.clothInfo[topIndex].getCloName()
            }
            //하의 기록 설정
            if let bottomIndex = self.appDelegate.clothInfo.firstIndex(where: {$0.getCloName() == appDelegate.recordInfo[dateInx].getCloBtm()}){
                self.bottom.image = self.appDelegate.clothInfo[bottomIndex].getImg()
                self.bottom_label.text = self.appDelegate.clothInfo[bottomIndex].getCloName()
            }
            //아우터 기록 설정
            if let outerIndex = self.appDelegate.clothInfo.firstIndex(where: {$0.getCloName() == appDelegate.recordInfo[dateInx].getCloOut()}){
                self.outer.image = self.appDelegate.clothInfo[outerIndex].getImg()
                self.outer_label.text = self.appDelegate.clothInfo[outerIndex].getCloName()
            }
            //신발 기록 설정
            if let shoesIndex = self.appDelegate.clothInfo.firstIndex(where: {$0.getCloName() == appDelegate.recordInfo[dateInx].getClosho()}){
                self.shoes.image = self.appDelegate.clothInfo[shoesIndex].getImg()
                self.shoes_label.text = self.appDelegate.clothInfo[shoesIndex].getCloName()
            }
            switch appDelegate.recordInfo[dateInx].getCloRate(){
            case 1:
                star1.image = #imageLiteral(resourceName: "full_star")
                star2.image = #imageLiteral(resourceName: "empty_star")
                star3.image = #imageLiteral(resourceName: "empty_star")
                star4.image = #imageLiteral(resourceName: "empty_star")
                star5.image = #imageLiteral(resourceName: "empty_star")
            case 2:
                star1.image = #imageLiteral(resourceName: "full_star")
                star2.image = #imageLiteral(resourceName: "full_star")
                star3.image = #imageLiteral(resourceName: "empty_star")
                star4.image = #imageLiteral(resourceName: "empty_star")
                star5.image = #imageLiteral(resourceName: "empty_star")
            case 3:
                star1.image = #imageLiteral(resourceName: "full_star")
                star2.image = #imageLiteral(resourceName: "full_star")
                star3.image = #imageLiteral(resourceName: "full_star")
                star4.image = #imageLiteral(resourceName: "empty_star")
                star5.image = #imageLiteral(resourceName: "empty_star")
            case 4:
                star1.image = #imageLiteral(resourceName: "full_star")
                star2.image = #imageLiteral(resourceName: "full_star")
                star3.image = #imageLiteral(resourceName: "full_star")
                star4.image = #imageLiteral(resourceName: "full_star")
                star5.image = #imageLiteral(resourceName: "empty_star")
            case 5:
                star1.image = #imageLiteral(resourceName: "full_star")
                star2.image = #imageLiteral(resourceName: "full_star")
                star3.image = #imageLiteral(resourceName: "full_star")
                star4.image = #imageLiteral(resourceName: "full_star")
                star5.image = #imageLiteral(resourceName: "full_star")
            default:
                star1.image = #imageLiteral(resourceName: "empty_star")
                star2.image = #imageLiteral(resourceName: "empty_star")
                star3.image = #imageLiteral(resourceName: "empty_star")
                star4.image = #imageLiteral(resourceName: "empty_star")
                star5.image = #imageLiteral(resourceName: "empty_star")
            }
            labelComment.text = appDelegate.recordInfo[dateInx].getCloCom()
        }
    }
}
    //ww

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
