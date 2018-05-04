//
//  NSRDataFetcher.swift
//  FamilyTreemacOS
//
//  Created by Nasir Ahmed Momin on 04/05/18.
//  Copyright © 2018 Nasir Ahmed Momin. All rights reserved.
//

import Foundation

let API_ENDPOINT = "http://www.mocky.io/v2/5aa703fe2f000098008ea42b"

class NSRDataFetcher: NSObject {

    static let shared = NSRDataFetcher()
    let session : URLSession
    override init() {
        print("Init")
        session = URLSession.shared
    }
    
    func getRequestData(_ completionHandler : @escaping (Data?, URLResponse?, Error?) -> Void) {
        let url = URL(string : API_ENDPOINT)!
        print("Get data \(session), \(url)")
        
        session.dataTask(with: url) { (data, response, err) in
            print("response \(String(describing: response))")
            completionHandler(data, response, err)
            }.resume()
    }
    
}
