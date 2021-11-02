//
//  SalesTaxViewController.swift
//  SalesTax
//
//  Created by Erantha Welikala on 10/15/21.
//

import UIKit

class SalesTaxViewController: UIViewController {
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var priceInput: UITextField!
    @IBOutlet weak var salesTaxInput: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // When user tap on screen
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
        totalPriceLabel.text = ""
    }
    
    @objc
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        if let priceString = priceInput.text,
           let salesTaxString = salesTaxInput.text {
            let price = Double(priceString)
            let salesTax = Double(salesTaxString)
            
            let totalSalesTax = price! * salesTax!
            let totalPrice = price! + totalSalesTax
            totalPriceLabel.text = "$\(totalPrice)"
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
