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

    @IBOutlet weak var myLabel: UILabel!

    
    var date: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myLabel.text = date
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
