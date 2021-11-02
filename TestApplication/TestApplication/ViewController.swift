//
//  ViewController.swift
//  TestApplication
//
//  Created by Erantha Welikala on 10/21/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        activityIndicator.startAnimating()
    }

    @IBAction func startBtnClicked(_ sender: UIButton) {
//        activityIndicator.startAnimating()
        showSpinner(withSpinnerTime:5)
    }
    
    @IBAction func stopBtnClicked(_ sender: UIButton) {
//        activityIndicator.stopAnimating()
        hideSpinner()
    }
}

