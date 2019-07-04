//
//  ViewControllerColorExtensions.swift
//  SuperColorPicker
//
//  Created by Sonia Kucheryavaya on 03/07/2019.
//  Copyright © 2019 Sonia Kucheryavaya. All rights reserved.
//

import UIKit
import Foundation

class ViewControllerColorExtensions: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
}


extension UIColor {
    var redValue: CGFloat{ return CIColor(color: self).red }
    var greenValue: CGFloat{ return CIColor(color: self).green }
    var blueValue: CGFloat{ return CIColor(color: self).blue }
    var alphaValue: CGFloat{ return CIColor(color: self).alpha }
}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
extension UIColor {
    
    func lighter(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }
    
    func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }
    
    func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
}

extension UIColor {
    
    var complement: UIColor {
        return self.withHueOffset(offset: 0.5)
    }
    
    var splitComplement0: UIColor {
        return self.withHueOffset(offset: 150 / 360)
    }
    
    var splitComplement1: UIColor {
        return self.withHueOffset(offset: 210 / 360)
    }
    
    var triadic0: UIColor {
        return self.withHueOffset(offset: 120 / 360)
    }
    
    var triadic1: UIColor {
        return self.withHueOffset(offset: 240 / 360)
    }
    
    var tetradic0: UIColor {
        return self.withHueOffset(offset: 0.25)
    }
    
    var tetradic1: UIColor {
        return self.complement
    }
    
    var tetradic2: UIColor {
        return self.withHueOffset(offset: 0.75)
    }
    
    
    var analagous1: UIColor {
        return self.withHueOffset(offset: 1 / 12)
    }
    
    var analagous2: UIColor {
        return self.withHueOffset(offset: 2 / 12)
    }
    var analagous3: UIColor {
        return self.withHueOffset(offset: 3 / 12)
    }
    var analagous4: UIColor {
        return self.withHueOffset(offset:  4 / 12)
    }
    
    var analagous5: UIColor {
        return self.withHueOffset(offset: 5 / 12)
    }
    
    var neutral1: UIColor {
        return self.withHueOffset(offset: 1 / 24)
    }
    
    var neutral2: UIColor {
        return self.withHueOffset(offset: 2 / 24)
    }
    
    var neutral3: UIColor {
        return self.withHueOffset(offset: 3 / 24)
    }
    
    var neutral4: UIColor {
        return self.withHueOffset(offset: 4 / 24)
    }
    
    var neutral5: UIColor {
        return self.withHueOffset(offset: 5 / 24)
    }
    
    func withHueOffset(offset: CGFloat) -> UIColor {
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return UIColor(hue: fmod(h + offset, 1), saturation: s, brightness: b, alpha: a)
    }
    
    func withHueSaturation(satur: CGFloat) -> UIColor {
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return UIColor(hue: h, saturation: s - satur/100, brightness: b, alpha: a)
    }
}

extension UIColor {
    var hexString: String {
        let colorRef = cgColor.components
        let r = colorRef?[0] ?? 0
        let g = colorRef?[1] ?? 0
        let b = ((colorRef?.count ?? 0) > 2 ? colorRef?[2] : g) ?? 0
        let a = cgColor.alpha
        
        var color = String(
            format: "#%02lX%02lX%02lX",
            lroundf(Float(r * 255)),
            lroundf(Float(g * 255)),
            lroundf(Float(b * 255))
        )
        
        if a < 1 {
            color += String(format: "%02lX", lroundf(Float(a)))
        }
        
        return color
    }
}
