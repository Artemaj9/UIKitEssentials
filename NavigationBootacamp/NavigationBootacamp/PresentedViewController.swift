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
    }
    
    override  func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // dismiss(animated: true, completion: nil)
    }
}
