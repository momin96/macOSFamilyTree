//
//  NSRFamily.swift
//  FamilyTreemacOS
//
//  Created by Nasir Ahmed Momin on 04/05/18.
//  Copyright © 2018 Nasir Ahmed Momin. All rights reserved.
//

import Foundation

class NSRFamily: NSObject {

    var name: String?
    var address: String?
    var familyHead: Member?
    var children: [NSRMember]?
    var elders: [Member]?
    
    
    init(name : String, children: [Member]) {
        self.name = name
        
        var members : [NSRMember] = []
        for m in children {
            let member = NSRMember(name: m.name, age: m.age)
            members.append(member)
        }

        self.children = members
    }
    
    
//    init(name: String, address: String, familyHead: Member, children: [Member], elders: [Member]) {
//        self.name = name
//        self.address = address
//        self.familyHead = familyHead
//        self.children = children
//        self.elders = elders
//    }
    
}

class NSRMember: NSObject {
    var name: String?
    var age: Int?
    var stature: FamilyStature?
    
    
    init(name: String?, age: Int?) {
        self.name = name
        self.age = age
    }
}
