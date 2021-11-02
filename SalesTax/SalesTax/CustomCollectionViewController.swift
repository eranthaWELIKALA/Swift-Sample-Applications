//
//  CustomCollectionViewController.swift
//  SalesTax
//
//  Created by Erantha Welikala on 10/15/21.
//

import UIKit

class CustomCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "*", "0", "#", "11", "12", "13"]
    let colors:[UIColor] = [.blue, .gray, .yellow, .red, .green, .brown, .magenta, .orange, .systemPink, .systemBlue, .systemTeal, .systemRed, .systemPink, .systemGray, .systemGreen]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
//        cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: collectionView.bounds.size.width/4, height: cell.frame.height)
        cell.cellLabel.text = items[indexPath.item]
        print(items[indexPath.item])
        cell.backgroundColor = colors[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width/3-10, height: collectionView.bounds.size.width/3)
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
