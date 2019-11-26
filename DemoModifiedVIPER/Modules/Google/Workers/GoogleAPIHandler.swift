//
//  GoogleAPIHandler.swift
//  DemoModifiedVIPER
//
//  Created by Deepalaxmi Khangembam on 25/11/19.
//  Copyright © 2019 Deepalaxmi Khangembam. All rights reserved.
//

import Foundation

enum WebServiceAPIPaths {
  static let googleAPIPath = "https://www.google.com"
}

enum Result: Int {
    case success
    case fail
}

class GoogleAPIHandler: GoogleInteractorToAPIHandlerProtocol {
    var requestHandler: GoogleAPIHandlerToInteractorProtocol?
    
//    func fetchData() {
//        //check if net available
//        APIService.shared.requestAPI(urlString: WebServiceAPIPaths.googleAPIPath, httpMethodType: .GET) { (response, error) in
//            print("GoogleAPIHandler response \(String(describing: response))")
//            guard error == nil else {
//                self.requestHandler?.didReceive(response: .fail)
//                return
//            }
//            self.requestHandler?.didReceive(response: .success)
//        }
//    }
    
    func fetchData(presenter: GoogleInteractorToPresenterProtocol) {
        APIService.shared.requestAPI(urlString: WebServiceAPIPaths.googleAPIPath, httpMethodType: .GET) { (response, error) in
            print("GoogleAPIHandler response \(String(describing: response))")
            guard error == nil else {
                self.requestHandler?.didReceive(response: .fail,presenter: presenter)
                return
            }
            self.requestHandler?.didReceive(response: .success,presenter: presenter)
        }
    }
}
