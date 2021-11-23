//
//  ViewController.swift
//  RestClient
//
//  Created by Erantha Welikala on 11/22/21.
//

import UIKit

class ViewController: UIViewController {
    
    var userTask: URLSessionDataTask?
    var users: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadUsers()
    }
    
    private func loadUsers() {
        userTask?.cancel()
        
        let userResource = Resource<[User], CustomError>(jsonDecorder: JSONDecoder(), path: "/59e8956d0f00000708aefb59")
        
        userTask = AppDelegate.networkClient.load(resource: userResource) {
            [weak self] response in
            guard let controller = self else { return }
            
            DispatchQueue.main.async {
                // UI Update
                
                if let users = response.value {
                    controller.users = users
                }
                else if let error = response.error {
                    // Show an error message
                    print(error.localizedDescription)
                }
            }
        } as? URLSessionDataTask
    }

}

