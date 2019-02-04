//
//  TitleSwipeViewController.swift
//  DrawRight
//
//  Created by Matthew Chan on 2019-02-02.
//  Copyright © 2019 Matthew Chan. All rights reserved.
//

import UIKit

class TitleSwipeViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var beginButtonContainterView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      self.transitioningDelegate = self
        
    }
    
    
    @IBAction func swipeTitleToStartGame(_ sender: UISwipeGestureRecognizer) {
        
        UIView.animate(withDuration: 1.0,
                       animations: { () -> Void in
                        self.beginButtonContainterView.bounds = CGRect(x: 1120, y: 0, width: self.beginButtonContainterView.bounds.width, height: self.beginButtonContainterView.bounds.height)
        },
                       completion: { (animateComplete: Bool) -> Void in
                        if animateComplete {
                            self.performSegue(withIdentifier: "toPlayAreaFromTitleSegue", sender: self)
                        }
        })
    }
  
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    
    let animatedTransitioning = AnimatedTransitioning(phoneHeight: self.view.frame.height, phoneWidth: self.view.frame.width)
    
    return animatedTransitioning
  }
    
}
