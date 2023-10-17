//
//  Source.swift
//  TableBootcamp
//
//  Created by Artem on 16.10.2023.
//

import Foundation
import UIKit

struct Contact {
    let name: String
    let image: UIImage
    let description: String
    let gender: Gender
}

enum Gender {
    case male
    case female
}

struct ImageName {
    static let person = "person"
    static let fillPerson = "person.fill"
}

struct Description {
    static let descriptionW = "Pretty woman"
    static let descriptionM = "Pretty young man"
}

struct Source {
    static func makeRandomContacts() -> [Contact] {
        let count = Int.random(in: 5...15)
        let contacts = makeContacts()
        var result: [Contact] = []
        
        (0...count).forEach { _ in
            result.append(contacts.randomElement()!)
        }
        return result
    }
    
    static func makeContacts() -> [Contact] {
        [.init(name: "Alice", image: .init(systemName: ImageName.person)!, description: Description.descriptionW, gender: .female),
         .init(name: "Bob", image: .init(systemName: ImageName.fillPerson)!, description: Description.descriptionM, gender: .male),
         .init(name: "John", image: .init(systemName: ImageName.fillPerson)!, description: Description.descriptionM, gender: .male),
         .init(name: "Angela", image: .init(systemName: ImageName.person)!, description: Description.descriptionW, gender: .female),
         .init(name: "Mike", image: .init(systemName: ImageName.fillPerson)!, description: Description.descriptionM, gender: .male),
         .init(name: "June", image: .init(systemName: ImageName.person)!, description: Description.descriptionW, gender: .female),
         .init(name: "Dylan", image: .init(systemName: ImageName.fillPerson)!, description: Description.descriptionM, gender: .male),
         .init(name: "Christine", image: .init(systemName: ImageName.person)!, description: Description.descriptionW, gender: .female),
         .init(name: "Alba", image: .init(systemName: ImageName.person)!, description: Description.descriptionW, gender: .female),
          .init(name: "Bobby", image: .init(systemName: ImageName.fillPerson)!, description: Description.descriptionM, gender: .male),
          .init(name: "Elvis", image: .init(systemName: ImageName.fillPerson)!, description: Description.descriptionM, gender: .male),
          .init(name: "Taylor", image: .init(systemName: ImageName.person)!, description: Description.descriptionW, gender: .female),
          .init(name: "Mike", image: .init(systemName: ImageName.fillPerson)!, description: Description.descriptionM, gender: .male),
          .init(name: "Eva", image: .init(systemName: ImageName.person)!, description: Description.descriptionW, gender: .female),
          .init(name: "Jim", image: .init(systemName: ImageName.fillPerson)!, description: Description.descriptionM, gender: .male),
          .init(name: "Ariana", image: .init(systemName: ImageName.person)!, description: Description.descriptionW, gender: .female)]
    }
    
    static func makeContactsWithGroup() -> [[Contact]] {
        let male = makeContacts().filter { $0.gender == .male }
        let female = makeContacts().filter { $0.gender == .female }
        return [male, female]
    }
}
