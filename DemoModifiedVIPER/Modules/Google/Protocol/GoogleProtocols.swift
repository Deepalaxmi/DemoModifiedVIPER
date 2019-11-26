//
//  GoogleProtocols.swift
//  DemoModifiedVIPER
//
//  Created by Deepalaxmi Khangembam on 25/11/19.
//  Copyright © 2019 Deepalaxmi Khangembam. All rights reserved.
//

import Foundation

protocol GoogleViewToControllerProtocol: class {
    var interactor: GoogleControllerToInteractorProtocol? {get set}
    func fetchData()
    func reset()
    func initialSetUp()
}

protocol GoogleControllerToInteractorProtocol: class {
//    var presenter: GoogleInteractorToPresenterProtocol? {get set}
    func fetchData(presenter:GoogleInteractorToPresenterProtocol)
    var apiHandler: GoogleInteractorToAPIHandlerProtocol? {get set}
//    func reset()
}

protocol GoogleInteractorToPresenterProtocol: class {
    var viewData: GooglePresenterToViewDataProtocol? {get set}
    func didFetchData(response: Result)
    func reset()
    func initialSetUp()
}

protocol GooglePresenterToViewDataProtocol: class {
    var view: GoogleViewDataToViewProtocol? {get set}
    var responseText: String {get set}
    var isResponseLabelHidden: Bool {get set}
    var isFetchButtonHidden: Bool {get set}
    var isResetButtonHidden: Bool {get set}
    var isLoaderHidden: Bool {get set}
    func didFetchData(response: Result,message: String)
    func reset()
    func initialSetUp()
}

protocol GoogleViewDataToViewProtocol: class {
    func showLabel(message: String)
    func setResponseLabel(isHidden: Bool)
    func setFetchButton(isHidden: Bool)
    func setResetButton(isHidden: Bool)
    func setLoader(isHidden: Bool)
}

protocol GooglePresenterToRouterProtocol: class {
}

protocol GoogleInteractorToAPIHandlerProtocol: class {
    var requestHandler: GoogleAPIHandlerToInteractorProtocol? {get set}
    func fetchData(presenter: GoogleInteractorToPresenterProtocol)
}

protocol GoogleAPIHandlerToInteractorProtocol: class {
    func didReceive(response: Result,presenter: GoogleInteractorToPresenterProtocol)
}

