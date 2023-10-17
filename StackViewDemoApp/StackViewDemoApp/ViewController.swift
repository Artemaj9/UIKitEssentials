//
//  ViewController.swift
//  StackViewDemoApp
//
//  Created by Artem on 16.10.2023.
//

import UIKit

class ViewController: UIViewController {

    let textField = UITextField()
    var percents = [0, 5, 10, 15, 20, 25]
    var summ: Double = 0
    var contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(textfieldAction(sender:)), for: .editingChanged)
        
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 10
        textField.placeholder = "Enter text here..."
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 40)
            
        ])
        
        let scrollview = UIScrollView()
        view.addSubview(scrollview)
        
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.isScrollEnabled = true
        
        NSLayoutConstraint.activate([
            scrollview.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 30),
            scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scrollview.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        let stackView = UIStackView(arrangedSubviews: percents.map { makeButton(with: $0)})
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        scrollview.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollview.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollview.widthAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
      //  self.scrollview.contentSize = self.contentView.bounds.size*2
    }

    func makeButton(with percent: Int) -> UIButton {
        let button = UIButton()
        
        button.setTitle("discount \(percent)% ", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.tag = percent
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
       // NSLayoutConstraint.activate([
         //   button.widthAnchor.constraint(equalToConstant: 150),
           // button.heightAnchor.constraint(equalToConstant: 30)
      //  ])
        return button
    }
    @objc func textfieldAction(sender: UITextField) {
        if let text = sender.text,
           let number = Double(text) {
            summ = number
        } else {
            print("not valid summ")
        }
    }
    
    @objc func buttonAction(sender: UIButton) {
        let finishSumm = summ - summ/100 * Double(sender.tag)
        print(finishSumm)
        
        UIView.animate(withDuration: 0.25) {
            sender.isHidden = true
        }
    }

}

