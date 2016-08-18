//
//  ViewController.swift
//  normalCalculator
//
//  Created by ivote on 2016/8/18.
//  Copyright © 2016年 ivote. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
   
    struct tempNumber {
        var first:Double?
        var last:Double?
    }
    
    var temp = tempNumber()
    var isUserTypingNumber = false
    
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var numberOperatorLabel: UILabel!
    
    @IBAction func appendDigit(sender: UIButton) {
        if self.temp.first != nil && self.temp.last != nil {
            self.temp = tempNumber()
            self.display.text = "0"
        }
        
        let digit = sender.currentTitle!
        
        if self.display.text! == "0" {
            display.text = digit
        } else {
            display.text = display.text! + digit
        }
    }
    
    @IBAction func dotBtnPressed(sender: UIButton) {
        if self.temp.first != nil && self.temp.last != nil {
            self.temp = tempNumber()
            self.display.text = "0"
            return
        }
        
        if let _ = self.display.text?.rangeOfString(".") {
            return
        }
        
        self.display.text? += "."
    }
   
    @IBAction func operatorPressed(sender: UIButton) {
        if sender.currentTitle != self.numberOperatorLabel.text {
            print(sender.currentTitle)
            print(self.numberOperatorLabel.text)
            self.temp = tempNumber()
        }else if self.temp.first != nil && self.temp.last != nil {
            self.equalBtnPressed(nil)
            return
        }
        
        self.temp.first = Double(self.display.text!)
        self.display.text = "0"
        
        self.numberOperatorLabel.text = sender.currentTitle!
    }
    
    @IBAction func equalBtnPressed(sender: UIButton?) {
        if self.temp.first == nil && self.temp.last == nil {
            return
        }
        
        
        if self.temp.last == nil {
            self.temp.last = Double(self.display.text!)
        }
        
        switch self.numberOperatorLabel.text! {
        case "+":
            self.temp.first = self.temp.first! + self.temp.last!
        case "-":
            self.temp.first = self.temp.first! - self.temp.last!
        case "*":
            self.temp.first = self.temp.first! * self.temp.last!
        case "/":
            self.temp.first = self.temp.first! / self.temp.last!
        default:
            return
        }
        
        self.display.text = String(format: "%g", self.temp.first!)
        print(self.temp)
    }
}

