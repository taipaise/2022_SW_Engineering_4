//
//  RecordAddViewController.swift
//  thrhd
//
//  Created by taipaise on 2022/05/26.
//

import UIKit

class RecordAddViewController: UIViewController {
    @IBOutlet weak var starSeg: UISegmentedControl!
    
    var starRating = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }


    @IBAction func starSegAction(_ sender: Any) {
        switch starSeg.selectedSegmentIndex {
        case 0:
            starRating = "0"
        case 1 :
            starRating = "1"
        case 2:
            starRating = "2"
        case 3:
            starRating = "3"
        case 4:
            starRating = "4"
        case 5:
            starRating = "5"
        default:
            break
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

}
