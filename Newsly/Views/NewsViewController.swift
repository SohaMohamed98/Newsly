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

struct MySection {
    var header: String
    var items: [Article]
}

extension MySection: SectionModelType {
  typealias Item = Article

   init(original: MySection, items: [Item]) {
    self = original
    self.items = items
  }
}
class NewsViewController: UIViewController{
    @IBOutlet weak var newsTableView: UITableView!
    var disposeBag = DisposeBag()
    var obj : newsViewModel = newsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        obj.getNewsTechnology()
        newsTableView.delegate = self
       reloadData()
    }
    
    func reloadData(){
        let dataSource = RxTableViewSectionedReloadDataSource<MySection>(
          configureCell: { dataSource, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: Constatnts.newsCellIdentifier, for: indexPath)
            (cell as! NewsTableViewCell).article = item
            return cell
        }, titleForHeaderInSection: { ds, index in
            return ds.sectionModels[index].header
        })
        
        obj.newsSectionObservable?.asObservable().bind(to: newsTableView.rx.items(dataSource: dataSource))
          .disposed(by: disposeBag)
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
