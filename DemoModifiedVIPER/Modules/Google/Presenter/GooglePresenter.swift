//
//  GooglePresenter.swift
//  DemoModifiedVIPER
//
//  Created by Deepalaxmi Khangembam on 25/11/19.
//  Copyright © 2019 Deepalaxmi Khangembam. All rights reserved.
//

import Foundation

class GooglePresenter: GoogleInteractorToPresenterProtocol {
    var viewData: GooglePresenterToViewDataProtocol?
    var router: GooglePresenterToRouterProtocol?
    
    func didFetchData(response: Result) {
        let message = getMessage(response: response)
        viewData?.didFetchData(response: response, message: message)
    }
    
    func reset() {
        viewData?.reset()
    }
    
    func initialSetUp() {
        viewData?.initialSetUp()
    }
    
    private func getMessage(response: Result) -> String {
        switch response {
        case .success:
            return "Success"
        case .fail:
            return "Fail"
        }
    }
}
