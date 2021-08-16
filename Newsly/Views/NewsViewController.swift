//
//  NewsViewController.swift
//  Newsly
//
//  Created by SOHA on 8/16/21.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources
class NewsViewController: UIViewController{

   
    @IBOutlet weak var newsTableView: UITableView!
    var disposeBag = DisposeBag()
    var obj : newsViewModel = newsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        // Do any additional setup after loading the view.
        obj.getNewsTechnology()
        newsTableView.delegate = self
        
        obj.newsObservable?.asObservable().bind(to: newsTableView.rx.items(cellIdentifier: Constatnts.newsCellIdentifier)){row, items, cell in
            (cell as! NewsTableViewCell).article = items
        }.disposed(by: disposeBag)
    }
    

    func registerCells() {
        let newsCell = UINib(nibName: Constatnts.newsCellIdentifier, bundle: nil)
        newsTableView.register(newsCell, forCellReuseIdentifier: Constatnts.newsCellIdentifier)
    }
}

extension NewsViewController:  UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(40)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(153)
    }
    
}
