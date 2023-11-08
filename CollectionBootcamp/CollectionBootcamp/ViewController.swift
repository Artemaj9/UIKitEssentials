//
//  ViewController.swift
//  CollectionBootcamp
//
//  Created by Artem on 08.11.2023.
//

import UIKit

class ViewController: UIViewController {

    var collectionView: UICollectionView!
    var layout: UICollectionViewFlowLayout!
    var isToggle = false
    
    let button = UIButton()
    
    let source: [Photo] = Source.randomPhotos(with: 150)
    
    override func viewDidLoad() {
        setupButton()
        setupCollectionView()
       
        super.viewDidLoad()
       // view.backgroundColor = .lightGray
    }
    
    func setupCollectionView() {
        layout = setupFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
       // collectionView.backgroundColor = .blue.withAlphaComponent(0.1)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24)
        ])
        collectionView.dataSource = self
        
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "\(PhotoCell.self)")
    }
    
    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = .init(width: 105, height: 105)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = .init(top: 30, left: 0, bottom: 30, right: 0)
       // layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        return layout
    }
    
    func setupButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
          //  button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
           // button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 34),
            button.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        button.setTitle("Change Layout!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 10
    }
    
    @objc func buttonAction() {
        layout.scrollDirection = isToggle ? .vertical : .horizontal
        
        UIView.animate(withDuration: 2, delay: 0,options: .curveEaseIn)
        {
            self.button.backgroundColor = self.isToggle ? .lightGray : .systemGreen  
        }
                       
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
        isToggle.toggle()
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(PhotoCell.self)", for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        
        cell.imageView.image = UIImage(named: source[indexPath.item].imageName)
        return cell
    }
    
    
}

