import UIKit

var greeting = "Hello, playground"

// Протокол для кофе боссу
protocol BossDelegate {
    func cofee()
}

class Boss {
    
    // Делаегат босса (опциональный, его может не быть)
    var delegate: BossDelegate?
    func wantCofee() {
        delegate?.cofee()
    }
}

class Helper: BossDelegate {
    func  cofee () {
        print("bring cofee")
    }
}

let boss = Boss()
let helper = Helper()

boss.delegate = helper

boss.wantCofee()
