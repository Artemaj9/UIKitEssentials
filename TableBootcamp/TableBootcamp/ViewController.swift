//
//  ViewController.swift
//  TableBootcamp
//
//  Created by Artem on 16.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
   // var contacts = Source.makeContacts()
    var contacts = Source.makeContactsWithGroup()
   // var contacts = Source.makeRandomContacts() {
     //   didSet {
   // }
    
    //let tableView: UITableView = .init()
    let editButton = UIButton()
    let tableView: UITableView = .init(frame: .zero, style: .insetGrouped)
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Some text"
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupButton()
        
        tableView.register(ContactCell.self, forCellReuseIdentifier: "ContactCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .blue
        tableView.backgroundView = label
        tableView.separatorInset = .init(top: 0, left: 32, bottom: 0, right: 16)
      //  tableView.rowHeight = 100 // automatic
      //  tableView.isEditing = true
        tableView.estimatedRowHeight = 50
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.scrollToRow(at: .init(row: 2, section: 1), at: .middle, animated: true)
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        <#code#>
//    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Group 1"
        case 1: return "Group 2"
        default: return nil
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //contacts.count
        contacts[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as? ContactCell
        else { fatalError("APP IS CRASHED!!!") }
        
       // cell.configure(contact: contacts[indexPath.row])
        cell.configure(contact: contacts[indexPath.section][indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        contacts[indexPath.section].remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let contact = contacts[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        contacts[destinationIndexPath.section].insert(contact, at: destinationIndexPath.row)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ac = UIAlertController(
            title: contacts[indexPath.section][indexPath.row].name,
            message: contacts[indexPath.section][indexPath.row].description,
            preferredStyle: .alert
            )
        ac.addAction(.init(title: "Ok", style: .default, handler: nil))
        present(ac, animated: true)
    }
}


extension ViewController {
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
          //  tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController {
    func setupButton() {
        view.addSubview(editButton)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.setTitleColor(.black, for: .normal)
        editButton.setTitleColor(.gray, for: .highlighted)
        NSLayoutConstraint.activate([
            editButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            editButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 8),
            editButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24)
            ])
        
        editButton.setTitle("reload", for: .normal)
        editButton.addTarget(self, action: #selector(edit(sender:)), for: .touchUpInside)
        
        editButton.layer.cornerRadius = 15
        editButton.layer.borderColor = UIColor.black.cgColor
        editButton.layer.borderWidth = 1
    }
    
    @objc func edit(sender: UIButton) {
        
        contacts = Source.makeContactsWithGroup()
        tableView.reloadData()
//        tableView.isEditing.toggle()
//        editButton.setTitle(tableView.isEditing ? "end edit" : "edit", for: .normal)
        
    }
}

