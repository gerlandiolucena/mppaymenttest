//
//  BaseViewController.swift
//  MPPaymentSelection
//
//  Created by Gerlandio Da Silva Lucena on 15/07/2018.
//  Copyright © 2018 GerlandioLucena. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    typealias actionButton = () -> Void
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    var initialView: LoadingFeedbackView?
    var buttonAction: actionButton?
    
    enum LoadingState {
        case initial
        case loading
        case ready
        case error(errorMsg: String, actionTitle: String, action: actionButton)
    }
    
    var loadingState: LoadingState = .initial {
        didSet {
            switch loadingState {
            case .initial:
                self.initialView?.isHidden = false
            case .loading:
                self.initialView?.activityIndicator.startAnimating()
            case .ready:
                self.initialView?.activityIndicator.stopAnimating()
                self.initialView?.isHidden = true
            case .error(let msg, let actionTitle, let action):
                self.buttonAction = action
                self.initialView?.activityIndicator.stopAnimating()
                self.initialView?.labelDescription.text = msg
                self.initialView?.errorButton.isHidden = false
                self.initialView?.errorButton.setTitle(actionTitle, for: .normal)
                self.initialView?.errorButton.removeTarget(self, action: nil, for: .touchUpInside)
                self.initialView?.errorButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            }
        }
    }
    
    @objc private func buttonPressed() {
        self.buttonAction?()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialView = LoadingFeedbackView(parentView: self.view)
    }
}
