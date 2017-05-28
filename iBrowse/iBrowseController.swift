//
//  iBrowseController.swift
//  iBrowse
//
//  Created by Kevin Armin Zardkoohi on 5/27/17.
//  Copyright © 2017 BDA. All rights reserved.
//

import UIKit
import WebKit

class iBrowseController: UIViewController {

    var webView:WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webView = WKWebView(frame: CGRect(x: 0, y: 60, width: view.frame.size.width, height: view.frame.size.height))
        view.addSubview(webView)
        let url:URL = URL(string: "https://google.com")!
        let req:URLRequest = URLRequest(url: url)
        webView.load(req)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

