//
//  GoogleBuilder.swift
//  DemoModifiedVIPER
//
//  Created by Deepalaxmi Khangembam on 25/11/19.
//  Copyright © 2019 Deepalaxmi Khangembam. All rights reserved.
//

import Foundation
import UIKit

class GoogleBuilder {
    
    static func createGoogleModule() -> UIViewController {
        if let view = mainStoryBoard.instantiateViewController(identifier: "GoogleViewController") as? GoogleViewController {
            let controller = GoogleController()
            let interactor = GoogleInteractor()
            let presenter = GooglePresenter()
            let router = GoogleRouter()
            let apiHandler = GoogleAPIHandler()
            let requestHandler = interactor
            let viewData = GoogleViewData()
            
            view.controller = controller
            controller.interactor = interactor
            controller.presenter = presenter
//            interactor.presenter = presenter
            interactor.apiHandler = apiHandler
            apiHandler.requestHandler = requestHandler
            presenter.router = router
            presenter.viewData = viewData
            viewData.view = view
            return view
        }
        return UIViewController()
    }
    
    static var mainStoryBoard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
