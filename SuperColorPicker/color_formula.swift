//
//  color_formula.swift
//  SuperColorPicker
//
//  Created by Marina Roshchupkina on 03/07/2019.
//  Copyright © 2019 Sonia Kucheryavaya. All rights reserved.
//

import Foundation
import UIKit

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


func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    
    Scanner(string: cString).scanHexInt32(&rgbValue)
    return UIColor(
        r: CGFloat((rgbValue & 0xFF0000) >> 16),
        g: CGFloat((rgbValue & 0x00FF00) >> 8),
        b: CGFloat(rgbValue & 0x0000FF)
    )
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


var strColor = "#48E8C6"
var color1 = hexStringToUIColor(hex: strColor)
var mode = "analogous"
var tri2 = color1.triadic0
var strtri2 = tri2.hexString


func Color(mode: String) {
    switch mode{
    case "triadic":
        var tri2 = color1.triadic0
        var tri3 = color1.triadic1
    case "tetradic":
        var tetra2 = color1.tetradic0
        var tetra3 = color1.tetradic1
        var tetra4 = color1.tetradic2
    case "analogous":
        var an1 = color1.analagous1
        var an2 = color1.analagous2
        var an3 = color1.analagous3
        var an4 = color1.analagous4
        var an5 = color1.analagous5
    case "neutral":
        var ne1 = color1.neutral1
        var ne2 = color1.neutral2
        var ne3 = color1.neutral3
        var ne4 = color1.neutral4
        var ne5 = color1.neutral5
    case "shades":
        var sha1 = color1.darker(by: 10)
        var sha2 = color1.darker(by: 20)
        var sha3 = color1.darker(by: 30)
        var sha4 = color1.darker(by: 40)
        var sha5 = color1.darker(by: 50)
        var sha6 = color1.darker(by: 60)
        var sha7 = color1.darker(by: 70)
    case "tints":
        var t1 = color1.lighter(by: 10)
        var t2 = color1.lighter(by: 20)
        var t3 = color1.lighter(by: 30)
        var t4 = color1.lighter(by: 40)
        var t5 = color1.lighter(by: 50)
        var t6 = color1.lighter(by: 60)
        var t7 = color1.lighter(by: 70)
    case "tones":
        break
        var to1 = color1.withHueSaturation(satur: 15).darker(by: 40)
        var to2 = color1.withHueSaturation(satur: 20).darker(by: 40)
        var to3 = color1.withHueSaturation(satur: 30).darker(by: 40)
        var to4 = color1.withHueSaturation(satur: 40).darker(by: 40)
        var to5 = color1.withHueSaturation(satur: 50).darker(by: 40)
        var to6 = color1.withHueSaturation(satur: 55).darker(by: 40)
        var to7 = color1.withHueSaturation(satur: 60).darker(by: 40)
        
        
    default:
        var cmpl =  color1.complement
        
    }
    
}
