//
//  SideMenuViewController.swift
//  thrhd
//
//  Created by taipaise on 2022/06/09.
//

import UIKit

class SideMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLogoutClicked(_ sender: Any) {
        print("adadasdasdadasdas")
        let alert = UIAlertController(title: "로그아웃 하시겠습니까?", message: "", preferredStyle: UIAlertController.Style.alert)
        let cancle = UIAlertAction(title: "취소", style: .default, handler: nil)
        let yes = UIAlertAction(title: "확인", style: .destructive) { _ in
            self.view.makeToast("로그아웃 되었습니다.", duration: 1.0, position: .bottom)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                guard let LoginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") else { return }
                self.navigationController?.pushViewController(LoginViewController, animated: false)
            }
        }
        alert.addAction(cancle)
        alert.addAction(yes)
        present(alert,animated: true,completion: nil)

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
