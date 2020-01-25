//
//  EXDate.swift
//  modalTeste
//
//  Created by Weslley Madeira on 25/01/20.
//  Copyright © 2020 Weslley Madeira. All rights reserved.
//

import Foundation


extension Date {
    
    static func dateToNumberDays(date: String) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: "2014-12-24T22:04:11Z")!

        let calendar = NSCalendar.current
        let dateToday = Date()
        let components = calendar.dateComponents([.day], from: date, to: dateToday)
        
        return components.day ?? 0
    }
    
}
