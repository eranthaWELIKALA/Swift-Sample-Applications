//
//  ViewController.swift
//  SalesTax
//
//  Created by Erantha Welikala on 10/14/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var fourthView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.bringSubviewToFront(firstView)
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            view.bringSubviewToFront(firstView)
        case 1:
            view.bringSubviewToFront(secondView)
        case 2:
            view.bringSubviewToFront(thirdView)
        case 3:
            view.bringSubviewToFront(fourthView)
        default:
            view.bringSubviewToFront(firstView)
        }
    }
    
    
}

