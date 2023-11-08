//
//  ViewController.swift
//  WebViewBootcamp
//
//  Created by Artem on 16.10.2023.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    let webView = WKWebView()
    
    let toolBar = UIToolbar()
    
    let backButtonItem = UIBarButtonItem(systemItem: .rewind)
    let forwardButtonItem = UIBarButtonItem(systemItem: .fastForward)
    let spacer = UIBarButtonItem(systemItem: .flexibleSpace)
    let refreshButtonItem = UIBarButtonItem(systemItem: .refresh)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(toolBar)
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        
        toolBar.items = [backButtonItem, forwardButtonItem, spacer, refreshButtonItem]
        
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.heightAnchor.constraint(equalToConstant: 400),
            //webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            toolBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toolBar.topAnchor.constraint(equalTo: webView.bottomAnchor),
            toolBar.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        backButtonItem.action = #selector(backAction)
        forwardButtonItem.action = #selector(forwardAction)
        refreshButtonItem.action = #selector(refreshAction)
        
        //loadRequest()
       // loadPDF()
        loadHtml()
        
        webView.navigationDelegate = self
    }
    
    @objc func backAction() {
        guard webView.canGoBack else { return }
        webView.goBack()
    }
    
    @objc func forwardAction() {
        guard webView.canGoForward else { return }
        webView.goForward()
    }
    
    @objc func refreshAction() {
        webView.reload()
    }
    
    private func loadRequest () {
        guard let url = URL(string: "https://google.com") else { return }
        
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    private func loadPDF() {
        guard let url = Bundle.main.url(forResource: "cv", withExtension: "pdf") else { return }
        
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
        
    }
    
    private func loadHtml() {
        webView.loadHTMLString(Source.htmlString, baseURL: nil)
    }
}

extension ViewController: WKNavigationDelegate {
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        //        print("decidePolicyFor")
        //        decisionHandler(.allow)
        let url = navigationAction.request.url?.absoluteString
        
        if url!.contains("apple") {
            let url = URL(string: "https://www.youtube.com")
            webView.load(URLRequest(url: url!))
            decisionHandler(.cancel)
        } else {
            decisionHandler(.allow)
        }
    }
    
    
    public func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("didCommit")
    }
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("did Finish")
        backButtonItem.isEnabled = webView.canGoBack
        forwardButtonItem.isEnabled = webView.canGoForward
    }
}
