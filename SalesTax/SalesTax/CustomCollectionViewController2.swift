//
//  CustomCollectionViewController2.swift
//  SalesTax
//
//  Created by Erantha Welikala on 10/21/21.
//

import UIKit

class CustomCollectionViewController2: UIViewController {
    
    let items = ["10", "20", "30", "40", "50", "60", "70", "80", "90", "**", "00", "##", "110", "120", "130"]
    let colors:[UIColor] = [.blue, .gray, .yellow, .red, .green, .brown, .magenta, .orange, .systemPink, .systemBlue, .systemTeal, .systemRed, .systemPink, .systemGray, .systemGreen]
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
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

extension CustomCollectionViewController2: UICollectionViewDelegate {
    
}

extension CustomCollectionViewController2: UICollectionViewDataSource {
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
}

extension CustomCollectionViewController2: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width/3-10, height: collectionView.bounds.size.width/3)
    }
}
