//
//  GoogleViewData.swift
//  DemoModifiedVIPER
//
//  Created by Deepalaxmi Khangembam on 25/11/19.
//  Copyright © 2019 Deepalaxmi Khangembam. All rights reserved.
//

import Foundation

class GoogleViewData: GooglePresenterToViewDataProtocol {
    weak var view: GoogleViewDataToViewProtocol?    
    var responseText: String = "" {
        didSet {
            didSetResponseText()
        }
    }
    
    var isResponseLabelHidden: Bool = true {
        didSet {
            setResponseLabel()
        }
    }
    
    var isFetchButtonHidden: Bool = false {
        didSet {
            setFetchButton()
        }
    }
    
    var isResetButtonHidden: Bool = true {
        didSet {
            setResetButton()
        }
    }
    
    var isLoaderHidden: Bool = true {
        didSet {
            setLoader()
        }
    }
    
    func initialSetUp() {
        self.isResponseLabelHidden = true
        self.isFetchButtonHidden = false
        self.isResetButtonHidden = true
        self.isLoaderHidden = true
    }
    
    func didFetchData(response: Result, message: String) {
        self.responseText = message
        self.isResponseLabelHidden = false
        self.isFetchButtonHidden = true
        self.isResetButtonHidden = false
        self.isLoaderHidden = true
    }
    
    func reset() {
        self.isResponseLabelHidden = true
        self.isFetchButtonHidden = false
        self.isResetButtonHidden = true
        self.isLoaderHidden = true
    }
}

//MARK: Private Methods
extension GoogleViewData {
    private func didSetResponseText() {
        view?.showLabel(message: self.responseText)
    }
    
    private func setResponseLabel() {
        view?.setResponseLabel(isHidden: self.isResponseLabelHidden)
    }
    
    private func setFetchButton() {
        view?.setFetchButton(isHidden: self.isFetchButtonHidden)
    }
    
    private func setResetButton() {
        view?.setResetButton(isHidden: self.isResetButtonHidden)
    }
    
    private func setLoader() {
        view?.setLoader(isHidden: self.isLoaderHidden)
    }
}
