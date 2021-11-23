//
//  ViewController.swift
//  NetworkClientTesting
//
//  Created by Erantha Welikala on 11/23/21.
//

import UIKit
import NetworkClient

class ViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Network Client Testing"
        label.font = label.font.withSize(20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let elabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(titleLabel)
        view.addSubview(label)
        view.addSubview(elabel)
        
        let path = "\(Constants.ENDPOINTS["users"]!)/2"
        let userResource = Resource<UserNetworkResponse, CustomError>(jsonDecorder: JSONDecoder(), path: path)
        
        _ = AppDelegate.networkClient.load(resource: userResource) {
            [weak self] response in
            
            DispatchQueue.main.async {
                // UI Update
                guard let controller = self else {
                    return
                }
                if let userResponse = response.value {
                    print("Response: \(userResponse)")
                    let user: User = userResponse.data as User
                    
                    controller.label.text = "\(user.first_name) \(user.last_name)"
                    controller.elabel.text = "\(user.email)"
                    
                }
                else if let error = response.error {
                    // Show an error message
                    print("Error: \(error)")
                }
            }
        }
    }

    override func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            label.heightAnchor.constraint(equalToConstant: 50),
            elabel.topAnchor.constraint(equalTo: label.bottomAnchor),
            elabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            elabel.heightAnchor.constraint(equalToConstant: 50),
            titleLabel.bottomAnchor.constraint(equalTo: label.topAnchor),
            titleLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

