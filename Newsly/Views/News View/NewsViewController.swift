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
    @IBOutlet weak private var newsTableView: UITableView!
    var disposeBag = DisposeBag()
    var obj : newsViewModel = newsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        obj.getNewsTechnology()
        newsTableView.delegate = self
        loadData()
        newsTableView.rx.modelSelected(Article.self).subscribe{ (item) in
            var detailsViewControler = self.storyboard?.instantiateViewController(withIdentifier: Constatnts.detailsIdentifier) as! DetailsViewController
            detailsViewControler.article = item.element
            self.navigationController?.pushViewController(detailsViewControler, animated: true)
        }.disposed(by: disposeBag)
    }
    
    func loadData(){
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
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        (view as! UITableViewHeaderFooterView).contentView.layer.cornerRadius = 15
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor.white
        (view as! UITableViewHeaderFooterView).textLabel?.font = UIFont(name: Constatnts.fontName, size: 14)
        (view as! UITableViewHeaderFooterView).textLabel?.textAlignment = .center
        
        
    }
    
}
