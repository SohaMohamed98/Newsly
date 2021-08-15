//
//  NewsAPI.swift
//  alamofire+swiftjson
//
//  Created by SOHA on 8/12/21.
//

import Foundation

protocol NewsAPIProtocol {
    func getNewsEverything(completion:@escaping (Result<NewsEverything?, NSError>) -> Void)
}

class NewsAPI:BaseAPI<NewsNetworking>, NewsAPIProtocol{
    
    func getNewsEverything(completion:@escaping (Result<NewsEverything?, NSError>) -> Void){
        self.fetchData(target: .getNewsEverything, responseClass: NewsEverything.self) { (result) in
            completion(result)
        }
    }
    
}
