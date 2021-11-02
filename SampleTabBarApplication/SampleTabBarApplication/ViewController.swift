//
//  ViewController.swift
//  SampleTabBarApplication
//
//  Created by Erantha Welikala on 10/27/21.
//

import UIKit

class ViewController: UIViewController {
    
    @objc let loginBtn: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 10
        btn.setTitle("Login", for: .normal)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginBtn.frame = CGRect(x: 0, y: 0, width: view.frame.width - 20, height: 50)
        loginBtn.center = view.center
        loginBtn.backgroundColor = .systemGreen
        loginBtn.addTarget(self, action: #selector(loginBtnClicked), for: .touchUpInside)
        view.addSubview(loginBtn)
    }
    
    @objc func loginBtnClicked(_ sender: UIButton) {
        let tabBarController: TabBarController = storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
        tabBarController.selectedViewController = tabBarController.viewControllers?[1]
        present(tabBarController, animated: true, completion: nil)
    }


}

