//
//  Source.swift
//  CollectionBootcamp
//
//  Created by Artem on 08.11.2023.
//

import Foundation

struct Source {
    static func allPeople() -> [String] {
        [
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9"
        ]
    }
    
    static func makePhoto (name: String) -> Photo {
        .init(id: UUID().uuidString, imageName: name)
    }

//    static func allPhotos() -> [Photo] {
//        [
//
//            .init(id: 1, imageName: "1"),
//            .init(id: 2, imageName: "2"),
//            .init(id: 3, imageName: "3"),
//            .init(id: 4, imageName: "4"),
//            .init(id: 5, imageName: "5"),
//            .init(id: 6, imageName: "6"),
//            .init(id: 7, imageName: "7"),
//            .init(id: 8, imageName: "8"),
//            .init(id: 9, imageName: "9")
//            ]
//    }
    static func randomPhotos(with count: Int) -> [Photo] {
       // return (0..<count).map { _ in allPhotos().randomElement()! }
        return (0..<count).map{ _ in
            let name = allPeople().randomElement()!
            return makePhoto(name: name)
        }
    }
}

class Photo: NSObject, NSItemProviderWriting {
    static var writableTypeIdentifiersForItemProvider: [String] {
        ["Photo"]
    }
    
    func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping @Sendable (Data?, Error?) -> Void) -> Progress? {
        nil
    }
    
    let id: String
    let imageName: String
    
    init(id: String, imageName: String) {
        self.id = id
        self.imageName = imageName
    }
}

struct SectionPhoto {
    let sectionName: String
    var photos: [Photo]
}
