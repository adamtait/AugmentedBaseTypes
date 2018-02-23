//
//  Array.swift
//  CCW
//
//  Created by Adam Tait on 5/25/17.
//  Copyright © 2017 Adam Tait. All rights reserved.
//

import Foundation

// Array extension for Clojure-ish partition
// taken from http://stackoverflow.com/questions/26395766/swift-what-is-the-right-way-to-split-up-a-string-resulting-in-a-string-wi/38156873#38156873
extension Array {
    
    func partition(by distance: Int) -> [[Element]]
    {
        if self.count <= distance {
            return [self]
        } else {
            let head = Array(self[0 ..< distance])
            let tail = Array(self[distance ..< self.count])
            return [head] + tail.partition(by: distance)
        }
    }
    
    func flatten() -> [Any]
    {
        return self.reduce([], { acc, obj in
            var r = acc
            if let arr = obj as? [Any]
            {
                let flat = arr.flatten()
                for f in flat       { r.append(f) }
            }
            else        { r.append(obj) }
            return r
        })
    }
    
}
