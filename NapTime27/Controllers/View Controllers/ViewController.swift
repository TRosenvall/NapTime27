//
//  ViewController.swift
//  NapTime27
//
//  Created by Timothy Rosenvall on 6/18/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var napButton: UIButton!
    
    let timer = MyTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer.delegate = self
    }
    
    @IBAction func napButtonTapped(_ sender: Any) {
        if timer.isOn {
            timer.stopTimer()
        } else {
            timer.startTimer(5)
        }
        updateButton()
        updateLabel()
    }
    
    func updateLabel() {
        if timer.isOn {
            timerLabel.text = "\(timer.timeRemaining)"
        } else {
            timerLabel.text = "20:00"
        }
    }
    
    func updateButton() {
        if timer.isOn {
            napButton.setTitle("Cancel Nap", for: .normal)
        } else {
            napButton.setTitle("Start Nap", for: .normal)
        }
    }
    
    func setTimer() {
        
    }
}

extension ViewController: MyTimerDelegate{
    func timerComplete() {
        updateButton()
        updateLabel()
        // Call the display alert Controller func
    }
    
    func timerStop() {
        updateButton()
        updateLabel()
    }
    
    func timerSecondTicked() {
        updateLabel()
    }
}
