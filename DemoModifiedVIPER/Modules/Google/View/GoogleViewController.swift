//
//  ViewController.swift
//  DemoModifiedVIPER
//
//  Created by Deepalaxmi Khangembam on 25/11/19.
//  Copyright © 2019 Deepalaxmi Khangembam. All rights reserved.
//

import UIKit

class GoogleViewController: UIViewController {
    @IBOutlet weak var fetchButton: UIButton!
    @IBOutlet weak var progressBarView: UIProgressView!
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    var controller: GoogleViewToControllerProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        controller?.initialSetUp()
    }
    
    @IBAction func fetchButtonPressed(_ sender: UIButton) {
        self.fetchButtonAction()
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        self.resetButtonActoin()
    }

}

//MARK: Outlet Actions
extension GoogleViewController {
    private func fetchButtonAction() {
        self.loader.startAnimating()
        self.controller?.fetchData()
    }
    
    private func resetButtonActoin() {
        self.controller?.reset()
    }
}

extension GoogleViewController: GoogleViewDataToViewProtocol {
    func setResponseLabel(isHidden: Bool) {
        DispatchQueue.main.async {
            self.responseLabel.isHidden = isHidden
        }
    }
    
    func setFetchButton(isHidden: Bool) {
        DispatchQueue.main.async {
            self.fetchButton.isHidden = isHidden
        }
    }
    
    func setResetButton(isHidden: Bool) {
        DispatchQueue.main.async {
            self.resetButton.isHidden = isHidden
        }
    }
        
    func showLabel(message: String) {
        DispatchQueue.main.async {
            self.responseLabel.text = message
        }
    }
    
    func setLoader(isHidden: Bool) {
        DispatchQueue.main.async {
            if isHidden {
                self.loader.stopAnimating()
            } else {
                self.loader.startAnimating()
            }
        }
    }
}

