//
//  DetailViewController.swift
//  thrhd
//
//  Created by taipaise on 2022/05/20.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    var date: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myLabel.text = date
    }}
    //ww

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

