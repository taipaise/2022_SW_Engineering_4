//
//  SharedStruct.swift
//  thrhd
//
//  Created by 최다경 on 2022/05/25.
//

import Foundation
import UIKit

struct imageInfo :Codable{
    
    private var clothName: String
    private var clothImage: String
    private var clothCategory: String
    private var seasonCategory: String
    
    init(clothName: String, clothImage: UIImage, clothCategory: String, seasonCategory: String){
        self.clothName = clothName
        self.clothImage = clothImage.base64!
        self.clothCategory = clothCategory
        self.seasonCategory = seasonCategory
    }
    
    func getCloName() -> String{
        return self.clothName
    }
    func getCloImg() -> String{
        return self.clothImage
    }
    func getCloCate() -> String{
        return self.clothCategory
    }
    func getSeaCate() -> String{
        return self.seasonCategory
    }
    mutating func setCloName(ClothName: String){
        self.clothName = ClothName
    }
    mutating func setCloImg(ClothImg: UIImage){
        self.clothImage = ClothImg.base64!
    }
    mutating func setCloCate(CloCate: String){
        self.clothCategory = CloCate
    }
    mutating func setSeaCate(SeaCate: String){
        self.seasonCategory = SeaCate
    }
    func getImg() -> UIImage{
        return clothImage.imageFromBase64!
    }
}

struct record :Codable{
    private var cloth_top : String
    private var cloth_bottom : String
    private var cloth_outer : String
    private var cloth_shoes : String
    private var date : String
    private var rating : Int
    private var comment : String
    
    init(top : String, bottom : String, outer : String, shoes : String, date : String, rating : Int, comment : String){
        self.cloth_top = top
        self.cloth_bottom = bottom
        self.cloth_outer = outer
        self.cloth_shoes = shoes
        self.date = date
        self.rating = rating
        self.comment = comment
    }
    
    func getCloTop() -> String{
        return self.cloth_top
    }
    func getCloBtm() -> String{
        return self.cloth_bottom
    }
    func getCloOut() -> String{
        return self.cloth_outer
    }
    func getClosho() -> String{
        return self.cloth_shoes
    }
    func getCloDate() -> String{
        return self.date
    }
    func getCloRate() -> Int{
        return self.rating
    }
    func getCloCom() -> String{
        return self.comment
    }
    
    
    mutating func setCloTop(cloTop: String) {
        self.cloth_top = cloTop
    }
    mutating func setCloBtm(cloBtm: String) {
        self.cloth_bottom = cloBtm
    }
    mutating func setCloOut(cloOut: String) {
        self.cloth_outer = cloOut
    }
    mutating func setClosho(cloSho: String) {
        self.cloth_shoes = cloSho
    }
    mutating func setCloDate(cloDate: String) {
        self.date = cloDate
    }
    mutating func setCloRate(cloRate: Int) {
        self.rating = cloRate
    }
    mutating func setCloCom(cloCom: String) {
        self.comment = cloCom
    }
    
    
}
