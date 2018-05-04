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

struct Member: Decodable, Comparable {
    
    let name: String? // Nasir
    let age: Int = 0
//    let stature: FamilyStature?
    
    static func <(lhs: Member, rhs: Member) -> Bool {
        return lhs.name?.localizedCaseInsensitiveCompare(rhs.name!) == .orderedAscending
    }
    
    static func ==(lhs: Member, rhs: Member) -> Bool {
        return lhs == rhs
    }
    
}

struct Family: Decodable {
    let name: String?
    var children: [Member]?

    //    let elders: [Member]?
    //    let address: String?
    //    let familyHead: Member?
    
    func sortFamilyMemberbyName() -> [Member] {
//        return (children?.sorted())!
        
        return (children?.sorted(by: { (m1, m2) -> Bool in
            return m1 < m2
        }))!
        
    }
    
    func sortFamilyMemberByAge() -> [Member] {
        return (children?.sorted(by: { m1, m2 in
            return m1.age < m2.age
        }))!
    }
    
    mutating func updateChildren(_ children: [Member]?) {
        self.children = children
    }
    
}


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




