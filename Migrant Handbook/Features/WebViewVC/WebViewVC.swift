//
//  WebViewVC.swift
//  Migrant Handbook
//
//  Created by Mairambek on 8/28/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit
import WebKit

class WebViewVC: UIViewController {

    private var webView : WKWebView = {
        let wv = WKWebView()
        wv.backgroundColor = .white
        wv.translatesAutoresizingMaskIntoConstraints = false
        wv.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return wv
    }()

    public var content: String = "" {
        didSet {
            let htmlContent = content.replacingOccurrences(of: "file:///android_res/raw/", with: "\"")
            let setHeightUsingCSS = "<html><body><p><font size=16><head><style type=\"text/css\"> img{ max-height: \(self.view.frame.height)px; max-width: \(self.view.frame.size.width)px; !important; width='100%' height='100%'} </style> </head><body> \(htmlContent) <style>img{display: inline;height: auto;max-width: 100%;}</style></body>"
            
            DispatchQueue.main.async {
                self.webView.loadHTMLString(setHeightUsingCSS, baseURL: Bundle.main.bundleURL)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(webView)
        webView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0)
            .isActive = true
        webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
            .isActive = true
        webView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
            .isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            .isActive = true
    }

}
