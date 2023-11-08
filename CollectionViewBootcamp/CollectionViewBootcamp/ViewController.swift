//
//  ViewController.swift
//  CollectionViewBootcamp
//
//  Created by Artem on 17.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    let source: [Photo] = Source.randomPhotos(with: 15)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }

    func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        collectionView.dataSource = self
        
    }
    
    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionView()
        
        return layout
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }

    
    
}
