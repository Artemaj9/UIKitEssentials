//
//  ViewController.swift
//  ProgressViewBootcamp
//
//  Created by Artem on 16.10.2023.
//

import UIKit

class ViewController: UIViewController {
    let progressView = UIProgressView(frame: CGRect(x: 0, y: 0, width: 300, height: 10))
    let progress = Progress(totalUnitCount: 20)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(progressView)
        progressView.center = view.center
        progressView.progress = 0.1
        progressView.progressTintColor = .red
        progressView.trackTintColor = .green
        
        progressView.observedProgress = progress
        
        progress.cancellationHandler = {
            print("Progress was stopped")
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
      //  sleep(2)
        // progressView.progress = 1
        //UIView.animate(withDuration: 10) {        self.progressView.setProgress(1, animated: true)
        var count: Int64 = 0
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            if self.progress.isCancelled {
                timer.invalidate()
            }
            
            if self.progress.fractionCompleted == 1 {
                self.progress.cancel()
            }
            
            self.progress.completedUnitCount = count
            count += 1
        }
    }


}

