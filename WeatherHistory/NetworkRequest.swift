//
//  NetworkRequest.swift
//  Copyright © 2018 thundercatchris. All rights reserved.
//

import Foundation
import Alamofire


class NetworkRequest {
    
    
    func locationsRequest(completionHandler: @escaping (_ resultsString: [Location]? ) -> Void) {
        let url = "https://data.gov.uk/dataset/17ba3bbe-0e98-4a8c-9937-bd1d50fdc3c5/historical-monthly-data-for-meteorological-stations"
        Alamofire.request(url).responseJSON { response in
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                
                LocationParser().locationsArrayFromString(dataString: utf8Text, completionHandler: { (locations) in
                    completionHandler(locations)
                })
            }
        }
    }
    
    func locationHistoryRequest(url: String, completionHandler: @escaping (_ resultsString: [History]? ) -> Void) {
        Alamofire.request(url).response { response in
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                
                HistoryParser().locationDataArrayFromString(dataString: utf8Text
                    , completionHandler: { (historyArray) in
                        completionHandler(historyArray)
                })
                
            } else {
                completionHandler(nil)
            }
        }
    }
}

