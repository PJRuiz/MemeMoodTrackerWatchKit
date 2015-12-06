//
//  InterfaceController.swift
//  MemeMoodTracker WatchKit Extension
//
//  Created by Pedro Ruíz on 12/5/15.
//  Copyright © 2015 Pedro Ruíz. All rights reserved.
//

import WatchKit
import Foundation



class MoodContextData {
    let moodIndex: Int
    let shouldShowAdvice: Bool
    
    init(moodIndex: Int, shouldShowAdvice: Bool) {
        self.moodIndex = moodIndex
        self.shouldShowAdvice = shouldShowAdvice
    }
}

class InterfaceController: WKInterfaceController {

    @IBOutlet var moodImage: WKInterfaceImage!
    
    var currentMood: Int = 0
    var shouldShowAdvice = true
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func moodSliderChanged(value: Float) {
        currentMood = Int(value)
        updateMoodImage()
    }
    
    @IBAction func switchValueChanged(value: Bool) {
        shouldShowAdvice = value
        
    }
    
    
    @IBAction func recordMoodTapped() {
        pushControllerWithName("MoodDetailsController", context: nil)
    }
    
    func updateMoodImage() {
        if currentMood < 0 || currentMood > 4 {
            return
        }
        
        moodImage.setImageNamed("rage\(currentMood)")
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
        if segueIdentifier == "RecordMoodSegue" {
            return MoodContextData(moodIndex: currentMood,shouldShowAdvice: shouldShowAdvice)
        }
        
        return nil
    }
}
