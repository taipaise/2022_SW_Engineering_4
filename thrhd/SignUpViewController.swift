//
//  SignUpViewController.swift
//  thrhd
//
//  Created by 최다경 on 2022/05/29.
//

import UIKit

class SignUpViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var duplicate: Bool!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){self.view.endEditing(true) }
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        duplicate = true
        pwTextField.isSecureTextEntry = true
    }
    
    func isValidPassword(pwd: String) -> Bool {
          let passwordRegEx = "^[a-zA-Z0-9]{6,}$"
          let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
          return passwordTest.evaluate(with: pwd)
      }
    
    func isValidEmail(testStr:String) -> Bool {
          let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
          let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
          return emailTest.evaluate(with: testStr)
           }
    
    
    
    @IBAction func btnDuplicateClicked(_ sender: Any) {
        if self.appDelegate.userInfo.firstIndex(where: {$0.getID() == idTextField.text!}) != nil{
            let errMsg = UIAlertController(title: "알림", message: "해당 ID는 사용할 수 없습니다.", preferredStyle: UIAlertController.Style.alert)
            let ok = UIAlertAction(title: "닫기", style: UIAlertAction.Style.default, handler: nil)
            errMsg.addAction(ok)
            present(errMsg, animated: true, completion: nil)
            duplicate = true
            return
            }
            else{
                let errMsg = UIAlertController(title: "알림", message: "사용 가능한 ID입니다.", preferredStyle: UIAlertController.Style.alert)
                let ok = UIAlertAction(title: "닫기", style: UIAlertAction.Style.default, handler: nil)
                errMsg.addAction(ok)
                present(errMsg, animated: true, completion: nil)
                duplicate = false
                return
            }
        }
    
    @IBAction func onBtnSignUp(_ sender: Any) {
        if (idTextField.text! != "") && (pwTextField.text! != "") && (emailTextField.text! != "") && (nicknameTextField.text! != ""){
            if !isValidEmail(testStr: emailTextField.text!){
                let errMsg = UIAlertController(title: "알림", message: "올바른 이메일 형식을 사용해주세요", preferredStyle: UIAlertController.Style.alert)
                let ok = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
                errMsg.addAction(ok)
                present(errMsg, animated: true, completion: nil)
                return
            }
            if !isValidPassword(pwd: pwTextField.text!){
                let errMsg = UIAlertController(title: "알림", message: "비밀번호는 영어 대소문자, 숫자로 6자리 이상입니다.", preferredStyle: UIAlertController.Style.alert)
                let ok = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
                errMsg.addAction(ok)
                present(errMsg, animated: true, completion: nil)
                return
            }
            if duplicate{
                let errMsg = UIAlertController(title: "알림", message: "ID 중복 검사를 해주세요", preferredStyle: UIAlertController.Style.alert)
                let ok = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
                errMsg.addAction(ok)
                present(errMsg, animated: true, completion: nil)
                return
            }
            
            appDelegate.userInfo.append(user(ID: idTextField.text!, PW: pwTextField.text!, email: emailTextField.text!, nickname: nicknameTextField.text!))
            UserDefaults.standard.set(try? PropertyListEncoder().encode(appDelegate.userInfo), forKey:"user")
            let msg = UIAlertController(title: "알림", message: "회원가입이 완료되었습니다.", preferredStyle: UIAlertController.Style.alert)
            let ok = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            msg.addAction(ok)
            present(msg, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.navigationController?.popViewController(animated: true)
            }
        }
        else{
            let errMsg = UIAlertController(title: "알림", message: "모든 항목을 입력해주세요", preferredStyle: UIAlertController.Style.alert)
            let ok = UIAlertAction(title: "닫기", style: UIAlertAction.Style.default, handler: nil)
            errMsg.addAction(ok)
            present(errMsg, animated: true, completion: nil)
        }
    }
}
