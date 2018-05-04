//
//  Extensions.swift
//  FamilyTreemacOS
//
//  Created by Nasir Ahmed Momin on 04/05/18.
//  Copyright © 2018 Nasir Ahmed Momin. All rights reserved.
//

import Foundation
import Cocoa

struct Associatekeys {
    static var toggleState : UInt8 = 0
}

protocol ToggleProtocol {
    func toggle()
}

enum ToggleState {
    case ON
    case OFF
}

extension NSButton: ToggleProtocol {
    
    func toggle() {
        toggleState = toggleState == .ON ? .OFF : .ON
    }
    
    var toggleState: ToggleState {
        get {
            guard let state = objc_getAssociatedObject(self, &Associatekeys.toggleState) as? ToggleState else {
                return .OFF
            }
            return state
        }
        set (newValue){
            objc_setAssociatedObject(self, &Associatekeys.toggleState, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func invert() {
        self.toggleState = toggleState == .ON ? .OFF : .ON
    }
    
}
