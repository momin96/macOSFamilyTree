//
//  NSRDataConstructor.swift
//  FamilyTreemacOS
//
//  Created by Nasir Ahmed Momin on 04/05/18.
//  Copyright © 2018 Nasir Ahmed Momin. All rights reserved.
//

import Foundation

//enum FamilyStature: String, Decodable {
//    case GrandFather    = "Grand Father"
//    case GrandMother    = "Grand Mother"
//    case Father         = "Father"
//    case Mother         = "Mother"
//    case Son            = "Son"
//    case Dauther        = "Dauther"
//    case SonInLaw       = "Son In Law"
//    case DautherInLaw   = "Dauther In Law"
//    case Cousin         = "Cousin"
//    case Friend         = "Friend"
//    case Other          = "Other"
//}

struct Member: Decodable {
    let name: String? // Nasir
    let age: Int = 0
//    let stature: FamilyStature?
}

struct Family: Decodable {
    let name: String?
//    let address: String?
//    let familyHead: Member?
    let children: [Member]?
//    let elders: [Member]?
}


class NSRDataConstructor: NSObject {
    
    class func constructFamilyData (_ onCompletion: @escaping (NSRFamily?) -> Void) {
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
                    
                    if let n = family.name, let c = family.children {
                        let family = NSRFamily(name: n, children: c)
                        onCompletion(family)
                    }
                    else {
                        onCompletion(nil)
                    }
                }
                catch let err {
                    print("Error \(err)")
                    onCompletion(nil)
                }
            }
        }
    }
    
}




