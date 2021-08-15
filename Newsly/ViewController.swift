//
//  ViewController.swift
//  Newsly
//
//  Created by SOHA on 8/13/21.
//

import UIKit
import RxCocoa
import RxSwift


class ViewController: UIViewController, UICollectionViewDelegateFlowLayout{
    
    var disposeBag = DisposeBag()
    var obj : newsViewModel = newsViewModel()
    
    @IBOutlet weak var newsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerCells()
        obj.getNewsTechnology()
        newsCollectionView.delegate = self
        obj.newsObservable?.asObservable().bind(to: newsCollectionView.rx.items(cellIdentifier: "NewsCollectionViewCell")){row, items, cell in
            (cell as? NewsCollectionViewCell)?.article = items            
        }.disposed(by: disposeBag)
    }
    
    
    func registerCells() {
        let newsCell = UINib(nibName: "NewsCollectionViewCell", bundle: nil)
        newsCollectionView.register(newsCell, forCellWithReuseIdentifier: "NewsCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.safeAreaLayoutGuide.layoutFrame.width - 40, height: 153)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 13, left: 8, bottom: 0, right: 8)
            
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(8)
    }


}

