//
//  SpinningCircleView.swift
//  CustomActivityIndicator
//
//  Created by Erantha Welikala on 10/22/21.
//

import UIKit

class SpinningCircleView: UIView {
    
    let spinngCircle = CAShapeLayer()
    let spinngCircle1 = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        frame = CGRect(x:0, y:0, width: 100, height: 100)
        
        let rect = self.bounds
        let circularPath = UIBezierPath(ovalIn: rect)
        
        spinngCircle.path = circularPath.cgPath
        spinngCircle.fillColor = UIColor.clear.cgColor
        spinngCircle.strokeColor = UIColor.systemRed.cgColor
        spinngCircle.lineWidth = 10
        spinngCircle.strokeEnd = 0.25
        spinngCircle.lineCap = .round
        self.layer.addSublayer(spinngCircle)
        
        let circularPath1 = UIBezierPath(arcCenter: center, radius: 50, startAngle: .pi, endAngle: 3/2 * .pi, clockwise: true)
        spinngCircle1.path = circularPath1.cgPath
        spinngCircle1.fillColor = UIColor.clear.cgColor
        spinngCircle1.strokeColor = UIColor.systemBlue.cgColor
        spinngCircle1.lineWidth = 10
        spinngCircle1.lineCap = .round
        self.layer.addSublayer(spinngCircle1)
    }
    
    func animate() {
        UIView.animate(
            withDuration: 1,
            delay: 0,
            options: .curveLinear,
            animations: {
                self.transform = CGAffineTransform(rotationAngle: .pi)
            },
            completion: {_ in 
                UIView.animate(
                    withDuration: 1,
                    delay:0,
                    options: .curveLinear,
                    animations: {
                        self.transform = CGAffineTransform(rotationAngle: 0)
                    },
                    completion: {_ in 
                        self.animate()
                    })
            })
    }
    
}
