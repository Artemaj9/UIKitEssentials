//
//  ViewController.swift
//  NavigationBootacamp
//
//  Created by Artem on 09.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let presentButton = UIButton()
    let pushButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "ViewController"
        configurePresentButton()
        configurePushButton()
        configureBackButtonItem()
    }
    
 
}

extension ViewController {
    func configurePresentButton() {
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(presentButton)
        NSLayoutConstraint.activate([
            presentButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.widthAnchor.constraint(equalToConstant: 200),
            presentButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        presentButton.makeMeButton("Present", color: .red)
        presentButton.addTarget(self, action: #selector(presentButtonAction), for: .touchUpInside)
    }
        
        
        func configurePushButton() {
            pushButton.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(pushButton)
            NSLayoutConstraint.activate([
                pushButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 140),
                pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                pushButton.widthAnchor.constraint(equalToConstant: 200),
                pushButton.heightAnchor.constraint(equalToConstant: 60)
            ])
            
            pushButton.makeMeButton("Push", color: .red)
            pushButton.addTarget(self, action: #selector(pushButtonAction), for: .touchUpInside)
        }
        
        @objc func presentButtonAction() {
            let controller = PresentedViewController()
            present(controller, animated: true, completion: nil)
        }
    
        @objc func pushButtonAction() {
            
        let controller = OnePushViewController()
            navigationController?.pushViewController(controller, animated: true)
        }
}


extension UIButton {
    func makeMeButton(_ title: String, color: UIColor?) {
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.backgroundColor = color ?? .red
    }
}
extension ViewController {
    func configureBackButtonItem() {
        //navigationItem.backButtonTitle = "BACK!"
        // navigationItem.backButtonDisplayMode = .minimal
        // navigationItem.ba
        
        
        /*
         navigationItem.backBarButtonItem = UIBarButtonItem(
         title: "Roll it!",
         style: .plain,
         target: self,
         action: #selector(backAction)
         )
         */
    }
    
}
