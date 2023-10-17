//
//  ViewController.swift
//  ScrollDemoApp
//
//  Created by Artem on 16.10.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var scrollView = UIScrollView()
    var label = UILabel()
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        view.addSubview(scrollView)
        scrollView.addSubview(label)
        scrollView.addSubview(button)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: view.topAnchor, constant: -16),
            
            label.topAnchor.constraint(equalTo: scrollView.topAnchor),
            label.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            label.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            button.topAnchor.constraint(equalTo: label.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
        
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        label.textColor = .black
        
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.red.cgColor
        button.setTitle("OK", for: .normal)
        
        
       // scrollView.scrollsToTop = false
        scrollView.delegate = self

    }

    // MARK: - delegate
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        print("Scroll to top")
    }
    
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        return false
    }
    
}

