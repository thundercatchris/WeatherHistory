//
//  HistoryParser.swift
//  WeatherHistory
//
//  Created by Cerebro on 25/06/2018.
//  Copyright © 2018 thundercatchris. All rights reserved.
//

import Foundation
import CSV

class HistoryParser {
    
    func locationDataArrayFromString(dataString:String, completionHandler: @escaping (_ resultsArray: [History]? ) -> Void) {
        if let requiredDataOnly = SeparateStrings().requiredStringFromString(editString: dataString, removeUpTo: "hours\r\n", removeFrom: nil) {
            completionHandler(loopThroughHistory(requiredData: requiredDataOnly))
        }
    }
    
    func loopThroughHistory(requiredData: String) -> [History]{
        var formattedDataArray = [History]()
        let csvFormatString = try! CSVReader(string: String(requiredData))
        while let row = csvFormatString.next() {
            if let dataFromRowAsArray = arrayFromHistoryRow(row: row) {
                formattedDataArray.append(dataFromRowAsArray)
            }
        }
        return formattedDataArray
    }
    
    func arrayFromHistoryRow(row:[String]) -> History? {
        let rowString = Array(row[0])
        var tempArray = [String]()
        var tempString = ""
        
        for i in 0...(rowString.count - 1) {
            let char = rowString[i]
            if tempString.count > 0 && char == Character(" ") {
                tempArray.append(tempString)
                tempString = ""
            } else if char != Character(" ") {
                tempString = tempString + String(char)
            }
            
            if i == (rowString.count - 1) && tempArray.count > 0{
                tempArray.append(tempString)
                return FormatHistory().formatHistoryArray(array: tempArray)
            }
        }
        return nil
    }

}
