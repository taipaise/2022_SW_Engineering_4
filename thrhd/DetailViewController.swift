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

    
    var date: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myLabel.text = date
        top.image = #imageLiteral(resourceName: "null")
        bottom.image = #imageLiteral(resourceName: "null")
        outer.image = #imageLiteral(resourceName: "null")
        shoes.image = #imageLiteral(resourceName: "null")
        star1.image = #imageLiteral(resourceName: "empty_star")
        star2.image = #imageLiteral(resourceName: "empty_star")
        star3.image = #imageLiteral(resourceName: "empty_star")
        star4.image = #imageLiteral(resourceName: "empty_star")
        star5.image = #imageLiteral(resourceName: "empty_star")
        top_label.text = "없음"
        bottom_label.text = "없음"
        outer_label.text = "없음"
        shoes_label.text = "없음"
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
