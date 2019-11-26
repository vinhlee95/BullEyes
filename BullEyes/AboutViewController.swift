//
//  AboutViewController.swift
//  BullEyes
//
//  Created by Vinh Le on 11/25/19.
//  Copyright © 2019 Vinh Le. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadWebView()
    }
    
    func loadWebView() {
        if let path = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let myURL = URL(fileURLWithPath: path)
            let myRequest = URLRequest(url: myURL)
            webView.load(myRequest)
        }
    }
}
