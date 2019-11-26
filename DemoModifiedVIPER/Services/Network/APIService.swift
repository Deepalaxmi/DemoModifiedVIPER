//
//  APIService.swift
//  DemoModifiedVIPER
//
//  Created by Deepalaxmi Khangembam on 25/11/19.
//  Copyright © 2019 Deepalaxmi Khangembam. All rights reserved.
//

import Foundation
import UIKit

class APIService: NSObject {
    
    static let shared = APIService()
    private override init(){
    }
    
    deinit {
//      observation?.invalidate()
    }
    
    enum HTTPMethodType: Int {
      case POST = 0
      case GET
    }
    
    typealias apiServiceCompletionBlock = (_ data: Data?,_ error: Error?)->Void
//    private var observation: NSKeyValueObservation?
    
    func requestAPI(urlString: String, httpMethodType: HTTPMethodType, completion: @escaping apiServiceCompletionBlock){
        
        let escapedURL = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: escapedURL!)!
        var request = URLRequest(url: url)
        
        switch httpMethodType {
        case .GET :
            request.httpMethod = "GET"
        case .POST :
        request.httpMethod = "POST"
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil,error)
                return
            }
            completion(data,nil)
        }
//        if observation != nil {
//            observation?.invalidate()
//        }
//        observation = task.progress.observe(\.fractionCompleted) { progress, _ in
//          print("progress: ", progress.fractionCompleted)
//        }
        task.resume()
    }
    
}


