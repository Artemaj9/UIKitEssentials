//
//  PresentedViewController.swift
//  NavigationBootacamp
//
//  Created by Artem on 09.11.2023.
//

import UIKit

class PresentedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let label = UILabel(frame: CGRect(x: 60, y: 100, width: 400, height: 30))
        view.addSubview(label)
        label.text = "I'm a presented ViewController!"
        
        let menu = UIMenu(
        title: "Back Menu title",
        children: [
            UIAction(title: "to One Controller", handler: { _ in
                let vc = self.navigationController?.children[1]
                self.navigationController?.popToViewController(vc!, animated: true)
            }),
            UIAction(title: "to Root Controller", handler: { _ in
                self.navigationController?.popToRootViewController(animated: true)
            })
        ]
        )
        // если action не задан, то всегда будет пытаться вернуть menu
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "back!",
            image: nil,
            target: self,
            action: nil,
            menu: menu
        )
        
    }
    
    @objc func popVc() {
        navigationController?.popViewController(animated: true)
    }
}
