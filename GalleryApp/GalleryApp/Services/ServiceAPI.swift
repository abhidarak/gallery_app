//
//  ServiceAPI.swift
//  GalleryApp
//
//  Created by Abhishek Darak on 23/11/22.
//

import Foundation
import SwiftyJSON

class ServiceAPI {
    
    static let sharedInstance = ServiceAPI()
    
    func execute(params: KeyValuePairs<String, String>, onCompletion: @escaping(Result<JSON, Error>) -> Void) {
        
        let finalParams = Util.toPostParams(rawParams: params)
        
        let urlStr = Constant.Url.API_URL
        let url = URL(string: urlStr)!
        
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = Constant.HTTPMethod.POST
        request.httpBody = finalParams
        
        let _: Void = session.dataTask(with: request) {(data, response, error) in
            
            DispatchQueue.main.async {
                guard let data = data else {
                    onCompletion(.failure(error!))
                    return
                }
                onCompletion(.success(JSON(data)))
            }
            
        }.resume()
    }

    func execute(onCompletion: @escaping(Result<JSON, Error>) -> Void) {
        
        let urlStr = Constant.Url.API_URL
        let url = URL(string: urlStr)!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = Constant.HTTPMethod.GET

        let _: Void = session.dataTask(with: request) {(data, response, error) in
            
            DispatchQueue.main.async {
                guard let data = data else {
                    onCompletion(.failure(error!))
                    return
                }
                onCompletion(.success(JSON(data)))
            }
            
        }.resume()
    }
}

