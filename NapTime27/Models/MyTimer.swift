//
//  MyTimer.swift
//  NapTime27
//
//  Created by Timothy Rosenvall on 6/18/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import Foundation

protocol MyTimerDelegate: class {
    func timerStart()
    func timerStop()
    func timerSecondTicked()
}

class MyTimer: NSObject {
    
    var timeRemaining: TimeInterval? // How many seconds are remaining on our nap? Hopefully a lot.
    var timer: Timer? // The timer object we are hiding behind our wrapper. (MyTimer)
    var isOn: Bool = false
    weak var delegate: MyTimerDelegate?
    
    private func secondTicked() {
        guard let timeRemaining = timeRemaining else {return}
        if timeRemaining < 0 {
            self.timeRemaining = timeRemaining - 1
            print(timeRemaining)
        } else {
            timer?.invalidate()
            self.timeRemaining = nil
        }
    }
    
    func startTimer(_ time: TimeInterval) {
        if !isOn {
            isOn = !isOn
            timeRemaining = time
            self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (_) in self.secondTicked() } )
        }
    }
    
    func stopTimer() {
        if isOn {
            isOn = !isOn
            timeRemaining = nil
        }
    }
}

