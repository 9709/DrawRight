//
//  DrawingResultViewController.swift
//  DrawRight
//
//  Created by Matthew Chan on 2019-01-31.
//  Copyright © 2019 Matthew Chan. All rights reserved.
//

import UIKit

class DrawingResultViewController: UIViewController, UIViewControllerTransitioningDelegate {
  
    var finishedImage: UIImage?
    var subjectDrawn: String?
    
  
    @IBOutlet weak var finishedImageView: UIImageView!
    @IBOutlet weak var subjectLabel: UILabel!
    
    
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.transitioningDelegate = self
    
    finishedImageView.image = finishedImage
    subjectLabel.text = subjectDrawn
  }
  
  @IBAction func startOverButton(_ sender: UIButton) {
  }
  
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    
    let animatedTransitioning = AnimatedTransitioning(phoneHeight: self.view.frame.height, phoneWidth: self.view.frame.width)
    
    return animatedTransitioning
  }
}
