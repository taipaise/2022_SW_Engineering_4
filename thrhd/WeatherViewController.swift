//
//  WeatherViewController.swift
//  thrhd
//
//  Created by 이동현 on 2022/06/04.
//

import UIKit
import CoreLocation
import Foundation
import Toast_Swift


class WeatherViewController: UIViewController,CLLocationManagerDelegate {
    
    var locationManager : CLLocationManager!
    
    var weather: Weather?
    var main: Main?
    var name: String?
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var condition: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var feelTemp: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var nowTemp: UILabel!
    
    
    func getDate()-> String{
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = NSTimeZone(name: "ko_KR") as TimeZone?
        return dateFormatter.string(from: now)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        let coor = locationManager.location?.coordinate
        guard let latitude = coor?.latitude else{return}
        
        guard let longitude = coor?.longitude else{return}
        print(latitude ,longitude)
        
        WeatherService().getWeather(lat: latitude, lon: longitude) { result in
            switch result {
            case .success(let weatherResponse):
                DispatchQueue.main.async {
                    self.weather = weatherResponse.weather.first
                    self.main = weatherResponse.main
                    self.name = weatherResponse.name
                    self.city.text = "\(weatherResponse.name)"
                    self.setWeatherUI()
                }
            case .failure(_ ):
                print("error")
            }
        }
        
    }
    private func setWeatherUI() {
        let url = URL(string: "https://openweathermap.org/img/wn/\(self.weather?.icon ?? "00")@2x.png")
        let data = try? Data(contentsOf: url!)
        if let data = data {
            weatherImg.image = UIImage(data: data)
        }
        nowTemp.text = "현재 온도: \(String(format: "%.1f", main!.temp - 273.15))"
        maxTemp.text = "최고 온도: \(String(format: "%.1f", main!.temp_max - 273.15))"
        minTemp.text = "최저 온도: \(String(format: "%.1f", main!.temp_min - 273.15))"
        humidity.text = "습도: \(main!.humidity)"
        feelTemp.text = "체감 온도: \(String(format: "%.1f", main!.feels_like - 273.15))"
        date.text = getDate()
        condition.text = "\(weather!.main)"
    }
    override func viewWillAppear(_ animated: Bool) {
        self.viewDidLoad()
        print("asdassadgdsgs")
    }
    @IBAction func refresh(_ sender: Any) {
        viewWillAppear(true)
        self.view.makeToast("새로고침 되었습니다.", duration: 1.0, position: .bottom)
    }
    
}
