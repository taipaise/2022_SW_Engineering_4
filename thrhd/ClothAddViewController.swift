//
//  ClothAddViewController.swift
//  thrhd
//
//  Created by 최다경 on 2022/05/24.
//

import UIKit
import MobileCoreServices//포토앨범, 카메라 기능 추가

class ClothAddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var clothImageView: UIImageView!
    @IBOutlet weak var clothCategory: UISegmentedControl!
    @IBOutlet weak var seasonCategory: UISegmentedControl!
    @IBOutlet weak var clothNameTxt: UITextField!
    
    let imagePickerVC: UIImagePickerController! = UIImagePickerController() //선택된 이미지 데이터
    var captureImage:UIImage!
    var clothText: String = "아우터"
    var seasonText: String = "봄"
    var clonameText: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clothText = "아우터"
        seasonText = "봄"

    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSegClo(_ sender: UISegmentedControl) {
        switch clothCategory.selectedSegmentIndex {
        case 0:
            clothText = "아우터"
        case 1 :
            clothText = "상의"
        case 2:
            clothText = "하의"
        case 3:
            clothText = "신발"
        case 4:
            clothText = ""
        default:
            break
        }
    }
    
    @IBAction func onSegSea(_ sender: UISegmentedControl) {
        switch seasonCategory.selectedSegmentIndex {
        case 0:
            seasonText = "봄"
        case 1 :
            seasonText = "여름"
        case 2:
            seasonText = "가을"
        case 3:
            seasonText = "겨울"
        default:
            break
        }
    }
    @IBAction func onBtnAddCloth(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            imagePickerVC.delegate = self
            imagePickerVC.sourceType = .photoLibrary
            imagePickerVC.mediaTypes = [kUTTypeImage as String]
            //잘라내기 편집 기능 지원
            imagePickerVC.allowsEditing = true
            //팝업
            present(imagePickerVC, animated: true, completion: nil)
        
    }else{
        print("error")
        }
        
    }
    
    @IBAction func onBtnAddData(_ sender: UIButton) {
        clonameText = clothNameTxt.text!
        appDelegate.clothInfo.append(imageInfo(clothName: clonameText, clothImage: captureImage, clothCategory: clothText, seasonCategory: seasonText))
        
        
        print(clonameText, clothText, seasonText)
        print(appDelegate.clothInfo[appDelegate.cnt].clothName)
        appDelegate.cnt += 1
        print("struct array length: ", appDelegate.clothInfo.count)
        self.navigationController?.popViewController(animated: true)
    }//data 추가 버튼
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! String
        if(mediaType.isEqual( kUTTypeImage as NSString as String)){
            if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
                clothImageView.image = editedImage
                captureImage = editedImage
                print("editedImage: ", editedImage)
            }
            else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                clothImageView.image = originalImage
                captureImage = originalImage
            }
            //피커뷰 창을 닫아줌
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    
    
}//end of class
