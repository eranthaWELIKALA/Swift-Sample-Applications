//
//  ViewController.swift
//  SampleCoreDataManager
//
//  Created by Erantha Welikala on 10/29/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var filterTextField: UITextField!
    var personList: [Person]?
    var tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Core Data Manager"
        filterTextField.delegate = self
        retrievePersonData()
        configureTableView()
    }
    
    @IBAction func addUserBtnTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add Person", message: nil, preferredStyle: .alert)
        alert.addTextField(configurationHandler: {
            (nameField) in
            nameField.placeholder = "Name of the Person"
        })
        alert.addTextField(configurationHandler: {
            (ageField) in
            ageField.placeholder = "Age of the Person"
            ageField.keyboardType = .numberPad
        })
        alert.addTextField(configurationHandler: {
            (genderField) in
            genderField.placeholder = "Gender of the Person"
        })
        
        let submitBtn = UIAlertAction(title: "Add", style: .default) {
            (action) in
            let nameField = alert.textFields![0]
            let ageField = alert.textFields![1]
            let genderField = alert.textFields![2]
            
            let person: Person = Person(context: self.context)
            if nameField.text != "" {
                person.name = nameField.text
                person.age = Int64(ageField.text ?? "0") ?? 0
                person.gender = genderField.text?.uppercased() ?? ""
                
                do {
                    try self.context.save()
                    self.retrievePersonData()
                }
                catch {
                    
                }
            }
        }
        alert.addAction(submitBtn)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func retrievePersonData(_ nameFilter: String? = nil) {
        do {
            let request = Person.fetchRequest() as NSFetchRequest<Person>
            
            // Set the filtering and sorting on the request
            if let name = nameFilter {
                if name != "" {
                    let pred = NSPredicate(format: "name CONTAINS[c] %@", name)
                    request.predicate = pred
                }
            }
            
            let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
            request.sortDescriptors = [sortDescriptor]
            
            self.personList = try context.fetch(request)
            print(self.personList ?? "No value")
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -40).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let person: Person = self.personList?[indexPath.row] {
            let alert = UIAlertController(title: "Edit Person", message: nil, preferredStyle: .alert)
            alert.addTextField(configurationHandler: {
                (nameField) in
                nameField.placeholder = "Name of the Person"
            })
            alert.addTextField(configurationHandler: {
                (ageField) in
                ageField.placeholder = "Age of the Person"
                ageField.keyboardType = .numberPad
            })
            alert.addTextField(configurationHandler: {
                (genderField) in
                genderField.placeholder = "Gender of the Person"
            })
            
            let nameField = alert.textFields![0]
            let ageField = alert.textFields![1]
            let genderField = alert.textFields![2]
            nameField.text = person.name
            ageField.text = String(person.age)
            genderField.text = person.gender
            
            let submitBtn = UIAlertAction(title: "Save", style: .default, handler: {
                (action) in
                
                let nameField = alert.textFields![0]
                let ageField = alert.textFields![1]
                let genderField = alert.textFields![2]
                
                person.name = nameField.text
                person.age = Int64(ageField.text ?? "0") ?? 0
                person.gender = genderField.text?.uppercased() ?? ""
                
                do {
                    try self.context.save()
                    self.retrievePersonData()
                }
                catch {
                    
                }
            })
            alert.addAction(submitBtn)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if let person: Person = self.personList?[indexPath.row] {
            let action = UIContextualAction(style: .destructive, title: "Delete", handler: { (action, view, completionHandler) in
                self.context.delete(person)
                
                do {
                    try self.context.save()
                    self.retrievePersonData()
                }
                catch {
                    
                }
            })
            return UISwipeActionsConfiguration(actions: [action])
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let person: Person = self.personList?[indexPath.row] {
            cell.textLabel?.text = "\(person.name!) - Age[\(person.age)] | Gender[\(person.gender!)]"
        }
        else {
            cell.textLabel?.text = "My Label"
        }
        return cell
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.retrievePersonData(textField.text)
        print(textField.text ?? "-")
        return true
    }
}

extension ViewController {
    func relationshipExample() {
        let family = Family(context: context)
        family.name = "Welikala"
        
        let person1 = Person(context: context)
        person1.name = "Erantha Welikala"
        person1.age = 26
        person1.gender = "MALE"
        
        let person2 = Person(context: context)
        person2.name = "Tharini Welikala"
        person2.age = 28
        person2.gender = "FEMALE"
        
        let person3 = Person(context: context)
        person3.name = "Chandrasiri Welikala"
        person3.age = 61
        person3.gender = "MALE"
        
        // Set family from the Person class
        person1.family = family
        person2.family = family
        person3.family = family
        
        // Add people to family one by one
        family.addToPeople(person1)
        family.addToPeople(person2)
        family.addToPeople(person3)
        
        // Add people to family as an Array
        family.addToPeople([person1, person2, person3])
        
        // Remove people from family one by one
        family.removeFromPeople(person1)
        family.removeFromPeople(person2)
        family.removeFromPeople(person3)
        
        // Remove people from family as an Array
        family.removeFromPeople([person1, person2, person3])
        
        do {
            try self.context.save()
        }
        catch {
            
        }
    }
}
