//
//  ViewController.swift
//  StopWatch
//
//  Created by risako takeya on 2020/09/08.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var perfect: UILabel!
    
    var count: Float = 0.0
    
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func up(){
        count = count + 0.01
        
        label.text = String(format: "%.2f", count)
    }
    
    @objc func hantei(){
        if count <= 10.20 && count >= 9.80{
            perfect.text = "PERFECT"
            perfect.textColor = UIColor.red
        }else if count <= 10.30 && count >= 9.70{
            perfect.text = "GREAT"
            perfect.textColor = UIColor.yellow
        }else if count <= 10.50 && count >= 9.50{
            perfect.text = "GOOD"
            perfect.textColor = UIColor.green
        }else{
            perfect.text = "BAD"
            perfect.textColor = UIColor.blue
        }
    }
    
    @IBAction func start(){
        if !timer.isValid{
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true
            )
        }
        
    }
    
    @IBAction func stop(){
        if timer.isValid{
            timer.invalidate()
            self.hantei()
        }
        
    }
    
    @IBAction func reset(){
        if timer.isValid{
            timer.invalidate()
            self.hantei()
        }else{
            count = 0.0
            
            label.text = String(format: "%.2f", count)
            perfect.text = ""
        }
        
    }


}

