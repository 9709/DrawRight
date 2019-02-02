//
//  PlayAreaViewController.swift
//  DrawRight
//
//  Created by Matthew Chan on 2019-01-31.
//  Copyright © 2019 Matthew Chan. All rights reserved.
//

import UIKit

class PlayAreaViewController: UIViewController {
    @IBOutlet weak var beginButtonContainterView: UIView!
    
    @IBOutlet weak var drawingPalletView: UIView!
    
    @IBOutlet weak var nextPlayerButton: UIButton!
    
    @IBOutlet weak var completeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nextPlayerButton.isHidden = true
        self.completeButton.isHidden = true

    }
    @IBAction func swipeGestureRecognizer(_ sender: UISwipeGestureRecognizer) {
        
        UIView.animate(withDuration: 1.0,
                       animations: { () -> Void in
                        self.beginButtonContainterView.bounds = CGRect(x: 1080, y: 0, width: self.beginButtonContainterView.bounds.width, height: self.beginButtonContainterView.bounds.height)
                        },
                       completion: { (animateComplete: Bool) -> Void in
                        if animateComplete {
                            self.nextPlayerButton.isHidden = false
                            self.beginButtonContainterView.removeFromSuperview()
                        }
                        })
    }
    
    @IBAction func nextPlayerArrowButton(_ sender: UIButton) {
        UIView.animate(withDuration: 1.0,
                       animations: { () -> Void in
                        self.drawingPalletView.frame = CGRect(x: -331, y: 50, width: self.drawingPalletView.frame.width, height: self.drawingPalletView.frame.height)
                        },
                       completion: { (animateToPlayer2Complete: Bool) -> Void in
                        if animateToPlayer2Complete {
                            self.nextPlayerButton.isHidden = true
                            self.completeButton.isHidden = false
                        }
        })
    }
    
    
    
}

