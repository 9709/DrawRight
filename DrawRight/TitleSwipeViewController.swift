//
//  TitleSwipeViewController.swift
//  DrawRight
//
//  Created by Matthew Chan on 2019-02-02.
//  Copyright © 2019 Matthew Chan. All rights reserved.
//

import UIKit

class TitleSwipeViewController: UIViewController {
    
    @IBOutlet weak var beginButtonContainterView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func swipeTitleToStartGame(_ sender: UISwipeGestureRecognizer) {
        
        func slideOverTransition() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewControllerToPresent = storyboard.instantiateViewController(withIdentifier: "playAreaViewController")
            
            self.modalPresentationStyle = .custom
            self.present(viewControllerToPresent, animated: true, completion: {
//                print("animation done")
                return
            })
        }
        
        
        UIView.animate(withDuration: 1.0,
                       animations: { () -> Void in
                        self.beginButtonContainterView.bounds = CGRect(x: 1120, y: 0, width: self.beginButtonContainterView.bounds.width, height: self.beginButtonContainterView.bounds.height)
        },
                       completion: { (animateComplete: Bool) -> Void in
                        if animateComplete {
                            slideOverTransition()
                        }
        })
    }
    
}
