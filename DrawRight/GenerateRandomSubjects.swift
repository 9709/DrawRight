//
//  GenerateRandomSubjects.swift
//  DrawRight
//
//  Created by Matthew Chan on 2019-02-03.
//  Copyright © 2019 Matthew Chan. All rights reserved.
//

import UIKit

struct GenerateRandomSubjects {

    
    func generateSubject () -> String {
        let randomSubjects: [String] = ["Elephant", "Bus", "Guitar", "Microwave", "Car", "Skateboard", "Cup", "Running", "Rocket", "Plane", "Face", "Couch", "Pan", "Chair", "Microphone", "Foot", "Knife", "Book", "Fan", "House", "Keyboard", "Television", "Camera", "Cake", "Bulldozer", "Crane", "Shark", "Cell Phone", "Hat"]
        let subject = randomSubjects.randomElement()!
        
        return subject
    }
}
