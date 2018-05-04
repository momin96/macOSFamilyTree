//
//  NSRFamily.swift
//  FamilyTreemacOS
//
//  Created by Nasir Ahmed Momin on 04/05/18.
//  Copyright © 2018 Nasir Ahmed Momin. All rights reserved.
//

import Foundation

@objc class NSRFamily: NSObject {

    @objc dynamic var name: String?
//    @objc dynamic var address: String?
//    @objc dynamic var familyHead: NSRMember?
    @objc dynamic var children: [NSRMember]?
//    @objc dynamic var elders: [NSRMember]?
    
    
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

@objc class NSRMember: NSObject {
    @objc dynamic var name: String?
    @objc dynamic var age: Int = 0
//    @objc dynamic var stature: FamilyStature?
    
    
    init(name: String?, age: Int) {
        self.name = name
        self.age = age
    }
}
