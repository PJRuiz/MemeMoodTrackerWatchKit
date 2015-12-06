//
//  Moods.swift
//  MemeMoodTracker
//
//  Created by Pedro Ruíz on 12/6/15.
//  Copyright © 2015 Pedro Ruíz. All rights reserved.
//

import Foundation
import UIKit
import WatchKit

enum Moods:Int {
    case Ok = 0
    case NotBad = 1
    case Hmmm = 2
    case Anger = 3
    case Rage = 4
    
    func imageName() -> String {
        switch self {
            default:
                return "rage\(rawValue)"
        }
    }
    
    func labelText() -> String {
        switch self {
            case .Ok:
                return "Ok"
            case .NotBad:
                return "Not Bad"
            case .Hmmm:
                return "Hmmm"
            case .Anger:
                return "Anger"
            case .Rage:
                return "Rage"
        }
    }
    
    func descriptionText() -> String {
        let baseDescription = "You are feeling SO "
        let endDescription =  ", eh?"
        switch self {
        default:
            return baseDescription + labelText() + endDescription
        }
    }
    
    func adviceText() -> String {
        switch self {
        case .Ok:
            return "Ok"
        case .NotBad:
            return "Not Bad"
        case .Hmmm:
            return "Hmmm"
        case .Anger:
            return "Anger"
        case .Rage:
            return "Gooooooooosfraba"
        }
    }

}