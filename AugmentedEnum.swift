//
//  AugmentedEnum.swift
//  CCW
//
//  Created by Adam Tait on 2/6/17.
//  Copyright © 2017 Adam Tait. All rights reserved.
//

import Foundation

protocol AugmentedEnum : Hashable
{
    static var allKeysOrdered: Array<Self>  { get }
    static func forEach(_ fn: (Self) -> Void)
    static func zip<U>(_ orderedByKeys: [U]) -> [Self : U]
}

extension AugmentedEnum
{
    public static func forEach(_ fn: (Self) -> Void) {
        for v in Self.allKeysOrdered {  fn(v)  }
    }
    
    static func zip<T>(_ orderedByKeys: [T]) -> [Self : T]
    {
        var dict: [Self : T] = [:]
        let lastIndex = Self.allKeysOrdered.count - 1
        for i in 0...lastIndex {
            dict[Self.allKeysOrdered[i]] = orderedByKeys[i]
        }
        return dict
    }
    
    static func map<T>(_ fn: (Self) -> T) -> [T]
    {
        var results: [T] = []
        for i in Self.allKeysOrdered {
            results.append(fn(i))
        }
        return results
    }
}
