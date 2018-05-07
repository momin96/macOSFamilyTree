//
//  NSRDataConstructor.swift
//  FamilyTreemacOS
//
//  Created by Nasir Ahmed Momin on 04/05/18.
//  Copyright © 2018 Nasir Ahmed Momin. All rights reserved.
//

import Foundation

class NSRDataConstructor: NSObject {
    
    class func constructFamilyData (_ onCompletion: @escaping (Family?) -> Void) {
        NSRDataFetcher.shared.getRequestData { (data, response, err) in
            print(data!)
            guard let data = data else {
                onCompletion(nil)
                return
            }
            
            guard let httpResponse = response else {
                onCompletion(nil)
                return
            }
            
            if (httpResponse as! HTTPURLResponse).statusCode == 200 {
                // Data is availalbe & status code is valid
                
                do {
                    let decoder = JSONDecoder()
                    let family = try decoder.decode(Family.self, from: data)
                    print(family as Any)
                    onCompletion(family)

//                    if let n = family.name, let c = family.children {
//                        let family = NSRFamily(name: n, children: c)
//                        onCompletion(family)
//                    }
//                    else {
//                        onCompletion(nil)
//                    }
                }
                catch let err {
                    print("Error \(err)")
                    onCompletion(nil)
                }
            }
        }
    }
    
}




