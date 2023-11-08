//
//  Source.swift
//  CollectionViewBootcamp
//
//  Created by Artem on 18.10.2023.
//

import Foundation

struct Source {
    static func allPhotos() -> [Photo] {
        [
            .init(id: 1, imageName: "Anna"),
            .init(id: 2, imageName: "Ariada")
            ]
    }
    static func randomPhotos(with count: Int) -> [Photo] {
        return (0..<count).map { _ in allPhotos().randomElement()! }
    }
}

struct Photo {
    let id: Int
    let imageName: String
}

struct SectionPhoto {
    let sectionName: String
    var photos: [Photo]
}
