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
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = UserDefaults.standard.value(forKey:"user") as? Data {
            let users = try? PropertyListDecoder().decode(Array<user>.self, from: data)
            appDelegate.userInfo = users!
            appDelegate.userInfo.append(user(ID: "admin", PW: "admin", email: "admin", nickname: "admin"))
        }
    }
    
    
    @IBAction func btnLoginClicked(_ sender: Any) {
        if idTextField.text! == "" || pwTextField.text! == ""{
            let errMsg = UIAlertController(title: "알림", message: "ID, PW를 입력해주세요", preferredStyle: UIAlertController.Style.alert)
            let ok = UIAlertAction(title: "닫기", style: UIAlertAction.Style.default, handler: nil)
            errMsg.addAction(ok)
            present(errMsg, animated: true, completion: nil)
            return
        }
        if let isExist = self.appDelegate.userInfo.firstIndex(where: {$0.getID() == idTextField.text!}){
            if appDelegate.userInfo[isExist].getPW() == pwTextField.text!{
                appDelegate.userID = idTextField.text!
                guard let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "TapController") else { return }
                self.navigationController?.pushViewController(homeVC, animated: true)
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let mainTabBarController = storyboard.instantiateViewController(identifier: "TapController")
//                mainTabBarController.modalPresentationStyle = .fullScreen
//                self.present(mainTabBarController, animated: true, completion: nil)
            }
            else{
                let errMsg = UIAlertController(title: "알림", message: "ID, 비밀번호를 확인해주세요", preferredStyle: UIAlertController.Style.alert)
                let ok = UIAlertAction(title: "닫기", style: UIAlertAction.Style.default, handler: nil)
                errMsg.addAction(ok)
                present(errMsg, animated: true, completion: nil)
                return
            }
        }
        else{
            //id 가 없으면
            let errMsg = UIAlertController(title: "알림", message: "ID, 비밀번호를 확인해주세요", preferredStyle: UIAlertController.Style.alert)
            let ok = UIAlertAction(title: "닫기", style: UIAlertAction.Style.default, handler: nil)
            errMsg.addAction(ok)
            present(errMsg, animated: true, completion: nil)
            return
        }
    }
    
    
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){self.view.endEditing(true) }
//
//
//    func sendRequest() {
//        //POST방식
//        let parameter : Parameters = [
//            "user_id" : idTextField.text,
//            "user_pw" : pwTextField.text
//        ] as [String : String]
//        guard let url = URL(string: "http://localhost:8080/api/sign-in") else {
//            return
//        }
//
//        let alamo = AF.request(url
//            , method: .post
//            , parameters: parameter
//            , encoding: URLEncoding.default).validate(statusCode: 200..<300)
//
//        alamo.responseJSON { (response) in
//            let json = JSON(response.data)
//
//            let list = json["mlist"]
//            let resultCode = json["resultCode"]
//
//            print("list : \(list)")
//            print("resultCode : \(resultCode)")
//        }
//
//
//    }
//
//    @IBAction func onBtnLogin(_ sender: UIButton) {
//        sendRequest()
//    }
//
//}
