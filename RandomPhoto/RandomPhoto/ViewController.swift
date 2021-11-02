//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Erantha Welikala on 10/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor.white
        return imageView
    }()
    
    private let button: UIButton = {
        let button: UIButton = UIButton()
        button.backgroundColor = .white
        button.setTitle("Refresh Photo", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    private let colors: [UIColor] = [
        .systemRed,
        .systemBlue,
        .systemPink,
        .systemTeal,
        .systemGray,
        .systemGreen,
        .systemYellow,
        .systemPurple,
        .systemOrange
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        view.backgroundColor = .systemPink
        
        setImageViewOptions()
        setButtonOptions()
        
        refreshImage()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setViewDidLayoutButtonSubview()
    }
    
    @objc func refreshButtonClicked() {
        refreshImage()
        view.backgroundColor = colors.randomElement()
    }
    
    func setImageViewOptions() {
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
    }
    
    func setButtonOptions() {
        view.addSubview(button)
        button.addTarget(self, action: #selector(refreshButtonClicked), for: .touchUpInside)
    }
    
    func setViewDidLayoutButtonSubview() {
        if #available(iOS 11.0, *) {
            button.frame = CGRect(
                x: 30,
                y: view.frame.size.height - 150 - view.safeAreaInsets.bottom,
                width: view.frame.size.width - 60,
                height: 55
            )
        } else {
            // Fallback on earlier versions
        }
    }
    
    func refreshImage() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else { return }
        imageView.image = UIImage(data: data)
    }


}

