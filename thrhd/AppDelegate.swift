//
//  AppDelegate.swift
//  thrhd
//
//  Created by taipaise on 2022/05/13.
//

import UIKit


@main

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var clothInfo: [imageInfo] = [imageInfo]()
    var tmp_clothInfo: [imageInfo] = [imageInfo]()
    var clothName = [String]()
    var recordInfo : [record] = [record]()
    var userInfo : [user] = [user]()
    var userID : String = ""
    var date : [Date] = [Date]()
    
    var cnt: Int = 0
    var idx: Int = 0 //옷 정보 수정 page의 index
    var recCnt : Int = 0
    var recIdx : Int = 0
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        sleep(1)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension UIImage {
    var base64: String? {
        self.jpegData(compressionQuality: 1)?.base64EncodedString()
    }
}

extension String {
    var imageFromBase64: UIImage? {
        guard let imageData = Data(base64Encoded: self, options: .ignoreUnknownCharacters) else {
            return nil
        }
        return UIImage(data: imageData)
    }
}
