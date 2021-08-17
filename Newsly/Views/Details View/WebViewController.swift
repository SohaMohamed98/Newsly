//
//  WebViewController.swift
//  Newsly
//
//  Created by SOHA on 8/16/21.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var webURL : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "\(webURL)")
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
    }

}
