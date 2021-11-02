//
//  ViewController.swift
//  SampleTableViewApp
//
//  Created by Erantha Welikala on 10/25/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var techTable: UITableView!
    var dataSourceArray = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        techTable.delegate = self
        techTable.dataSource = self
        dataSourceArray = ["Python", "Javascript", "Java", "Swift", "GoLang", "C#", "C++", "Scala"]
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.textLabel?.textColor = .white
        print("\(dataSourceArray[indexPath.row]) is selected")
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.textLabel?.textColor = .black
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataSourceArray[indexPath.row]
        cell.textLabel?.textAlignment = .center
        let selectedView:UIView = cell.backgroundView ?? UIView()
        selectedView.backgroundColor = .blue
        cell.selectedBackgroundView = selectedView
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Languages"
    }
    
}

