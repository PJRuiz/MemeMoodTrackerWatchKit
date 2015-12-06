//
//  MoodDetailsController.swift
//  MemeMoodTracker
//
//  Created by Pedro Ruíz on 12/5/15.
//  Copyright © 2015 Pedro Ruíz. All rights reserved.
//

import Foundation
import WatchKit


class MoodDetailsController: WKInterfaceController {
    
    @IBOutlet var moodImage: WKInterfaceImage!
    
    @IBOutlet var moodNameLabel: WKInterfaceLabel!
    
    @IBOutlet var moodDescriptionLabel: WKInterfaceLabel!
    
    @IBOutlet var moodAdviceLabel: WKInterfaceLabel!
    
    var currentMood = 0
    var shouldShowAdvice = true
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        if let moodContextData = context as? MoodContextData {
            currentMood = moodContextData.moodIndex
            shouldShowAdvice = moodContextData.shouldShowAdvice
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        if let mood = Moods(rawValue: currentMood) {
            moodImage.setImageNamed(mood.imageName())
            moodNameLabel.setText(mood.labelText())
            moodDescriptionLabel.setText(mood.descriptionText())
            if shouldShowAdvice {
                moodAdviceLabel.setText(mood.adviceText())
            } else {
                moodAdviceLabel.setHidden(true)
            }
        }
        
    }
    
    
}
