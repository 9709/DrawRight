//
//  PlayAreaViewController.swift
//  DrawRight
//
//  Created by Matthew Chan on 2019-01-31.
//  Copyright © 2019 Matthew Chan. All rights reserved.
//

import UIKit



class PlayAreaViewController: UIViewController, UIViewControllerTransitioningDelegate  {
    @IBOutlet weak var drawingPalletView: DrawingCanvasView!
    
    @IBOutlet weak var nextPlayerButton: UIButton!
    
    @IBOutlet weak var completeButton: UIButton!
    
    @IBOutlet weak var trailingTriggerLine: UIView!
    
    @IBOutlet weak var leadingTriggerLine: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.transitioningDelegate = self
        
        self.completeButton.isHidden = true
        self.leadingTriggerLine.isHidden = true
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
                            self.trailingTriggerLine.isHidden = true
                            self.leadingTriggerLine.isHidden = false
                        }
        })
    }
    
    // Complete button ================================
    @IBAction func completeButton(_ sender: UIButton) {
    }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toResultPageSegue" {
      if let destinationViewController = segue.destination as? DrawingResultViewController {
        destinationViewController.finishedImage = self.drawingPalletView.drawings()
      }
    }
  }
    

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let animatedTransitioning = AnimatedTransitioning(phoneHeight: self.view.frame.height, phoneWidth: self.view.frame.width)
                
        return animatedTransitioning
    }
}

