//
//  GoogleController.swift
//  DemoModifiedVIPER
//
//  Created by Deepalaxmi Khangembam on 25/11/19.
//  Copyright © 2019 Deepalaxmi Khangembam. All rights reserved.
//

import Foundation

class GoogleController: GoogleViewToControllerProtocol {
    var interactor: GoogleControllerToInteractorProtocol?
    var presenter: GoogleInteractorToPresenterProtocol?
    
    func fetchData() {
        if let presenter = self.presenter {
            interactor?.fetchData(presenter: presenter)
        }
    }
    
    func reset() {
        presenter?.reset()
    }
    
    func initialSetUp() {
        presenter?.initialSetUp()
       }
}
