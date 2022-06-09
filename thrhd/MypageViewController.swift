//
//  MypageViewController.swift
//  thrhd
//
//  Created by 이동현 on 2022/06/08.
//

import UIKit

class MypageViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var index : Int!
    
    @IBOutlet weak var labelID: UILabel!
    @IBOutlet weak var labelNickname: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let isExist = self.appDelegate.userInfo.firstIndex(where: {$0.getID() == appDelegate.userID}){
            labelID.text = "ID: \(appDelegate.userInfo[isExist].getID())"
            labelNickname.text = "Nick name: \(appDelegate.userInfo[isExist].getNickname())"
            labelEmail.text = "Email: \(appDelegate.userInfo[isExist].getEmail())"
            index = isExist
        }
        tfPassword.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnWithdrwalClicked(_ sender: Any) {

        if tfPassword.text! == ""{
            let errMsg = UIAlertController(title: "알림", message: "PW를 입력해주세요", preferredStyle: UIAlertController.Style.alert)
            let ok = UIAlertAction(title: "닫기", style: UIAlertAction.Style.default, handler: nil)
            errMsg.addAction(ok)
            present(errMsg, animated: true, completion: nil)
            return
        }
        if appDelegate.userInfo[index].getPW() == tfPassword.text!{
            let deleteAlert = UIAlertController(title: "경고", message: "정말 삭제하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            let yes = UIAlertAction(title: "네", style: UIAlertAction.Style.destructive) {
                _ in self.appDelegate.userInfo.remove(at: self.index)
                UserDefaults.standard.set(try? PropertyListEncoder().encode(self.appDelegate.userInfo), forKey:"user")
                UserDefaults.standard.removeObject(forKey: "\(self.appDelegate.userID)cloth")
                UserDefaults.standard.removeObject(forKey: "\(self.appDelegate.userID)record")
                UserDefaults.standard.removeObject(forKey: "\(self.appDelegate.userID)name")
                self.view.makeToast("삭제되었습니다.", duration: 1.0, position: .bottom)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                    guard let LoginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") else { return }
                    self.navigationController?.pushViewController(LoginViewController, animated: true)
                }
            }
            let no = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            deleteAlert.addAction(no)
            deleteAlert.addAction(yes)
            present(deleteAlert, animated: true, completion: nil)
        }
        else{
            let errMsg = UIAlertController(title: "알림", message: "PW가 올바르지 않습니다.", preferredStyle: UIAlertController.Style.alert)
            let ok = UIAlertAction(title: "닫기", style: UIAlertAction.Style.default, handler: nil)
            errMsg.addAction(ok)
            present(errMsg, animated: true, completion: nil)
            return
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
