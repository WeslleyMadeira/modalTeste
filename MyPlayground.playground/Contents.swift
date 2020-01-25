import UIKit

var str = "Hello, playground"
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
let date = dateFormatter.date(from: "2014-12-24T22:04:11Z")!

let calendar = NSCalendar.current
let dateToday = Date()
let components = calendar.dateComponents([.day], from: date, to: dateToday)


