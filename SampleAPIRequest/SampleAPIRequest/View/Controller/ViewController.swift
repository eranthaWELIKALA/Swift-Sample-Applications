//
//  ViewController.swift
//  SampleAPIRequest
//
//  Created by Erantha Welikala on 11/5/21.
//

import UIKit

class ViewController: UIViewController {
    
    var holidayViewModel: HolidayViewModel?
    
    let searchbar: UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.placeholder = "Enter Country Code eg. US"
        return searchBar
    }()
    let tableView: UITableView = {
        let table = UITableView()
        table.register(SubtitleTableViewCell.self, forCellReuseIdentifier: "holidayCell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        holidayViewModel = HolidayViewModel(
            didSetHandler: {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
        })
        // Do any additional setup after loading the view.
        view.addSubview(searchbar)
        searchbar.delegate = self
        searchbar.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    override func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate([
            searchbar.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            searchbar.heightAnchor.constraint(equalToConstant: 60),
            searchbar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
            tableView.topAnchor.constraint(equalTo: searchbar.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return holidayViewModel?.holidayList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SubtitleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "holidayCell", for: indexPath) as! SubtitleTableViewCell
        cell.textLabel?.text = holidayViewModel?.holidayList[indexPath.row].date
        cell.detailTextLabel?.text = holidayViewModel?.holidayList[indexPath.row].name
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchbar.text else { return }
        holidayViewModel?.retrieveHolidays(searchTerm: searchTerm)
        searchbar.endEditing(true)
        
    }
}
