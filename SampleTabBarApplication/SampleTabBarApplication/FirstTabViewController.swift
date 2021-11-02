//
//  FirstTabViewController.swift
//  SampleTabBarApplication
//
//  Created by Erantha Welikala on 10/27/21.
//

import UIKit

class FirstTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutBtnClicked(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

}
