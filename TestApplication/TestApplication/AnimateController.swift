//
//  AnimateController.swift
//  TestApplication
//
//  Created by Erantha Welikala on 10/21/21.
//

import UIKit

private var activityIndicatorView: UIView?

extension UIViewController {
    
    func showSpinner(withSpinnerTime: Double) {
        activityIndicatorView = UIView(frame: self.view.bounds)
        activityIndicatorView?.backgroundColor = .systemGray
        activityIndicatorView?.alpha = 0.75
        
        let activityIndicator: UIActivityIndicatorView?
        if #available(iOS 13.0, *) {
            activityIndicator = UIActivityIndicatorView(style: .large)
        } else {
            activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        }
        if let ai = activityIndicator, let aiv = activityIndicatorView {
            ai.center = aiv.center
            ai.startAnimating()
            aiv.addSubview(ai)
            self.view.addSubview(aiv)
        }
        
        Timer.scheduledTimer(withTimeInterval: withSpinnerTime, repeats: false) {
            (t) in
            self.hideSpinner()
        }
    }
    
    func hideSpinner() {
        activityIndicatorView?.removeFromSuperview()
        activityIndicatorView = nil
    }

}
