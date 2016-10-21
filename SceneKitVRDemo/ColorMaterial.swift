//
//  ColorMaterial.swift
//  SceneKitVRDemo
//
//  Created by Hao Dong on 14/10/2016.
//  Copyright © 2016 Sujan Vaidya. All rights reserved.
//

import Foundation
import SceneKit

// returns SCNMaterial of different color
class ColorMaterial {
    
    class func redColor() -> SCNMaterial {
        let redMaterial = SCNMaterial()
        redMaterial.diffuse.contents = UIColor.red
        return redMaterial
    }
    
    class func greenColor() -> SCNMaterial {
        let greenMaterial = SCNMaterial()
        greenMaterial.diffuse.contents = UIColor.green
        return greenMaterial
    }
    
    class func blueColor() -> SCNMaterial {
        let blueMaterial = SCNMaterial()
        blueMaterial.diffuse.contents = UIColor.blue
        return blueMaterial
    }
    
    class func yellowColor() -> SCNMaterial {
        let yellowMatarial = SCNMaterial()
        yellowMatarial.diffuse.contents = UIColor.yellow
        return yellowMatarial
    }
    
    class func purpleColor() -> SCNMaterial {
        let purpleMaterial = SCNMaterial()
        purpleMaterial.diffuse.contents = UIColor.purple
        return purpleMaterial
    }
    
    class func orangeColor() -> SCNMaterial {
        let orangeMaterial = SCNMaterial()
        orangeMaterial.diffuse.contents = UIColor.orange
        return orangeMaterial
    }
    
    class func magentaColor() -> SCNMaterial {
        let magentaMaterial = SCNMaterial()
        magentaMaterial.diffuse.contents = UIColor.magenta
        return magentaMaterial
    }
    
}
