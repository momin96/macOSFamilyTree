//
//  ViewController.swift
//  FamilyTreemacOS
//
//  Created by Nasir Ahmed Momin on 04/05/18.
//  Copyright © 2018 Nasir Ahmed Momin. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @objc dynamic var children : [NSRMember]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSRDataConstructor.constructFamilyData { (family) in
            self.children = family?.children
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

