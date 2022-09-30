//
//  ViewController.swift
//  BuildPhraseScript
//
//  Created by Lê Hoàng Sinh on 05/09/2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let path = Bundle.main.path(forResource: "remoteData", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject> {
                    if let person = jsonResult["message"] as? String {
                        print(person)
                    }
                }
            } catch {
                print(error)
            }
        }
    }
    
    
}

