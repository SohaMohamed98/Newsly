//
//  DetailsViewController.swift
//  Newsly
//
//  Created by SOHA on 8/16/21.
//

import UIKit
import SDWebImage
class DetailsViewController: UIViewController {
 
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
   
    @IBOutlet weak var newsDescription: UILabel!
    
    @IBOutlet weak var newsContent: UILabel!
    @IBOutlet weak var newsAuthor: UILabel!
    @IBOutlet weak var newsPubished: UILabel!
    var article: Article?
    override func viewDidLoad() {
        super.viewDidLoad()
        print(article?.author)
        newsImage.sd_setImage(with: URL(string: article?.urlToImage ?? ""), completed: nil)
        newsTitle.text = article?.title
        newsDescription.text = article?.articleDescription
        newsAuthor.text = article?.author
        newsContent.text = article?.content
        newsPubished.text = article?.publishedAt
        
    }
    @IBAction func presentUrlNews(_ sender: Any) {
        var webView = self.storyboard?.instantiateViewController(withIdentifier: Constatnts.webIdentifier) as! WebViewController
        webView.webURL = article?.url ?? ""
        self.present(webView, animated: true, completion: nil)
    }
}
