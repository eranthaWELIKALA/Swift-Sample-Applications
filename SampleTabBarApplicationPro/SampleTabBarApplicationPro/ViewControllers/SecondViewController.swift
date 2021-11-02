//
//  SecondViewController.swift
//  SampleTabBarApplicationPro
//
//  Created by Erantha Welikala on 10/28/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    let nextPageBtn: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 10
        btn.setTitle("Go to NextPage", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contact"
        view.backgroundColor = .white
        
        // Configuring the Next Page Button
        view.addSubview(nextPageBtn)
        nextPageBtn.addTarget(self, action: #selector(nextPageBtnTapped), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nextPageBtn.frame =  CGRect(x: 0, y: 0, width: view.frame.width - 20, height: 50)
        nextPageBtn.center = view.center
    }
    
    @objc func nextPageBtnTapped() {
        let nextVC = SixthViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

}
