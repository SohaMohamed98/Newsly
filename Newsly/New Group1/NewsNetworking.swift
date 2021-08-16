//
//  NewsNetworking.swift
//  alamofire+swiftjson
//
//  Created by SOHA on 8/12/21.
//

import Foundation
import  Alamofire
// Call API
enum NewsNetworking{
    case getNewsEverything
}

extension NewsNetworking:TargetType{
    var baseURL: String {
        switch self {
        default:
            return Constatnts.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .getNewsEverything:
            return "everything"
        }
        
    }
    
    var method: HttpMethods {
        switch self {
        case .getNewsEverything:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getNewsEverything:
            return .requestParams(parameters: ["q": "technology", "pageSize": 20, "from": "2021-07-20", "to": "2021-08-15", "sortBy": "publishedAt", "apiKey": "a2a9830ba6e74efdb602bf203fbf2863"], encoding: URLEncoding.default)
        }
    }
    var headers: [String : String]? {
        switch self {
        default:
            return ["Authorization": "Bearer"]
        }
    }
}

