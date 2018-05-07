//
//  NSRFamily.swift
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
    let age: Int = {
        let n = Int(arc4random_uniform(100))
        return n
    }()
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
    
    func sortFamilyMemberbyName(ascending isAscending : Bool) -> [Member] {
        //        return (children?.sorted())!
        
        return (children?.sorted(by: { (m1, m2) -> Bool in
            return m1.name?.localizedCaseInsensitiveCompare(m2.name!) == (isAscending ? .orderedAscending : .orderedDescending)
        }))!
    }
    
    func sortFamilyMemberByAge(ascending isAscending : Bool) -> [Member] {
        return (children?.sorted(by: { m1, m2 in
            return isAscending ? (m1.age < m2.age) : (m1.age > m2.age)
        }))!
    }
    
    mutating func updateChildren(_ children: [Member]?) {
        self.children = children
    }
}


// NSRFamily was intendent to use for Cocoa bindings

//@objc class NSRFamily: NSObject {
//
//    @objc dynamic var name: String?
//    @objc dynamic var address: String?
////    @objc dynamic var familyHead: NSRMember?
//    @objc dynamic var children: [NSRMember]?
////    @objc dynamic var elders: [NSRMember]?
//
//
//    init(name : String, children: [Member]) {
//        self.name = name
//
//        var members : [NSRMember] = []
//        for m in children {
//            let member = NSRMember(name: m.name, age: m.age)
//            members.append(member)
//        }
//
//        self.children = members
//    }
//
//
////    init(name: String, address: String, familyHead: Member, children: [Member], elders: [Member]) {
////        self.name = name
////        self.address = address
////        self.familyHead = familyHead
////        self.children = children
////        self.elders = elders
////    }
//
//}

//@objc class NSRMember: NSObject {
//    @objc dynamic var name: String?
//    @objc dynamic var age: Int = 0
////    @objc dynamic var stature: FamilyStature?
//
//
//    init(name: String?, age: Int) {
//        self.name = name
//        self.age = age
//    }
//}

