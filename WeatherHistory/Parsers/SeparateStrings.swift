//
//  SeperateStrings.swift
//  WeatherHistory
//
//  Created by Cerebro on 25/06/2018.
//  Copyright © 2018 thundercatchris. All rights reserved.
//

import Foundation


class SeparateStrings {
    
    func requiredStringFromString(editString:String, removeUpTo:String, removeFrom:String?) -> String? {
        if let removeFrom = removeFrom {
            if let index = editString.endIndex(of: removeUpTo) {
                let startRemoved = editString.suffix(from: index)
                let start = String(startRemoved)
                if let endIndex = start.index(of: removeFrom)   {
                    let endRemoved = start.prefix(upTo: endIndex)
                    return String(endRemoved)
                }
            }
        } else {
            if let index = editString.endIndex(of: removeUpTo) {
                return String(editString.suffix(from: index))
            } else if let index = editString.endIndex(of: "hours\n") {
                return String(editString.suffix(from: index))
            }
        }
        return nil
    }
}

extension StringProtocol where Index == String.Index {
    func index<T: StringProtocol>(of string: T, options: String.CompareOptions = []) -> Index? {
        return range(of: string, options: options)?.lowerBound
    }
    func endIndex<T: StringProtocol>(of string: T, options: String.CompareOptions = []) -> Index? {
        return range(of: string, options: options)?.upperBound
    }
    func indexes<T: StringProtocol>(of string: T, options: String.CompareOptions = []) -> [Index] {
        var result: [Index] = []
        var start = startIndex
        while start < endIndex, let range = range(of: string, options: options, range: start..<endIndex) {
            result.append(range.lowerBound)
            start = range.lowerBound < range.upperBound ? range.upperBound : index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
    func ranges<T: StringProtocol>(of string: T, options: String.CompareOptions = []) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var start = startIndex
        while start < endIndex, let range = range(of: string, options: options, range: start..<endIndex) {
            result.append(range)
            start = range.lowerBound < range.upperBound  ? range.upperBound : index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
}
