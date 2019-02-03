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
  
  @IBOutlet weak var finishedImageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    finishedImageView.image = finishedImage
  }
  
  @IBAction func startOverButton(_ sender: UIButton) {
  }
  
}
