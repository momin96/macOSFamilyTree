//
//  NSRFamily.swift
//  FamilyTreemacOS
//
//  Created by Nasir Ahmed Momin on 04/05/18.
//  Copyright © 2018 Nasir Ahmed Momin. All rights reserved.
//

import Foundation

enum FamilyStature: String, Decodable {
    case GrandFather    = "Grand Father"
    case GrandMother    = "Grand Mother"
    case Father         = "Father"
    case Mother         = "Mother"
    case Son            = "Son"
    case Dauther        = "Dauther"
    case SonInLaw       = "Son In Law"
    case DautherInLaw   = "Dauther In Law"
    case Cousin         = "Cousin"
    case Friend         = "Friend"
    case Other          = "Other"
}

struct Member: Decodable {
    let name: String? // Nasir
    let age: Int?   // 29
    let stature: FamilyStature?
}

struct Family: Decodable {
    let name: String?
    let address: String?
    let familyHead: Member?
    let children: [Member]?
    let elders: [Member]?
}

class NSRFamily: NSObject {

}
