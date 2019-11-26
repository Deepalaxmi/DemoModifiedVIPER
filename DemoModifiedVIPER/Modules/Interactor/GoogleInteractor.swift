//
//  GoogleInteractor.swift
//  DemoModifiedVIPER
//
//  Created by Deepalaxmi Khangembam on 25/11/19.
//  Copyright © 2019 Deepalaxmi Khangembam. All rights reserved.
//

import Foundation

class GoogleInteractor: GoogleControllerToInteractorProtocol {
    var apiHandler: GoogleInteractorToAPIHandlerProtocol?
    
    func fetchData(presenter: GoogleInteractorToPresenterProtocol) {
        apiHandler?.fetchData(presenter: presenter)
    }

}

extension GoogleInteractor: GoogleAPIHandlerToInteractorProtocol {
    func didReceive(response: Result, presenter: GoogleInteractorToPresenterProtocol) {
        presenter.didFetchData(response: response)
    }
}
