//
//  FormatHistory.swift
//  WeatherHistory
//
//  Created by Cerebro on 25/06/2018.
//  Copyright © 2018 thundercatchris. All rights reserved.
//

import Foundation

class FormatHistory {
    
    
    func formatHistoryArray(array:[String]) -> History? {
        if array.count >= 6 {
            let year = array[0]
            var month = array[1]
            if month.count <= 1 {
                month = "0" + month
            }
            let dateString = convertDateFormat(dateString: (month + " " + year))
            
            let tmax = array[2]
            let tmin = array[3]
            let afDays = array[4]
            let rain = array[5]
            var sun:String?
            
            if array.count >= 7 {
                sun = array[6]
            }

            return History(date: dateString, tmax: tmax, tmin: tmin, afDays: afDays, rain: rain, sun: sun)
  
        }
        return nil
    }
    
    func convertDateFormat(dateString: String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat =  "MM yyyy"
        
        let date = formatter.date(from: dateString)
        
        let newFormat = DateFormatter()
        newFormat.dateFormat = "MMM yyyy"
        
        let newFormatDate = newFormat.string(from: date!)
        return newFormatDate
    }
    
    func stringFromDate(date: Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
    
}
