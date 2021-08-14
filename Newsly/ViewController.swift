//
//  ViewController.swift
//  Newsly
//
//  Created by SOHA on 8/13/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("hello")
        var newsApi :NewsAPIProtocol = NewsAPI()
        newsApi.getNewsEverything { (result) in
            switch result{
            case .success(let news):
                print(news.articles?.count)
               // print(news.articles)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }


}

