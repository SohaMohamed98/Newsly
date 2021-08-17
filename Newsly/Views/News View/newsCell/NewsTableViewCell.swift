//
//  NewsTableViewCell.swift
//  Newsly
//
//  Created by SOHA on 8/16/21.
//

import UIKit
import SDWebImage
class NewsTableViewCell: UITableViewCell {
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
    @IBOutlet weak private var newsDescription: UILabel!
    @IBOutlet weak private var newsUrl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8))
    }
    
}
