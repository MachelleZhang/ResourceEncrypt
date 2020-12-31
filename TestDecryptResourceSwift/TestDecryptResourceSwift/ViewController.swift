//
//  ViewController.swift
//  TestDecryptResourceSwift
//
//  Created by ZhangLe on 2020/7/9.
//  Copyright © 2020 AsiaInfo Mobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @objc func injected() {
        viewDidLoad()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.frame = CGRect.init(x: 50, y: 100, width: 100, height: 100)
        label.text = "hello world1"
        label.textColor = .green
        view.addSubview(label)
        
        let btn = UIButton.init(type: .system)
        btn.setTitle("button test", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.frame = CGRect.init(x: 50, y: 200, width: 100, height: 30)
        btn.backgroundColor = .blue
        view.addSubview(btn)
        
        let rePath = Bundle.main.path(forResource: "ConfigEncrypt", ofType: "plist")
        if let path = rePath {
            let data = NSData.init(contentsOfFile: path)
            do {
                let decryptData = try RNOpenSSLDecryptor.decryptData(Data.init(referencing: data!), with: kRNCryptorAES256Settings, password: "fwe&*^123213")
                if let plist = try PropertyListSerialization.propertyList(from: decryptData, options: .mutableContainers, format: nil) as? Dictionary<String, Any> {
                    print(plist)
                }
            } catch let err as NSError {
                print(err.description)
            }
        }
    }
}

