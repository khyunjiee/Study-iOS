//
//  ViewController.swift
//  CalendarEx1
//
//  Created by 김현지 on 2019/12/22.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit
import SSCalendar

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func generateEvents() -> [SSEvent] {
      var events: [SSEvent] = []
      for year in 2016...2021 {
        for _ in 1...200 {
            events.append(generateEvent(year: year));
        }
      }
      return events
    }

    private func generateEvent(year: Int) -> SSEvent {
      let month = Int(arc4random_uniform(12)) + 1
      let day = Int(arc4random_uniform(28)) + 1

      let event = SSEvent()
        event.startDate = SSCalendarUtils.date(withYear: year, month: month, day: day)
      event.startTime = "09:00"
      event.name = "Example Event"
      event.desc = "Details of the event"

      return event
    }
    
    @IBAction func calendarExample(_ sender: UIButton) {
        let annualViewController = SSCalendarAnnualViewController(events: generateEvents())
        let navigationController = UINavigationController(rootViewController: annualViewController!)
        navigationController.navigationBar.isTranslucent = false
        self.present(navigationController, animated: true, completion: nil)
    }
    

}

