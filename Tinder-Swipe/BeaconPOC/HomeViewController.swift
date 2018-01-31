//
//  ViewController.swift
//  BeaconPOC
//
//  Created by Hos on 23/01/18.
//  Copyright © 2018 lbox. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController
{
    var pulseLayer:CAShapeLayer?
    var trackLayer:CAShapeLayer?
    
    var userImage:UIImageView?={
        let image = UIImage(named: "user")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addCircularView()
    }
    
    @IBAction func beaconFound(_ sender: UIButton)
    {
        
        let cardVC = self.storyboard?.instantiateViewController(withIdentifier: "CardViewController") as! CardViewController
        self.present(cardVC, animated: true) {
            // remove pulse
        }
    }
    
}



// Animation Code for Pulse/////////////////////////////////////////////////////////////////////////////////////////////////

extension HomeViewController
{
    func addCircularView()
    {
        setupCricularlayers()
        setupDownloadStatusLabel()
    }
    
    
    private func setupDownloadStatusLabel()
    {
        view.addSubview(userImage!)
        userImage?.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        userImage?.center = view.center
    }
    
    private func createCircleShapelayer(strokeColor:UIColor, fillColor:UIColor) ->CAShapeLayer
    {
        let layer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero,
                                        radius: 100,
                                        startAngle: 0,
                                        endAngle: 2 * CGFloat.pi,
                                        clockwise: true)
        layer.path = circularPath.cgPath
        layer.fillColor = fillColor.cgColor
        layer.strokeColor = strokeColor.cgColor
        layer.lineCap = kCALineCapRound
        layer.lineWidth = 20
        layer.position = view.center
        return layer
    }
    
    private func setupCricularlayers()
    {
        pulseLayer = createCircleShapelayer(strokeColor: .clear, fillColor: .pulsatingFillColor)
        view.layer.addSublayer(pulseLayer!)
        animatePulse()
        
        let dummylayer = createCircleShapelayer(strokeColor: .trackStrokeColor, fillColor: .backgroundColor)
            view.layer.addSublayer(dummylayer)
        
        trackLayer = createCircleShapelayer(strokeColor:.outlineStrokeColor , fillColor:.clear )
        trackLayer?.transform = CATransform3DMakeRotation(-CGFloat.pi / 2,
                                                          0,
                                                          0,
                                                          1)
        trackLayer?.strokeEnd = 0
        view.layer.addSublayer(trackLayer!)
    }
    
    private func animatePulse()
    {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = 1.5
        animation.duration = 0.8
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        pulseLayer?.add(animation, forKey: "Pulsing")
       // beginFileDownload()
    }
}





extension UIColor
{
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    static let backgroundColor = UIColor.rgb(r: 76, g: 97, b: 132)
    static let outlineStrokeColor = UIColor.rgb(r: 159, g: 170, b: 188)
    static let trackStrokeColor = UIColor.rgb(r: 159, g: 170, b: 188)
    static let pulsatingFillColor = UIColor.rgb(r: 232, g: 235, b: 239)
}

