//
//  newsViewModel.swift
//  Newsly
//
//  Created by SOHA on 8/14/21.
//

import Foundation
import RxSwift
import RxCocoa
class newsViewModel{
    var newsApi :NewsAPIProtocol?
    var newsObservable: Observable<[Article]>?
    private var newsSubject: PublishSubject<[Article]>?
    init() {
        newsApi = NewsAPI()
        newsSubject = PublishSubject<[Article]>()
        newsObservable = newsSubject?.asObservable()
    }
    
    func getNewsTechnology(){
        self.newsApi?.getNewsEverything { [weak self] (result) in
            switch result{
            case .success(let news):
                guard let new = news else {return}
                self?.newsSubject?.asObserver().onNext(new.articles)
               // print(news?.articles?.count)
               // print(news?.articles)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
