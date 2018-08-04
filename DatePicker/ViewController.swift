//
//  ViewController.swift
//  DatePicker
//
//  Created by 劉鴻祥 on 2018/7/29.
//  Copyright © 2018年 劉鴻祥. All rights reserved.
//

import UIKit
var timer: Timer?
var interval: Double = 0.0
var retireDate: Date?

class ViewController: UIViewController {

    @IBOutlet weak var retireDatePicker: UIDatePicker!
    @IBOutlet weak var nowLabel: UILabel!
    @IBOutlet weak var retireDateLabel: UILabel!
    @IBOutlet weak var remainingDayLabel: UILabel!
    
    @IBAction func retireDatePicker(_ sender: UIDatePicker) {
        
        //Get current date
        let now = Date ()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd HH:mm:ss"
        nowLabel.text = formatter.string(from:now)
       
        //Get retire date
        retireDate = sender.date
        if retireDate != nil {
            //print ("retireDate=\(retireDate!)")
            retireDateLabel.text = formatter.string(from:retireDate!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        retireDatePicker.minimumDate = Date ()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
        let now = Date ()
        let formatter = DateFormatter()
            formatter.dateFormat = "yyyy MM dd HH:mm:ss"
            self.nowLabel.text = formatter.string(from:now)
            if retireDate != nil {
               interval = retireDate!.timeIntervalSince(now)
               print ("interval=", interval)
            }
        let secondsToRetire = Int(interval)%60
        let minutesToRetire = Int(interval/60)%60
        let hoursToRetire = Int(interval/3600)%24
        let daysToRetire = Int(interval/86400)
        self.remainingDayLabel.text = "\(daysToRetire)天\(hoursToRetire)小時\(minutesToRetire)分\(secondsToRetire)秒"
            
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if timer != nil {
            timer?.invalidate()
        }
    }

}

