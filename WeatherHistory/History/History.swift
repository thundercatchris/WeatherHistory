//
//  History.swift
//  WeatherHistory
//
//  Created by Cerebro on 25/06/2018.
//  Copyright © 2018 thundercatchris. All rights reserved.
//

import Foundation


struct History {
    let date: String!
    let tmax: String!
    let tmin: String!
    let afDays: String!
    let rain: String!
    let sun: String?
    
    init(date:String, tmax:String, tmin:String, afDays:String, rain:String, sun:String?) {
        self.date = date
        self.tmax = tmax
        self.tmin = tmin
        self.afDays = afDays
        self.rain = rain
        self.sun = sun
    }
}

