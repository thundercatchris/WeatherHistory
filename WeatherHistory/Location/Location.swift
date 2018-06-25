//
//  Location.swift
//  WeatherHistory
//
//  Created by Cerebro on 25/06/2018.
//  Copyright © 2018 thundercatchris. All rights reserved.
//

import Foundation

struct Location {
    let name: String!
    let url: String!
    
    init(name:String, url:String) {
        self.name = name
        self.url = url
    }
}
