//
//  LoginViewController.swift
//  thrhd
//
//  Created by 최다경 on 2022/05/13.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    func sendRequest() {
        //POST방식
        let parameter : Parameters = [
            "user_id" : idTextField.text,
            "user_pw" : pwTextField.text
        ] as [String : String]
        guard let url = URL(string: "http://localhost:8080/api/sign-in") else {
            return
        }
        
        let alamo = AF.request(url
            , method: .post
            , parameters: parameter
            , encoding: URLEncoding.default).validate(statusCode: 200..<300)
        
        alamo.responseJSON { (response) in
            let json = JSON(response.data)
              
            let list = json["mlist"]
            let resultCode = json["resultCode"]
                    
            print("list : \(list)")
            print("resultCode : \(resultCode)")
        }
        
        
    }
    
    @IBAction func onBtnLogin(_ sender: UIButton) {
        sendRequest()
    }
    
}
