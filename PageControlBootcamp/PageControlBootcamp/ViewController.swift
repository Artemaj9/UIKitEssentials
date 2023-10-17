//
//  ViewController.swift
//  PageControlBootcamp
//
//  Created by Artem on 16.10.2023.
//

import UIKit

class ViewController: UIViewController {

    let scrollView = UIScrollView()
    
    let strings = ["one", "two", "three"]
    let pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        configurateScrollView()
        
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 16),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        pageControl.numberOfPages = strings.count
        pageControl.pageIndicatorTintColor = .blue
        pageControl.currentPageIndicatorTintColor = .green
        pageControl.hidesForSinglePage = true
        
        pageControl.backgroundStyle = .automatic
        pageControl.allowsContinuousInteraction = true
        print(pageControl.interactionState)
        
        pageControl.preferredIndicatorImage = UIImage(systemName: "paperplane")
        pageControl.setIndicatorImage(UIImage(systemName: "heart.fill"), forPage: 1)
        pageControl.setIndicatorImage(UIImage(systemName: "sun.dust.fill"), forPage: 2)
        
        pageControl.addTarget(self, action: #selector(pageDidChange(sender:)), for: .valueChanged)
        scrollView.delegate = self
       // pageControl.indicatorImage(forPage: 0)
        
    }
}

extension ViewController {
    func configurateScrollView() {
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        scrollView.backgroundColor = .systemGray
        scrollView.contentSize = CGSize(width: Int(UIScreen.main.bounds.width) * strings.count, height: 200)
        scrollView.isPagingEnabled = true
        
        for i in 0...strings.count-1 {
            addLabel(title: strings[i], position: CGFloat(i))
        }
    }
    
    func addLabel(title: String, position: CGFloat) {
        let label = UILabel()
        label.text = title
        label.textAlignment = .center
        
        scrollView.addSubview(label)
        let screenWidth = UIScreen.main.bounds.width
        label.frame = CGRect(x: screenWidth * position, y: 0, width: screenWidth, height: 200)
    }
    
    @objc func pageDidChange(sender: UIPageControl) {
        let ofsetX = UIScreen.main.bounds.width * CGFloat(pageControl.currentPage)
            self.scrollView.setContentOffset(CGPoint(x: ofsetX, y: 0), animated: true)
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage =  Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
    }
}
