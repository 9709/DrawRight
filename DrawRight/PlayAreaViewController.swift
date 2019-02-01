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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func swipeGestureRecognizer(_ sender: UISwipeGestureRecognizer) {
        
        UIView.animate(withDuration: 1.0,
                       animations: { () -> Void in
                        self.beginButtonContainterView.bounds = CGRect(x: 1080, y: 0, width: self.beginButtonContainterView.bounds.width, height: self.beginButtonContainterView.bounds.height)
                        },
                       completion: { (animateComplete: Bool) -> Void in
                        if animateComplete {
                            self.beginButtonContainterView.removeFromSuperview()
                        }
                        })
    }
    
}

