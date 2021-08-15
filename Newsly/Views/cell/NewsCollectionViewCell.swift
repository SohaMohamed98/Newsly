//
//  NewsCollectionViewCell.swift
//  Newsly
//
//  Created by SOHA on 8/14/21.
//

import UIKit
import SDWebImage
class NewsCollectionViewCell: UICollectionViewCell {

    var article: Article?{
        didSet{
            newsTitle.text = article?.title
            newsAuthor.text = article?.author
            newsUrl.text = article?.url
            newsDescription.text = article?.articleDescription
            newsImage.sd_setImage(with: URL(string: article?.urlToImage ?? ""), completed: nil)
        }
    }
    @IBOutlet weak private var newsTitle: UILabel!
    @IBOutlet weak private var newsImage: UIImageView!
    @IBOutlet weak private var newsAuthor: UILabel!
   
    @IBOutlet weak private var newsDescription: UITextView!
    @IBOutlet weak private var newsUrl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       // self.contentView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
       // self.layer.masksToBounds = false
//        self.layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
//        self.layer.shadowOffset = .zero
//        self.layer.shadowRadius = 10
//        self.layer.shadowOpacity = 0.5
        self.contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.contentView.layer.shadowColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        self.contentView.layer.shadowPath = UIBezierPath(rect: self.contentView.bounds).cgPath
        self.contentView.layer.shouldRasterize = true
        
        
    }

}
