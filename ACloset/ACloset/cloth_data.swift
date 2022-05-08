import Foundation
enum Sort: Int{
    case 긴팔 = 0
    case 긴바지 = 1
    case 반팔 = 2
    case 반바지 = 3
    case 코트 = 4
    case 패딩 = 5
    case 아우터 = 6
    case 신발 = 7
    case 악세서리 = 8

}
enum Season: Int{
    case 봄 = 0
    case 여름 = 1
    case 가을 = 2
    case 겨울 = 3
    case 사계 = 4
}


class Cloth{
    var season : Season
    var sort : Sort
    var name : String
    var star : Int
    init(season: Season, sort: Sort,name:String, star:Int){
        self.season = season
        self.sort = sort
        self.name = name
        self.star = star
    }
    convenience init(season: Season, sort: Sort, name : String){
        self.init(season: season, sort: sort, name: name, star: 0)
    }
}
