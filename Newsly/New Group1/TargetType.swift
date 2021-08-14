//
//  TargetType.swift
//  alamofire+swiftjson
//
//  Created by SOHA on 8/12/21.
//

import Foundation
import Alamofire
//WrapperClass
enum HttpMethods: String{
    case get = "GET"
    case post = "POST"
    case delete = "Delete"
    case put = "PUT"
}

enum Task{
    case requestPlain
    case requestParams(parameters: [String:Any], encoding: ParameterEncoding)
}

//MARK:- request target
protocol TargetType {
    var baseURL: String {get}
    var path: String {get}
    var method: HttpMethods {get}
    var task: Task {get}
    var headers: [String: String]? {get}
}

