//
//  BaseAPI.swift
//  alamofire+swiftjson
//
//  Created by SOHA on 8/12/21.
//

import Foundation
import Alamofire

class BaseAPI<T:TargetType>{
    func fetchData<M: Codable>(target:T, responseClass: M.Type, completion: @escaping (Result<M?,NSError>) -> Void){
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let parameters = buildParams(task: target.task)
        AF.request(target.baseURL + target.path, method: method, parameters: parameters.0, encoding: parameters.1, headers: headers).responseJSON { (response) in
            
            guard let statusCode = response.response?.statusCode else{ return}
            if statusCode == 200{
                guard let responseData = try? response.result.get() else {return}
                guard let jsonData = try? JSONSerialization.data(withJSONObject: responseData, options: []) else {return}
                guard let objData = try? JSONDecoder().decode(M.self, from: jsonData) else{return}
                completion(.success(objData))
                
            }else{
                let error = NSError(domain: target.baseURL, code: statusCode, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.genericMessage])
                completion(.failure(error))
            }
        }
    }
    
    //MARK:- helper Method
    private func buildParams(task:Task) -> ([String:Any], ParameterEncoding){
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestParams(parameters: let parameters, encoding: let encodingParams):
            return (parameters, encodingParams)
        }
    }
}
