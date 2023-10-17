//
//  ViewController.swift
//  ScrollViewRules
//
//  Created by Artem on 16.10.2023.
//

import UIKit

class ViewController: UIViewController {

    let scrollView = UIScrollView()
    let contentView = UIView()
    let hiNameLabel = UILabel()
    let logOutButton = UIButton()
    
    override func viewDidLoad() {
        hiNameLabel.text = "Hi, Artem!"
        hiNameLabel.textColor = .black
        hiNameLabel.font = UIFont.systemFont(ofSize: 20)
        
        logOutButton.setTitle("LogOut", for: .normal)
        logOutButton.setTitleColor(.black, for: .normal)
        logOutButton.setTitleColor(.gray, for: .highlighted)
        logOutButton.backgroundColor = .blue
        logOutButton.layer.cornerRadius = 10
        
        
        layoutUIInScrollView()
        layoutUIInScrollView()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    private func layoutScrollViewAndContentView() {
           scrollView.translatesAutoresizingMaskIntoConstraints = false
           contentView.translatesAutoresizingMaskIntoConstraints = false
           view.addSubview(scrollView)
           scrollView.addSubview(contentView)
           scrollView.backgroundColor = .systemRed
           NSLayoutConstraint.activate([
               scrollView.topAnchor.constraint             (equalTo: view.topAnchor),
               scrollView.bottomAnchor.constraint          (equalTo: view.bottomAnchor),
               scrollView.leadingAnchor.constraint         (equalTo: view.leadingAnchor),
               scrollView.trailingAnchor.constraint        (equalTo: view.trailingAnchor),

               contentView.topAnchor.constraint            (equalTo: scrollView.topAnchor),
               contentView.bottomAnchor.constraint         (equalTo: scrollView.bottomAnchor),
               contentView.leadingAnchor.constraint        (equalTo: scrollView.leadingAnchor),
               contentView.trailingAnchor.constraint       (equalTo: scrollView.trailingAnchor),

               contentView.widthAnchor.constraint          (equalTo: scrollView.widthAnchor),
               contentView.heightAnchor.constraint         (equalToConstant: 2000),

           ])
       }

       private func layoutUIInScrollView() {
           contentView.addSubview(hiNameLabel)
           contentView.addSubview(logOutButton)

           NSLayoutConstraint.activate([
               hiNameLabel.centerXAnchor.constraint        (equalTo: contentView.centerXAnchor),
               hiNameLabel.topAnchor.constraint            (equalTo: contentView.topAnchor),
               hiNameLabel.widthAnchor.constraint          (equalToConstant: 150),
               hiNameLabel.heightAnchor.constraint         (equalToConstant: 2000),

               logOutButton.centerXAnchor.constraint       (equalTo: contentView.centerXAnchor),
               logOutButton.topAnchor.constraint           (equalTo: contentView.centerYAnchor),
               logOutButton.widthAnchor.constraint         (equalToConstant: 150),
               logOutButton.heightAnchor.constraint        (equalToConstant: 500),
           ])
       }
}

