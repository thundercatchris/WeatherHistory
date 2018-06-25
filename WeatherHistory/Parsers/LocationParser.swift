//
//  Parser.swift
//  WeatherHistory
//
//  Created by Cerebro on 25/06/2018.
//  Copyright © 2018 thundercatchris. All rights reserved.
//

import Foundation

class LocationParser {
    
    func locationsArrayFromString(dataString:String, completionHandler: @escaping (_ resultsArray: [Location]? ) -> Void) {
        if let requiredData = SeparateStrings().requiredStringFromString(editString: dataString, removeUpTo: "distribution\":[", removeFrom: "]}\n</script>") {
            let locationData = requiredData.components(separatedBy: "},")
            completionHandler(loopLocations(locationData: locationData))
        }
    }
    
    func loopLocations(locationData: [String]) -> [Location] {
        var locations = [Location]()
        for location in locationData {
            if let formattedLocation = formatLocations(location: location) {
                locations.append(formattedLocation)
            }
        }
        return locations
    }
    
    func formatLocations(location: String) -> Location? {
        if let url = SeparateStrings().requiredStringFromString(editString: location, removeUpTo: "contentUrl\":\"", removeFrom: "\",\""),
            let name = SeparateStrings().requiredStringFromString(editString: location, removeUpTo: "station ", removeFrom: "\"") {
            return Location(name: name, url: url)
        }
        return nil
    }
    
}
