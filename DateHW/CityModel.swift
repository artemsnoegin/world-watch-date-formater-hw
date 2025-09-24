//
//  CityModel.swift
//  DateHW
//
//  Created by Артём Сноегин on 24.09.2025.
//

import Foundation

struct City {
    var name: String
    var country: String
    var timezoneID: String
    
    func timezone() -> TimeZone? {
        return TimeZone(identifier: timezoneID)
    }
    
    func currentTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .medium
        dateFormatter.timeZone = timezone()

        return dateFormatter.string(from: Date.now)
    }

}
