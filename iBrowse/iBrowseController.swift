//
//  iBrowseController.swift
//  iBrowse
//
//  Created by Kevin Armin Zardkoohi on 5/27/17.
//  Copyright © 2017 BDA. All rights reserved.
//

import UIKit
import WebKit

class iBrowseController: UIViewController, UITextFieldDelegate, WKNavigationDelegate {

    var webView:WKWebView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //webView = WKWebView(frame: CGRect(x: 0, y: 60, width: view.frame.size.width, height: view.frame.size.height))
        webView = WKWebView()
        view.addSubview(webView)
        
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        webView.translatesAutoresizingMaskIntoConstraints = false
        let width = NSLayoutConstraint(item: webView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0)
        let height = NSLayoutConstraint(item: webView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1.0, constant: -60)
        let top = NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 60)
        view.addConstraints([width, height, top])
        
        progressBar.setProgress(0, animated: false)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        textField.text = "\(webView.url!)"
        progressBar.setProgress(Float(webView.estimatedProgress), animated: true)
        let diff:Float = 1 - Float(webView.estimatedProgress)
        progressBar.setProgress(diff, animated: true)
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        progressBar.setProgress(0, animated: false)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let url:URL = URL(string: textField.text!)!
        let req:URLRequest = URLRequest(url: url)
        webView.load(req)
        textField.resignFirstResponder()
        textField.text = "\(url)"
        return false
    }

}

