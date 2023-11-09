//
//  OnePushViewController.swift
//  NavigationBootacamp
//
//  Created by Artem on 09.11.2023.
//

import UIKit

class OnePushViewController: UIViewController {
    
    let pushButton = UIButton()
    let popButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        title = "OnePushViewController"
        configurePushButton()
        configurePopButton()
        // navigationItem.hidesBackButton = true
        // navigationItem.setHidesBackButton(true, animated: true)
        
        //        navigationItem.backAction = UIAction(handler: { _ in
        //            let controller = UIAlertController(title: "Are you sure?", message: "You'll lose you data", preferredStyle: .alert)
        //            let ok = UIAlertAction(title: "Ok", style: .default) { _ in
        //                self.navigationController?.popViewController(animated: true)
        //            }
        //
        //            let cancel = UIAlertAction(title: "cancel", style: .cancel)
        //
        //            controller.addAction(cancel)
        //            controller.addAction(ok)
        //            self.present(controller, animated: true)
        //        })
        
        /*
         navigationItem.leftBarButtonItem = UIBarButtonItem(
         title: "Roll it!",
         style: .plain,
         target: self,
         action: #selector(backAction)
         )
         }
         @objc func backAction() {
         // navigationController?.popViewController(animated: true)
         print(#function)
         }
         */
    }
}

extension OnePushViewController{
        
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
    
    
    func configurePopButton() {
        popButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(popButton)
        NSLayoutConstraint.activate([
            popButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -140),
            popButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popButton.widthAnchor.constraint(equalToConstant: 200),
            popButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        popButton.makeMeButton("Pop", color: .blue)
        popButton.addTarget(self, action: #selector(popButtonAction), for: .touchUpInside)
    }
        
        @objc func popButtonAction() {
            navigationController?.popViewController(animated: true)
        }
    
        @objc func pushButtonAction() {
            navigationController?.pushViewController(TwoPushViewController(), animated: true)
        }
}
