//
//  Util.swift
//  GalleryApp
//
//  Created by Abhishek Darak on 23/11/22.
//

import Foundation

class Util {
    
    static func toPostParams(rawParams: KeyValuePairs<String, String>) -> Data {
        var str = ""
        for i in 0...rawParams.count-1 {
            str.append(rawParams[i].key)
            str.append("=")
            str.append(rawParams[i].value)
            if i < rawParams.count-1 {
                str.append("&")
            }
        }
        return str.data(using: String.Encoding.utf8)!
    }
    
}
