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
    }
    
    @IBAction func napButtonTapped(_ sender: Any) {
        
    }
    
    func updateLabel() {
        
    }
    
    func updateButton() {
        
    }
    
    func startTimer() {
        
    }
    
    func stopTimer() {
        
    }
    
    func setTimer() {
        
    }
}

extension ViewController: MyTimerDelegate{
    func timerStart() {
        <#code#>
    }
    
    func timerStop() {
        <#code#>
    }
    
    func timerSecondTicked() {
        <#code#>
    }
}
