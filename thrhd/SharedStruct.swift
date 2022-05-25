//
//  SharedStruct.swift
//  thrhd
//
//  Created by 최다경 on 2022/05/25.
//

import Foundation
import UIKit

struct imageInfo{
    let clothName: String
    let clothImage: UIImage
    let clothCategory: String
    let seasonCategory: String
    
    init(clothName: String, clothImage: UIImage, clothCategory: String, seasonCategory: String){
        self.clothName = clothName
        self.clothImage = clothImage
        self.clothCategory = clothCategory
        self.seasonCategory = seasonCategory
    }
}
