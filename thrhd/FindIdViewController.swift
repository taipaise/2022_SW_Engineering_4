//
//  FindIdViewController.swift
//  thrhd
//
//  Created by 최다경 on 2022/05/29.
//

import UIKit

class FindIdViewController: UIViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){self.view.endEditing(true) }
    
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func onBtnAuthen(_ sender: UIButton) {
    }
    
    
}
