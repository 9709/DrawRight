//
//  DrawingResultViewController.swift
//  DrawRight
//
//  Created by Matthew Chan on 2019-01-31.
//  Copyright © 2019 Matthew Chan. All rights reserved.
//

import UIKit

class DrawingResultViewController: UIViewController {
  
    var finishedImage: UIImage?
    var subjectDrawn: String?
    
  
    @IBOutlet weak var finishedImageView: UIImageView!
    @IBOutlet weak var subjectLabel: UILabel!
    
    
  
  override func viewDidLoad() {
    super.viewDidLoad()
    finishedImageView.image = finishedImage
    subjectLabel.text = subjectDrawn
  }
  
  @IBAction func startOverButton(_ sender: UIButton) {
  }
  
}
