//
//  FifthViewController.swift
//  SampleTabBarApplicationPro
//
//  Created by Erantha Welikala on 10/28/21.
//

import UIKit

class FifthViewController: UIViewController {
    
    let logoutBtn: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 10
        btn.setTitle("Logout", for: .normal)
        btn.backgroundColor = .systemRed
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        // Configuring the Logout Button
        view.addSubview(logoutBtn)
        logoutBtn.addTarget(self, action: #selector(logoutBtnTapped), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logoutBtn.frame =  CGRect(x: 0, y: 0, width: view.frame.width - 20, height: 50)
        logoutBtn.center = view.center
    }

    @objc func logoutBtnTapped() {
        dismiss(animated: true, completion: nil)
    }

}
