//
//  HelloScript.swift
//  BuildPhraseScript
//
//  Created by Lê Hoàng Sinh on 05/09/2022.
//

import Foundation

@main
enum MyScript {
    static func main() {
        if let value = ProcessInfo.processInfo.environment["PRODUCT_NAME"] {
            print("Product Name is: \(value)")
        }
        
        if let value = ProcessInfo.processInfo.environment["CONFIGURATION"] {
            print("Configuration is: \(value)")
        }
        
        if let value = ProcessInfo.processInfo.environment["CUSTOM_VALUE"] {
          print("Custom Value is: \(value)")
        }

        let path = Bundle.main.path(forResource: "remoteData", ofType: "json")
        print(path ?? "NIL")
    }
}
