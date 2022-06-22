//
//  CalendarViewController.swift
//  thrhd
//
//  Created by taipaise on 2022/05/20.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate{
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
 
    @IBOutlet weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let data = UserDefaults.standard.value(forKey:"\(appDelegate.userID)record") as? Data {
            let record = try? PropertyListDecoder().decode(Array<record>.self, from: data)
            appDelegate.recordInfo = record!
        }
        if let data = UserDefaults.standard.value(forKey:"\(appDelegate.userID)name") as? Data {
            let name = try? PropertyListDecoder().decode(Array<String>.self, from: data)
            appDelegate.clothName = name!
        }
        if let data = UserDefaults.standard.value(forKey:"\(appDelegate.userID)dates") as? Data {
            let dates = try? PropertyListDecoder().decode(Array<Date>.self, from: data)
            appDelegate.date = dates!
        }
        calendar.appearance.eventDefaultColor = UIColor.red
        calendar.appearance.eventSelectionColor = UIColor.red
        self.calendarColor()
        self.calendarText()
        self.calendarEvent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        calendar.reloadData()
        viewDidLoad()
//        if let data = UserDefaults.standard.value(forKey:"\(appDelegate.userID)record") as? Data {
//            let record = try? PropertyListDecoder().decode(Array<record>.self, from: data)
//            appDelegate.recordInfo = record!
//        }
//        if let data = UserDefaults.standard.value(forKey:"\(appDelegate.userID)name") as? Data {
//            let name = try? PropertyListDecoder().decode(Array<String>.self, from: data)
//            appDelegate.clothName = name!
//        }
        print("appear")
        print(appDelegate.date)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    
    func calendarColor() {
        // 달력의 평일 날짜 색깔
        calendar.appearance.titleDefaultColor = .black
        // 달력의 토,일 날짜 색깔
        calendar.appearance.titleWeekendColor = .red
        // 달력의 맨 위의 년도, 월의 색깔
        calendar.appearance.headerTitleColor = .systemPink
        // 달력의 요일 글자 색깔
        calendar.appearance.weekdayTextColor = .black
        
    }
    
    func calendarText() {
        // 달력의 년월 글자 바꾸기
        calendar.appearance.headerDateFormat = "YYYY년 M월"
        
        // 달력의 요일 글자 바꾸는 방법 1
        calendar.locale = Locale(identifier: "ko_KR")
        
        // 달력의 요일 글자 바꾸는 방법 2
        calendar.calendarWeekdayView.weekdayLabels[0].text = "일"
        calendar.calendarWeekdayView.weekdayLabels[1].text = "월"
        calendar.calendarWeekdayView.weekdayLabels[2].text = "화"
        calendar.calendarWeekdayView.weekdayLabels[3].text = "수"
        calendar.calendarWeekdayView.weekdayLabels[4].text = "목"
        calendar.calendarWeekdayView.weekdayLabels[5].text = "금"
        calendar.calendarWeekdayView.weekdayLabels[6].text = "토"
        
        // 년월에 흐릿하게 보이는 애들 없애기
        calendar.appearance.headerMinimumDissolvedAlpha = 0
    }

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        guard let modalPresentView = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else { return }
        // 날짜를 원하는 형식으로 저장하기 위한 방법입니다.
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        modalPresentView.date = dateFormatter.string(from: date)
        self.navigationController?.pushViewController(modalPresentView, animated: true)
    }
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        if appDelegate.date.contains(date) {
            return 1
        } else {
            return 0
        }
    }
    func calendarEvent() {
        calendar.dataSource = self
        calendar.delegate = self
    }
    
}


