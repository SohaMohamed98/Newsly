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
    var newsSectionObservable: Observable<[MySection]>?
    private var newsSectionSubject: PublishSubject<[MySection]>?
    init() {
        newsApi = NewsAPI()
        newsSubject = PublishSubject<[Article]>()
        newsObservable = newsSubject?.asObservable()
        newsSectionSubject = PublishSubject<[MySection]>()
        newsSectionObservable = newsSectionSubject?.asObservable()
    }
    
    func getNewsTechnology(){
        self.newsApi?.getNewsEverything { [weak self] (result) in
            switch result{
            case .success(let news):
                guard let new = news else {return}
                self?.newsSubject?.asObserver().onNext(new.articles)
                self?.getData(header: new.articles[0].publishedAt ?? "", articles: new.articles)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getData(header:String, articles: [Article]){
        newsSectionSubject?.onNext([MySection(header: header, items: articles)])
    }
}
