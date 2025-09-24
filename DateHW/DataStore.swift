//
//  DataStore.swift
//  DateHW
//
//  Created by Артём Сноегин on 24.09.2025.
//


class DataStore {
    
    let cities: [City] = [
        // UTC-12
        City(name: "Baker Island", country: "USA", timezoneID: "Pacific/Pago_Pago"),
        
        // UTC-11
        City(name: "Pago Pago", country: "American Samoa", timezoneID: "Pacific/Pago_Pago"),
        
        // UTC-10
        City(name: "Honolulu", country: "USA", timezoneID: "Pacific/Honolulu"),
        City(name: "Papeete", country: "French Polynesia", timezoneID: "Pacific/Tahiti"),
        
        // UTC-9
        City(name: "Anchorage", country: "USA", timezoneID: "America/Anchorage"),
        
        // UTC-8
        City(name: "Los Angeles", country: "USA", timezoneID: "America/Los_Angeles"),
        City(name: "Vancouver", country: "Canada", timezoneID: "America/Vancouver"),
        
        // UTC-7
        City(name: "Denver", country: "USA", timezoneID: "America/Denver"),
        City(name: "Phoenix", country: "USA", timezoneID: "America/Phoenix"),
        
        // UTC-6
        City(name: "Chicago", country: "USA", timezoneID: "America/Chicago"),
        City(name: "Mexico City", country: "Mexico", timezoneID: "America/Mexico_City"),
        
        // UTC-5
        City(name: "New York", country: "USA", timezoneID: "America/New_York"),
        City(name: "Toronto", country: "Canada", timezoneID: "America/Toronto"),
        City(name: "Havana", country: "Cuba", timezoneID: "America/Havana"),
        
        // UTC-4
        City(name: "Caracas", country: "Venezuela", timezoneID: "America/Caracas"),
        City(name: "Santo Domingo", country: "Dominican Republic", timezoneID: "America/Santo_Domingo"),
        
        // UTC-3
        City(name: "Buenos Aires", country: "Argentina", timezoneID: "America/Argentina/Buenos_Aires"),
        City(name: "São Paulo", country: "Brazil", timezoneID: "America/Sao_Paulo"),
        
        // UTC-2
        City(name: "South Georgia", country: "UK", timezoneID: "Atlantic/South_Georgia"),
        
        // UTC-1
        City(name: "Azores", country: "Portugal", timezoneID: "Atlantic/Azores"),
        
        // UTC±0
        City(name: "London", country: "UK", timezoneID: "Europe/London"),
        City(name: "Dakar", country: "Senegal", timezoneID: "Africa/Dakar"),
        
        // UTC+1
        City(name: "Berlin", country: "Germany", timezoneID: "Europe/Berlin"),
        City(name: "Rome", country: "Italy", timezoneID: "Europe/Rome"),
        
        // UTC+2
        City(name: "Athens", country: "Greece", timezoneID: "Europe/Athens"),
        City(name: "Cairo", country: "Egypt", timezoneID: "Africa/Cairo"),
        
        // UTC+3
        City(name: "Moscow", country: "Russia", timezoneID: "Europe/Moscow"),
        City(name: "Nairobi", country: "Kenya", timezoneID: "Africa/Nairobi"),
        
        // UTC+4
        City(name: "Dubai", country: "UAE", timezoneID: "Asia/Dubai"),
        City(name: "Baku", country: "Azerbaijan", timezoneID: "Asia/Baku"),
        
        // UTC+5
        City(name: "Karachi", country: "Pakistan", timezoneID: "Asia/Karachi"),
        City(name: "Tashkent", country: "Uzbekistan", timezoneID: "Asia/Tashkent"),
        
        // UTC+5:30
        City(name: "New Delhi", country: "India", timezoneID: "Asia/Kolkata"),
        
        // UTC+6
        City(name: "Dhaka", country: "Bangladesh", timezoneID: "Asia/Dhaka"),
        City(name: "Almaty", country: "Kazakhstan", timezoneID: "Asia/Almaty"),
        
        // UTC+7
        City(name: "Bangkok", country: "Thailand", timezoneID: "Asia/Bangkok"),
        City(name: "Jakarta", country: "Indonesia", timezoneID: "Asia/Jakarta"),
        
        // UTC+8
        City(name: "Hong Kong", country: "China", timezoneID: "Asia/Hong_Kong"),
        City(name: "Singapore", country: "Singapore", timezoneID: "Asia/Singapore"),
        City(name: "Beijing", country: "China", timezoneID: "Asia/Shanghai"),
        
        // UTC+9
        City(name: "Tokyo", country: "Japan", timezoneID: "Asia/Tokyo"),
        City(name: "Seoul", country: "South Korea", timezoneID: "Asia/Seoul"),
        
        // UTC+10
        City(name: "Sydney", country: "Australia", timezoneID: "Australia/Sydney"),
        City(name: "Port Moresby", country: "Papua New Guinea", timezoneID: "Pacific/Port_Moresby"),
        
        // UTC+11
        City(name: "Noumea", country: "New Caledonia", timezoneID: "Pacific/Noumea"),
        City(name: "Honiara", country: "Solomon Islands", timezoneID: "Pacific/Guadalcanal"),
        
        // UTC+12
        City(name: "Auckland", country: "New Zealand", timezoneID: "Pacific/Auckland"),
        City(name: "Fiji", country: "Fiji", timezoneID: "Pacific/Fiji"),
        
        // UTC+13
        City(name: "Nukuʻalofa", country: "Tonga", timezoneID: "Pacific/Tongatapu"),
        
        // UTC+14
        City(name: "Kiritimati", country: "Kiribati", timezoneID: "Pacific/Kiritimati")
    ]

}
