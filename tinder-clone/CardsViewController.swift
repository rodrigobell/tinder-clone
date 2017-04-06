//
//  CardsViewController.swift
//  tinder-clone
//
//  Created by Rodrigo Bell on 4/5/17.
//  Copyright © 2017 Rodrigo Bell. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    @IBOutlet weak var cardView: UIImageView!
    var cardInitialCenter: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardInitialCenter = cardView.center
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "show-profile", sender: nil)
    }
    
    
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: cardView)
        
        if sender.state == .began {
            // Not used
        } else if sender.state == .changed {
            cardView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
            let angle = Double(translation.x)/8
            cardView.transform = CGAffineTransform(rotationAngle: CGFloat(angle * M_PI / 180))
        } else if sender.state == .ended {
            if translation.x > 80 {
                UIView.animate(withDuration: 0.4, animations: {
                    self.cardView.center = CGPoint(x: self.cardInitialCenter.x + 400, y: self.cardInitialCenter.y)
                    self.cardView.transform = CGAffineTransform(rotationAngle: CGFloat(90 * M_PI / 180))
                })
            } else if translation.x < -80 {
                UIView.animate(withDuration: 0.4, animations: {
                    self.cardView.center = CGPoint(x: self.cardInitialCenter.x - 400, y: self.cardInitialCenter.y)
                    self.cardView.transform = CGAffineTransform(rotationAngle: CGFloat(-90 * M_PI / 180))
                })
            } else {
                cardView.center = cardInitialCenter
                cardView.transform = CGAffineTransform(rotationAngle: 0)
            }
        }
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
 

}
