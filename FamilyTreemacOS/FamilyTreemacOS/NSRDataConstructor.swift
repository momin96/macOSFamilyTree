//
//  NSRDataConstructor.swift
//  FamilyTreemacOS
//
//  Created by Nasir Ahmed Momin on 04/05/18.
//  Copyright © 2018 Nasir Ahmed Momin. All rights reserved.
//

import Foundation

class NSRDataConstructor: NSObject {
    
    class func constructFamilyData () {
        NSRDataFetcher.shared.getRequestData { (data, response, err) in
            print(data!)
            guard let data = data else {
                return
            }
            
            guard let httpResponse = response else {
                return
            }
            
            if (httpResponse as! HTTPURLResponse).statusCode == 200 {
                // Data is availalbe & status code is valid
                
                do {
                    let decoder = JSONDecoder()
                    let families = try decoder.decode(Family.self, from: data)
                    print(families as Any)
                    //                            let persons = pst.map({ (personSt) -> Person in
                    //                                let person = Person(fname: personSt.firstName, lname: personSt.lastName)
                    //                                return person
                    //                            })
                    
                }
                catch let err {
                    print("Error \(err)")
                }
            }
        }
    }
    
}
