//
//  CardViewController.swift
//  BeaconPOC
//
//  Created by Hos on 29/01/18.
//  Copyright © 2018 lbox. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    @IBOutlet weak var detailTableView: UITableView!
    {
        didSet
        {
            detailTableView.layer.cornerRadius = 5
            detailTableView.layer.masksToBounds = true
        }
    }
    var divisor:CGFloat!
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var cardView: UIView!
    {
        didSet
        {
            cardView.layer.cornerRadius = 5
            cardView.layer.masksToBounds = true
        }
        
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        divisor = (view.frame.width / 2) / 0.61
    }
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer)
    {
        let card = sender.view!
        let  point = sender.translation(in: view)

        let xFromCenter = cardView.center.x - view.center.x
        card.transform = CGAffineTransform(rotationAngle: xFromCenter / divisor)
        if xFromCenter > 0
        {
             thumbImageView.image = #imageLiteral(resourceName: "thumbUp")
             thumbImageView.tintColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        }
        else
        {
             thumbImageView.image = #imageLiteral(resourceName: "thumbdown")
             thumbImageView.tintColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        }
        thumbImageView.alpha = abs(xFromCenter) / view.center.x
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        if sender.state == UIGestureRecognizerState.ended
        {
            if card.center.x < 75
            {
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                    card.alpha = 0
                }, completion: { (flag) in
                    if flag
                    {
                        DispatchQueue.main.async {
                            self.showFeedBackMessage()
                        }
                    }
                })
                
                return
                
            }
            else if card.center.x > (view.frame.width - 75)
            {
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.alpha = 0
                }, completion: { (flag) in
                    if flag
                    {
                        DispatchQueue.main.async {
                            self.showFeedBackMessage()
                        }
                    }
                })
                return
            }
            
            UIView.animate(withDuration: 0.2, animations: {
                card.center = self.view.center
                self.thumbImageView.alpha = 0
                card.transform = CGAffineTransform.identity
               
            })
        }
    }
    
    private func showFeedBackMessage()
    {
      let feedbackVC =  self.storyboard?.instantiateViewController(withIdentifier: "FeedbackViewController") as! FeedbackViewController
      self.present(feedbackVC, animated: true, completion: nil)
    }
}


extension CardViewController:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailCell", for: indexPath) as! UserDetailTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       return 5
    }
}

extension CardViewController:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  tableView.frame.height / 5
    }
}



