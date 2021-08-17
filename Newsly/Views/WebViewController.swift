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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
