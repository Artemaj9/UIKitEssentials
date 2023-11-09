//
//  TwoPushViewController.swift
//  NavigationBootacamp
//
//  Created by Artem on 09.11.2023.
//

import UIKit

class TwoPushViewController: UIViewController {

    let popToRootButton = UIButton()
    let pushButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .purple
        title = "OnePushViewController"
        configurePopToRootButton()
    }
}

extension TwoPushViewController{
        
    
    
    func configurePopToRootButton() {
        popToRootButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(popToRootButton)
        NSLayoutConstraint.activate([
            popToRootButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -140),
            popToRootButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popToRootButton.widthAnchor.constraint(equalToConstant: 200),
            popToRootButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        popToRootButton.makeMeButton("Pop to root", color: .green)
        popToRootButton.setTitleColor(.blue, for: .normal)
        popToRootButton.addTarget(self, action: #selector(popButtonAction), for: .touchUpInside)
    }
        
        @objc func popButtonAction() {
            navigationController?.popToRootViewController(animated: true)
        }
}
