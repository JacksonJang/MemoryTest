//
//  StringExt.swift
//  MemoryTest
//
//  Created by 장효원 on 2022/11/02.
//

import UIKit

extension String {
    var encodingQuery: String {
        get {
            if let string = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                return string
            } else {
                print("💙 encoding")
                return self
            }
        }
    }
    
    var toURL:URL? {
        get {
            if let url = URL(string: self.encodingQuery) {
                return url
            } else {
                return nil
            }
        }
    }
}
