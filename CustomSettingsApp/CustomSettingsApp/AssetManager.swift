//
//  AssetManager.swift
//  SampleTableViewApp2
//
//  Created by Erantha Welikala on 10/27/21.
//

import Foundation
import UIKit

class AssetManager {
    public static func getIconImages(with name:String) -> UIImage? {
        var image:UIImage?
        if #available(iOS 13.0, *) {
            switch name {
            case "wifi":
                image = UIImage(systemName: "house")
            case "bluetooth":
                image = UIImage(systemName: "bluetooth")
            case "airplane_mode":
                image = UIImage(systemName: "airplane")
            default:
                return nil
            }
        } else {
            switch name {
            case "wifi":
                image = #imageLiteral(resourceName: "wifi")
            case "bluetooth":
                image = #imageLiteral(resourceName: "bluetooth")
            case "airplane_mode":
                image = #imageLiteral(resourceName: "airplane_mode")
            case "cellular":
                image = #imageLiteral(resourceName: "cellular")
            case "sounds":
                image = #imageLiteral(resourceName: "sounds")
            case "facebook":
                image = #imageLiteral(resourceName: "facebook")
            case "whatsapp":
                image = #imageLiteral(resourceName: "whatsapp")
            default:
                return nil
            }
        }
        return image
    }
}
