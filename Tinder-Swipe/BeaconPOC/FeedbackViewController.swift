//
//  FeedbackViewController.swift
//  BeaconPOC
//
//  Created by Hos on 29/01/18.
//  Copyright © 2018 lbox. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {
    
    var timer:Timer?
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        killMeIn(time: 2)
    }
    
    private func killMeIn(time ohNo:Double)
    {
        var counter:Double = 0.0
        
     timer = Timer.scheduledTimer(withTimeInterval: ohNo,
                             repeats: true) { (timer) in
                                counter = counter + 1
                                if counter == ohNo
                                {
                                    self.timer!.invalidate()
                                    self.dissmissMe()
                                }
        }
    }
    
    private func dissmissMe()
    {
        DispatchQueue.main.async
            {
                self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
            }
    }
    
}
