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
        // ????????? ?????? ?????? ??????
        calendar.appearance.titleDefaultColor = .black
        // ????????? ???,??? ?????? ??????
        calendar.appearance.titleWeekendColor = .red
        // ????????? ??? ?????? ??????, ?????? ??????
        calendar.appearance.headerTitleColor = .systemPink
        // ????????? ?????? ?????? ??????
        calendar.appearance.weekdayTextColor = .black
        
    }
    
    func calendarText() {
        // ????????? ?????? ?????? ?????????
        calendar.appearance.headerDateFormat = "YYYY??? M???"
        
        // ????????? ?????? ?????? ????????? ?????? 1
        calendar.locale = Locale(identifier: "ko_KR")
        
        // ????????? ?????? ?????? ????????? ?????? 2
        calendar.calendarWeekdayView.weekdayLabels[0].text = "???"
        calendar.calendarWeekdayView.weekdayLabels[1].text = "???"
        calendar.calendarWeekdayView.weekdayLabels[2].text = "???"
        calendar.calendarWeekdayView.weekdayLabels[3].text = "???"
        calendar.calendarWeekdayView.weekdayLabels[4].text = "???"
        calendar.calendarWeekdayView.weekdayLabels[5].text = "???"
        calendar.calendarWeekdayView.weekdayLabels[6].text = "???"
        
        // ????????? ???????????? ????????? ?????? ?????????
        calendar.appearance.headerMinimumDissolvedAlpha = 0
    }

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        guard let modalPresentView = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else { return }
        // ????????? ????????? ???????????? ???????????? ?????? ???????????????.
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


