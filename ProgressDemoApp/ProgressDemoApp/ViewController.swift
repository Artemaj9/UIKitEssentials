//
//  ViewController.swift
//  ProgressDemoApp
//
//  Created by Artem on 16.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let topLabel = UILabel()
    var imageView = UIImageView()
    let button = UIButton()
    let progressView = UIProgressView(progressViewStyle: .bar)
    let progress = Progress(totalUnitCount: 11)
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(topLabel)
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.text = "Welcome!"
        topLabel.textAlignment = .center
        topLabel.font = UIFont.systemFont(ofSize: 20)
        topLabel.numberOfLines = 0
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "fihure.run")
        
        view.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressTintColor = .red
        progressView.observedProgress = progress
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("What to do?", for: .normal)
        button.setTitleColor(.black, for: UIControl.State.normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
       // button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        
        progress.cancellationHandler = {
            DispatchQueue.main.async {
                self.updateWithAnimation {
                    self.topLabel.alpha = 0
                    self.imageView.alpha = 0
                } completion: {
                    self.topLabel.alpha = 1
                    self.imageView.alpha = 1
                    self.topLabel.text = Source.getTask()
                    self.imageView.image = UIImage(systemName: "house.fill")
                }

            }
        }
        
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            imageView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            
            progressView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            button.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 16),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @objc func buttonAction(sender: UIButton) {
        DispatchQueue.main.async {
            self.updateWithAnimation {
                self.topLabel.alpha = 0
                self.imageView.alpha = 0
            } completion: {
                self.topLabel.alpha = 1
                self.imageView.alpha = 1
                self.topLabel.text = "Thinking..."
                self.imageView.image = UIImage(systemName: "lightbulb.fill")
            }
        }
            var count: Int64 = 0
            timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) {
                timer in
                if self.progress.fractionCompleted == 1 {
                    self.progress.cancel()
                    timer.invalidate()
                } else {
                    self.progress.totalUnitCount = count
                    count += 1
                }
            }

        }
    
    func updateWithAnimation(task: @escaping () -> Void, completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.25, animations: task) { _ in
            UIView.animate(withDuration: 0.25, animations: completion)
            
        }
    }
    
}

