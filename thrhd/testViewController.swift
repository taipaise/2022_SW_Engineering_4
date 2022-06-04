//
//  testViewController.swift
//  thrhd
//
//  Created by 최다경 on 2022/06/05.
//

import UIKit

class testViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = appDelegate.tmp_clothInfo[0].getImg()
        // Do any additional setup after loading the view.
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
