//
//  ViewController.swift
//  AlertControllerBootcamp
//
//  Created by Artem on 15.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var button = UIButton()
    var game = Game()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        button.center = view.center
        button.backgroundColor = .red
        button.setTitle("Alert", for: .normal)
        button.addTarget(self, action: #selector(startGame), for: .touchUpInside)
    }
    
    @objc func startGame() {
        showAlert()
    }
}

extension ViewController {
    func showAlert() {
        let alertController = UIAlertController(title: "Awesome Game", message: "Guess number in range 1...5!", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.delegate = self
        }
        let okAction = UIAlertAction(title: "Ok", style: .default) {
            _ in
           // print("Ok action")
            print(self.game.isRight(answer: self.game.answer))
        }
        alertController.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
      //  let destroyAction = UIAlertAction(title: "destroy", style: .destructive, handler: nil)
       // alertController.addAction(destroyAction)
        
        alertController.preferredAction = okAction

        present(alertController, animated: true) {
            self.game.generate()
            print("alert controller is presented!")
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text, let number = Int(text) {
            game.answer = number
        }
    }
}


class Game {
    var secret: Int
    var answer: Int
    
    init() {
        secret = 0
        answer = 0
    }
    
    func generate() {
        secret = Int.random(in: 1...5)
    }
    
    func isRight(answer: Int) -> Bool {
        secret == answer
    }
}
