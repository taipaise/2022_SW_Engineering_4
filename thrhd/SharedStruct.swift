//
//  SharedStruct.swift
//  thrhd
//
//  Created by 최다경 on 2022/05/25.
//

import Foundation
import UIKit

struct imageInfo{
    
    var clothName: String
    var clothImage: UIImage
    var clothCategory: String
    var seasonCategory: String
    
    init(clothName: String, clothImage: UIImage, clothCategory: String, seasonCategory: String){
        self.clothName = clothName
        self.clothImage = clothImage
        self.clothCategory = clothCategory
        self.seasonCategory = seasonCategory
    }
}

struct record{
    var cloth_top : String
    var cloth_bottom : String
    var cloth_outer : String
    var cloth_shoes : String
    var date : Date
    var rating : Int
    var comment : String
    
    init(top : String, bottom : String, outer : String, shoes : String, date : Date, rating : Int, comment : String){
        self.cloth_top = top
        self.cloth_bottom = bottom
        self.cloth_outer = outer
        self.cloth_shoes = shoes
        self.date = date
        self.rating = rating
        self.comment = comment
    }
}
