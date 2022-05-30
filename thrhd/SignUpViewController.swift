//
//  SignUpViewController.swift
//  thrhd
//
//  Created by 최다경 on 2022/05/29.
//

import UIKit

class SignUpViewController: UIViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){self.view.endEditing(true) }
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func onBtnSignUp(_ sender: Any) {
    }
    
    

}
