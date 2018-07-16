//
//  LoadingFeedbackView.swift
//  CSRecutingDay
//
//  Created by Gerlandio Da Silva Lucena on 04/11/17.
//  Copyright © 2017 GerlandioLucena. All rights reserved.
//

import UIKit
import SnapKit

class LoadingFeedbackView: UIView {
    
    lazy var activityIndicator: UIActivityIndicatorView  = {
        let activity = UIActivityIndicatorView()
        activity.color = UIColor.white
        activity.hidesWhenStopped = true
        activity.activityIndicatorViewStyle = .whiteLarge
        activity.startAnimating()
        return activity
    }()
    
    lazy var labelDescription: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.numberOfLines = 0
        return label
    }()
    
    lazy var errorButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 4.0
        button.layer.masksToBounds = true
        button.isHidden = true
        button.setTitleColor(superview?.backgroundColor ?? UIColor.white, for: .normal)
        button.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 55.0)
        return button
    }()

    init(parentView: UIView, feedbackMessage: String = "loading".localized()) {
        super.init(frame: CGRect.zero)
        parentView.addSubview(self)
        labelDescription.text = feedbackMessage
        setupCurrentView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Não implementado para esta classe.")
    }
    
    func setupCurrentView() {
        self.backgroundColor = superview?.backgroundColor ?? UIColor.white
        self.addSubview(activityIndicator)
        self.addSubview(labelDescription)
        self.addSubview(errorButton)
        
        activityIndicator.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.centerY.equalToSuperview()
        }
        
        labelDescription.snp.makeConstraints { (maker) in
            maker.leftMargin.equalToSuperview().offset(12.0)
            maker.rightMargin.equalToSuperview().offset(-12.0)
            maker.topMargin.equalTo(activityIndicator.snp.bottom).offset(20.0)
        }
        
        errorButton.snp.makeConstraints { (maker) in
            if let superview = superview {
                maker.leftMargin.equalToSuperview().offset(12.0)
                maker.rightMargin.equalToSuperview().offset(-12.0)
                maker.bottom.equalTo(superview.snp.bottom).offset(-12.0)
                maker.height.equalTo(55.0)
            }
        }
        
        self.snp.makeConstraints { (maker) in
            if let superview = superview {
                maker.left.equalTo(superview.snp.left)
                maker.right.equalTo(superview.snp.right)
                maker.bottom.equalTo(superview.snp.bottom)
                maker.top.equalTo(superview.snp.top)
            }
        }
    }
}
