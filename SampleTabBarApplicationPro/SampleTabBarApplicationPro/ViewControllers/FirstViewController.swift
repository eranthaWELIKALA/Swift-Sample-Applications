//
//  FirstViewController.swift
//  SampleTabBarApplicationPro
//
//  Created by Erantha Welikala on 10/28/21.
//

import UIKit

class FirstViewController: UIViewController {
    
    var hideTap = true
    var stackView: UIStackView?
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hi, Welcome"
        label.font = UIFont(name: "Futura", size: 36)
        return label
    }()
    let bodyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
            label.text = "This is a sample application that is implemented by Erantha Welikala"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = .white
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimations)))
        
        setupStackView()
    }
    
    fileprivate func setupStackView() {
        if stackView == nil {
            stackView = UIStackView(arrangedSubviews: [titleLabel, bodyLabel])
        }
        if let subView = stackView {
            subView.axis = .vertical
            subView.frame = CGRect(x: 0, y: 0, width: 200, height: 400)
            
            view.addSubview(subView)
            
            subView.translatesAutoresizingMaskIntoConstraints = false
            subView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            subView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            subView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        }
    }
    
    @objc fileprivate func handleTapAnimations() {
        if hideTap {
            hideTap = false
            UIView.animate(
                withDuration: 0.5,
                delay: 0,
                usingSpringWithDamping: 0.5,
                initialSpringVelocity: 0.5,
                options: .curveEaseOut,
                animations: {
                    self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
                },
                completion: {
                    (_) in
                    UIView.animate(
                        withDuration: 0.5,
                        delay: 0,
                        usingSpringWithDamping: 1,
                        initialSpringVelocity: 1,
                        options: .curveEaseOut,
                        animations: {
                            self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)
                            self.titleLabel.alpha = 0
                        },
                        completion: nil
                    )
                }
            )
            
            UIView.animate(
                withDuration: 0.5,
                delay: 0.5,
                usingSpringWithDamping: 0.5,
                initialSpringVelocity: 0.5,
                options: .curveEaseOut,
                animations: {
                    self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
                },
                completion: {
                    (_) in
                    UIView.animate(
                        withDuration: 0.5,
                        delay: 0,
                        usingSpringWithDamping: 1,
                        initialSpringVelocity: 1,
                        options: .curveEaseOut,
                        animations: {
                            self.bodyLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)
                            self.bodyLabel.alpha = 0
                        },
                        completion: nil
                    )
                }
            )
        }
        else {
            hideTap = true
            UIView.animate(
                withDuration: 0.5,
                delay: 0,
                usingSpringWithDamping: 0.5,
                initialSpringVelocity: 0.5,
                options: .curveEaseIn,
                animations: {
                    self.titleLabel.transform = .identity
                    self.bodyLabel.transform = .identity
                    self.titleLabel.alpha = 1
                    self.bodyLabel.alpha = 1
                },
                completion: nil
            )
        }
    }

}
