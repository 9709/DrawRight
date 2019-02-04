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
    
  @IBOutlet weak var playProgressTimer: UIProgressView!
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.transitioningDelegate = self
        
        self.completeButton.isHidden = true
        self.leadingTriggerLine.isHidden = true
      
      self.playProgressTimer.progress = 0
      
    }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.startProgressTimer()
  }
    
    
    @IBAction func nextPlayerArrowButton(_ sender: UIButton) {
      let oldTrailingTriggerLineXValue = self.trailingTriggerLine.frame.origin.x
        UIView.animate(withDuration: 1.0,
                       animations: { () -> Void in
                        self.drawingPalletView.frame = CGRect(x: 0-self.view.frame.width+self.trailingTriggerLine.frame.width, y: self.drawingPalletView.frame.origin.y, width: self.drawingPalletView.frame.width, height: self.drawingPalletView.frame.height)
                        self.trailingTriggerLine.frame = CGRect(x: 0, y: self.trailingTriggerLine.frame.origin.y, width: self.trailingTriggerLine.frame.width, height: self.trailingTriggerLine.frame.height)
        },
                       completion: { (animateToPlayer2Complete: Bool) -> Void in
                        if animateToPlayer2Complete {
                          self.trailingTriggerLine.frame = CGRect(x: oldTrailingTriggerLineXValue, y: self.trailingTriggerLine.frame.minY, width: self.trailingTriggerLine.frame.width, height: self.trailingTriggerLine.frame.height)
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
  
  var currentPlayer = 0
  
  func startProgressTimer() {
    self.playProgressTimer.progress = 1
    UIView.animate(withDuration: 20.0, animations: {
      self.playProgressTimer.layoutIfNeeded()
    }, completion: { (complete: Bool) in
      if self.currentPlayer < 1 {
        self.moveToNextPlayer()
      } else {
        self.moveToResultScreen()
      }
    })
  }
  
  func moveToResultScreen() {
    self.performSegue(withIdentifier: "toResultPageSegue", sender: self)
  }
  
  func moveToNextPlayer() {
    let oldTrailingTriggerLineXValue = self.trailingTriggerLine.frame.origin.x
    self.playProgressTimer.progress = 0
    UIView.animate(withDuration: 1.0,
                   animations: { () -> Void in
                    self.drawingPalletView.frame = CGRect(x: 0-self.view.frame.width+self.trailingTriggerLine.frame.width, y: self.drawingPalletView.frame.origin.y, width: self.drawingPalletView.frame.width, height: self.drawingPalletView.frame.height)
                    self.trailingTriggerLine.frame = CGRect(x: 0, y: self.trailingTriggerLine.frame.origin.y, width: self.trailingTriggerLine.frame.width, height: self.trailingTriggerLine.frame.height)
                    self.playProgressTimer.layoutIfNeeded()
    },
                   completion: { (animateToPlayer2Complete: Bool) -> Void in
                    if animateToPlayer2Complete {
                      self.trailingTriggerLine.frame = CGRect(x: oldTrailingTriggerLineXValue, y: self.trailingTriggerLine.frame.minY, width: self.trailingTriggerLine.frame.width, height: self.trailingTriggerLine.frame.height)
                      self.nextPlayerButton.isHidden = true
                      self.completeButton.isHidden = false
                      self.trailingTriggerLine.isHidden = true
                      self.leadingTriggerLine.isHidden = false
                      self.startProgressTimer()
                      self.currentPlayer += 1
                    }
    })
  }
}

