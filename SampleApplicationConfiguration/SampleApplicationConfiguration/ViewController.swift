//
//  ViewController.swift
//  SampleApplicationConfiguration
//
//  Created by Erantha Welikala on 11/2/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .white
        let textLabel = UILabel(frame: .zero)
        textLabel.text = "Hello World!"
        textLabel.textAlignment = .center
        view.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50),
            textLabel.heightAnchor.constraint(equalToConstant: 50),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}

