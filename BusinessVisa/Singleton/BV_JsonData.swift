//
//  BV_JsonData.swift
//  BusinessVisa
//
//  Created by Srinivasa Reddy on 08/12/16.
//  Copyright © 2016 Gemini. All rights reserved.
//

import UIKit

class BV_JsonData: NSObject {
    
    static let sharedInstance = BV_JsonData()
    
    var jsonObject: NSDictionary {
        if let jsonPath = Bundle.main.path(forResource: "BusinessVisa", ofType: "json") {
            if let jsonData = NSData(contentsOfFile: jsonPath) {
                do {
                    let jsonResults =  try JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableContainers) as! NSDictionary
                    return jsonResults
                }catch {
                    print("Error!! Unable to parse .json")
                }
            }
        }
        return [:]
    }
}
