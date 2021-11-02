//
//  ViewController.swift
//  SampleTabBarApplicationPro
//
//  Created by Erantha Welikala on 10/28/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginBtn: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 10
        btn.setTitle("Login", for: .normal)
        btn.backgroundColor = .systemGreen
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configuring the Login Button
        view.addSubview(loginBtn)
        loginBtn.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loginBtn.frame =  CGRect(x: 0, y: 0, width: view.frame.width - 20, height: 50)
        loginBtn.center = view.center
    }
    
    @objc func loginBtnTapped() {
        // Creating the TabBarController
        let tabBarVC = UITabBarController()
        
        // Creating the ViewController array for the TabBarController
        var viewControllersArr: [UIViewController] = []
        
        // Initializing the ViewControllers within NavigationControllers
        let firstVC = UINavigationController(rootViewController: FirstViewController())
        let secondVC = UINavigationController(rootViewController: SecondViewController())
        let thirdVC = UINavigationController(rootViewController: ThirdViewController())
        let fourthVC = UINavigationController(rootViewController: FourthViewController())
        let fifthVC = UINavigationController(rootViewController: FifthViewController())
        
        // Setting Tab Titles
        firstVC.title = "Home"
        secondVC.title = "Contact"
        thirdVC.title = "Help"
        fourthVC.title = "About"
        fifthVC.title = "Settings"
        
        // Add Tabs(ViewControllers) to the ViewControllers Array
        viewControllersArr.append(firstVC)
        viewControllersArr.append(secondVC)
        viewControllersArr.append(thirdVC)
        viewControllersArr.append(fourthVC)
        viewControllersArr.append(fifthVC)
        
        // Set the TabBarViewControllers
        tabBarVC.setViewControllers(viewControllersArr, animated: true)
        guard let tabBarItems = tabBarVC.tabBar.items else {
            return
        }
        
        let tabBarIcons = ["house", "bell", "person.circle", "star", "gear"]
        
        for index in stride(from: 0, to: tabBarItems.count, by: 1) {
            if #available(iOS 13.0, *) {
                tabBarItems[index].image = UIImage(systemName: tabBarIcons[index])
            } else {
                // Fallback on earlier versions
            }
        }
        
        // Set Fullscreen to the TabBar View
        tabBarVC.modalPresentationStyle = .fullScreen
        
        // Present the TabBarController
        present(tabBarVC, animated: true, completion: nil)
    }


}

