//
//  ViewController.swift
//  ScrollBootcamp
//
//  Created by Artem on 15.10.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var scrollView = UIScrollView()
    var imageView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        scrollView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        scrollView.center = view.center
        view.addSubview(scrollView)
        
        scrollView.layer.borderWidth = 1
        scrollView.layer.borderColor = UIColor.black.cgColor
        
        scrollView.contentSize = CGSize(width: 600, height: 600)
        imageView.image = UIImage(systemName: "pencil.circle.fill")
        scrollView.addSubview(imageView)
        imageView.frame.size = scrollView.contentSize
        
        scrollView.contentOffset = CGPoint(x: 200, y: 200)
        
       // scrollView.contentInset = UIEdgeInsets(top: -150, left: 15, bottom: 15, right: 15)
       // scrollView.isDirectionalLockEnabled = true
//        scrollView.showsVerticalScrollIndicator = false
//        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 2
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        sleep(1)
        scrollView.setContentOffset(CGPoint(x: 150, y: 150), animated: true)
        
        
    }
    // MARK: - delegate

}

