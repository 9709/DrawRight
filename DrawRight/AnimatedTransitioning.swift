//
//  AnimatedTransitioning.swift
//  DrawRight
//
//  Created by Matthew Chan on 2019-02-02.
//  Copyright © 2019 Matthew Chan. All rights reserved.
//

import UIKit

class AnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    var phoneHeight: CGFloat?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let myToViewController = transitionContext.viewController(forKey: .to) else {
            print("toVC is nil")
            return
        }
        
        transitionContext.containerView.addSubview(myToViewController.view)

        let startingFrame = CGRect(x: 380, y: 0, width: 375, height: phoneHeight!)
        let endFrame = CGRect(x: 0, y: 0, width: 375, height: phoneHeight!)
       
        
        myToViewController.view.frame = startingFrame
        
        UIView.animate(withDuration: 1.0, animations: {
            myToViewController.view.frame = endFrame
        }) {  (true) in
            transitionContext.completeTransition(true)
        }
    }
}
