//
//  MyTimer.swift
//  NapTime27
//
//  Created by Timothy Rosenvall on 6/18/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import Foundation

protocol MyTimerDelegate: class {
    func timerComplete()
    func timerStop()
    func timerSecondTicked()
}

class MyTimer: NSObject {
    
    var timeRemaining: TimeInterval? // How many seconds are remaining on our nap? Hopefully a lot.
    var timer: Timer? // The timer object we are hiding behind our wrapper. (MyTimer)
    weak var delegate: MyTimerDelegate?
    var isOn: Bool {
        if timeRemaining != nil {
            return true
        } else {
            return false
        }
    }
    
    private func secondTicked() {
        guard let timeRemaining = timeRemaining else {return}
        if timeRemaining > 0 {
            self.timeRemaining = timeRemaining - 1
            delegate?.timerSecondTicked()
            print(timeRemaining)
        } else {
            timer?.invalidate()
            self.timeRemaining = nil
            delegate?.timerComplete()
        }
    }
    
    func startTimer(_ time: TimeInterval) {
        if isOn == false {
            timeRemaining = time
            self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (_) in self.secondTicked() } )
        }
    }
    
    func stopTimer() {
        if isOn == true {
            timeRemaining = nil
            timer?.invalidate()
            delegate?.timerStop()
        }
    }
}

