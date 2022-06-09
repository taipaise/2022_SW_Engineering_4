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
    @IBOutlet weak var reEnterTextField: UITextField!
    @IBOutlet weak var btnDuplicate: UIButton!
    
    @IBOutlet weak var labelPWValid: UILabel!
    @IBOutlet weak var labelConfirmCorrect: UILabel!
    @IBOutlet weak var labelIDDup: UILabel!
    @IBOutlet weak var labelEmailVaild: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        duplicate = true
        pwTextField.isSecureTextEntry = true
        reEnterTextField.isSecureTextEntry = true
        setLabelInvalid()
        setLabelConfirmIncorrect()
        setLabelEmailInvalid()
        labelIDDup.textColor = UIColor.red
        labelIDDup.text! = "ID 중복 확인을 해주세요"
        labelIDDup.font = labelIDDup.font.withSize(13)
        labelPWValid.font = labelPWValid.font.withSize(13)
        labelConfirmCorrect.font = labelConfirmCorrect.font.withSize(13)
        labelEmailVaild.font = labelEmailVaild.font.withSize(13)
        self.pwTextField.addTarget(self, action: #selector(self.pwTextFieldDidChange(_:)), for: .editingChanged)
        self.reEnterTextField.addTarget(self, action: #selector(self.confirmTextFieldDidChange(_:)), for: .editingChanged)
        self.idTextField.addTarget(self, action: #selector(self.idDidChange(_:)), for: .editingChanged)
        self.emailTextField.addTarget(self, action: #selector(self.emailTextFieldDidChange(_:)), for: .editingChanged)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        viewDidLoad()
        
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
    
    @objc func pwTextFieldDidChange(_ sender: Any?) {
        if isValidPassword(pwd: pwTextField.text!){
                setLabelValid()
            }
        else{
            setLabelInvalid()
            }
        }
    @objc func confirmTextFieldDidChange(_ sender: Any?) {
        if pwTextField.text! == reEnterTextField.text!{
            setLabelConfirmCorrect()
        }
        else{
            setLabelConfirmIncorrect()
            }
        }
    @objc func idDidChange(_ sender: Any?){
        tfIDChanged()
    }
    @objc func emailTextFieldDidChange(_ sender: Any?) {
        if isValidEmail(testStr: emailTextField.text!){
                setLabelEmailValid()
            }
        else{
            setLabelEmailInvalid()
            }
        }
    @IBAction func btnDuplicateClicked(_ sender: Any) {
        if (idTextField.text! == "") || self.appDelegate.userInfo.firstIndex(where: {$0.getID() == idTextField.text!}) != nil{
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
                labelIDDuplicate()
                return
            }
        }
    func tfIDChanged(){
        duplicate = true
        labelIDDup.textColor = UIColor.red
        labelIDDup.text! = "ID 중복 확인을 해주세요"
    }
    func labelIDDuplicate(){
        labelIDDup.textColor = UIColor.green
        labelIDDup.text! = "사용가능한 ID 입니다."
    }
    
    func setLabelInvalid(){
        self.labelPWValid.textColor = UIColor.red
        labelPWValid.text! = "영문, 숫자로 6자리 이상 입력하세요."
    }
    func setLabelValid(){
        self.labelPWValid.textColor = UIColor.green
        labelPWValid.text! = "사용가능한 비밀번호 입니다."
    }
    func setLabelConfirmIncorrect(){
        self.labelConfirmCorrect.textColor = UIColor.red
        labelConfirmCorrect.text! = "비밀번호가 일치하지 않습니다."
    }
    func setLabelConfirmCorrect(){
        self.labelConfirmCorrect.textColor = UIColor.green
        labelConfirmCorrect.text! = "비밀번호가 일치합니다."
    }
    func setLabelEmailInvalid(){
        self.labelEmailVaild.textColor = UIColor.red
        labelEmailVaild.text! = "유효한 이메일을 입력하세요."
    }
    func setLabelEmailValid(){
        self.labelEmailVaild.textColor = UIColor.green
        labelEmailVaild.text! = "유효한 이메일입니다."
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
            if pwTextField.text! != reEnterTextField.text!{
                let errMsg = UIAlertController(title: "알림", message: "PW를 다시 확인해주세요.", preferredStyle: UIAlertController.Style.alert)
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
