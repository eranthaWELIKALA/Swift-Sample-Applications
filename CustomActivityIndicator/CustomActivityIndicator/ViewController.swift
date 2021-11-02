//
//  ViewController.swift
//  CustomActivityIndicator
//
//  Created by Erantha Welikala on 10/22/21.
//

import UIKit

class ViewController: UIViewController {
    
    let spinningCircleView = SpinningCircleView()
    let rotatingCricleView = RotatingCirclesView()
    let fadingCricleView = FadingCirclesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configure()
        
        configureSpinningCircleView()
        spinningCircleView.animate()
        
//        configureRotatingCirclesView()
//        rotatingCricleView.animate(rotatingCricleView.circle1, counter: 1)
//        rotatingCricleView.animate(rotatingCricleView.circle2, counter: 3)
        
//        configureFadingCirclesView()
//        fadingCricleView.animate()
    }
    
    private func configure() {
        view.backgroundColor = .systemTeal
    }
    
    private func configureSpinningCircleView() {
        spinningCircleView.frame = CGRect(x: view.center.x-50, y: view.center.y-50, width: 100, height: 100)
        view.addSubview(spinningCircleView)
    }
    
    private func configureRotatingCirclesView() {
        view.addSubview(rotatingCricleView)
        NSLayoutConstraint.activate([
            rotatingCricleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rotatingCricleView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rotatingCricleView.heightAnchor.constraint(equalToConstant: 100),
            rotatingCricleView.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    private func configureFadingCirclesView() {
        view.addSubview(fadingCricleView)
        NSLayoutConstraint.activate([
            fadingCricleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fadingCricleView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            fadingCricleView.heightAnchor.constraint(equalToConstant: 40),
            fadingCricleView.widthAnchor.constraint(equalToConstant: 150),
        ])
    }


}

