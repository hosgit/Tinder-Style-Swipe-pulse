//
//  BaseViewController.swift
//  BeaconPOC
//
//  Created by Hos on 29/01/18.
//  Copyright © 2018 lbox. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController
{

    let feedBackView:UIView? =
    {
       let topView = UIView()
       topView.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        return topView
    }()
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }
    
    private func addFeedBackBar()
    {
        
    }
    
    private func createStandardLabel(text: String, textColor: UIColor, fontStyle: UIFontTextStyle, textAlignment: NSTextAlignment?, sizeToFit: Bool, adjustToFit: Bool) -> UILabel {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = adjustToFit
        label.text = text
        label.font = UIFont.preferredFont(forTextStyle: fontStyle)
        label.textAlignment = textAlignment ?? .left
        label.textColor = textColor
        if sizeToFit {
            label.sizeToFit()
        }
        return label
    }

}
