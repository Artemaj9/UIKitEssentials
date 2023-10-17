//
//  ViewController.swift
//  TableBootcamp
//
//  Created by Artem on 16.10.2023.
//

import UIKit

class ViewController: UIViewController {

    var contacts = Source.makeRandomContacts() {
        didSet {
        //    reloadData()
         //   reloadSection()
            reloadRows(newContacts: contacts, oldContacts: oldValue)
        }
    }

    let reload = UIButton()
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
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .blue
        tableView.backgroundView = label
        tableView.separatorInset = .init(top: 0, left: 32, bottom: 0, right: 16)
      //  tableView.rowHeight = 100 // automatic
      //  tableView.isEditing = true
        tableView.estimatedRowHeight = 50
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //contacts.count
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as? ContactCell
        else { fatalError("APP IS CRASHED!!!") }
        
        // cell.configure(contact: contacts[indexPath.row])
        cell.configure(contact: contacts[indexPath.row])
        
        return cell
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
        view.addSubview(reload)
        reload.translatesAutoresizingMaskIntoConstraints = false
        reload.setTitleColor(.black, for: .normal)
        reload.setTitleColor(.gray, for: .highlighted)
        NSLayoutConstraint.activate([
            reload.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            reload.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            reload.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 8),
            reload.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24)
            ])
        
        reload.setTitle("reload", for: .normal)
        reload.addTarget(self, action: #selector(reload(sender:)), for: .touchUpInside)
        
        reload.layer.cornerRadius = 15
        reload.layer.borderColor = UIColor.black.cgColor
        reload.layer.borderWidth = 1
    }
    
    @objc func reload(sender: UIButton) {
        contacts = Source.makeRandomContacts()
    }
}

extension ViewController {
    func reloadData() {
        tableView.reloadData()
    }
}

extension ViewController {
    func reloadSection() {
        tableView.reloadSections(.init(integer: 0), with: .fade)
    }
}

extension ViewController {
    func reloadRows(newContacts: [Contact], oldContacts: [Contact]) {
        var resultIndexPath: [IndexPath] = []
        let delta = abs(newContacts.count - oldContacts.count)
        let indexPath = (0..<delta).map { IndexPath(row: $0, section: 0)}
        
        if newContacts.count >= oldContacts.count {
            tableView.insertRows(at: indexPath, with: .fade)
            resultIndexPath = makeUpdateIndecies(bigger: newContacts, lower: oldContacts)
        } else {
            tableView.deleteRows(at: indexPath, with: .fade)
            resultIndexPath = makeUpdateIndecies(bigger: oldContacts, lower: newContacts)

        }
        
        tableView.reloadRows(at: resultIndexPath, with: .fade)
    }
    
    func makeUpdateIndecies(bigger: [Contact], lower: [Contact]) -> [IndexPath] {
        let indexPath = bigger.indices.map { IndexPath(row: $0, section: 0) }
        return indexPath.filter { index in
            guard index.row < lower.count else { return false }
            return bigger[index.row] != lower[index.row]
        }
    }
}
