//
//  ViewController.swift
//  SuperColorPicker
//
//  Created by Sonia Kucheryavaya on 02/07/2019.
//  Copyright © 2019 Sonia Kucheryavaya. All rights reserved.
//

import UIKit
import Foundation
import ChromaColorPicker

class ViewController: UIViewController {
   

   //labels with colors
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
   
    //labels with text
    @IBOutlet weak var textLabel1: UILabel!
    @IBOutlet weak var textLabel2: UILabel!
    @IBOutlet weak var textLabel3: UILabel!
    @IBOutlet weak var textLabel4: UILabel!
    @IBOutlet weak var textLabel5: UILabel!
    @IBOutlet weak var textLabel6: UILabel!
    
    //scrolling picker of color types
    @IBOutlet weak var picker: UIPickerView!
    
    var pickerData: [String] = ["ANALOGOUS","COMPLEMENTARY","TRIADIC", "TETRADIC", "NEUTRAL","SHADES","TINTS","TONES"]
    var colorpicker: ChromaColorPicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.dataSource = self
        self.picker.delegate = self
        
        /*
        label1.backgroundColor = UIColor.green
        label2.backgroundColor = UIColor.green
        label3.backgroundColor = UIColor.green
        */
        
        //colorPicker собственной персоны
        let neatColorPicker = ChromaColorPicker(frame: CGRect(x: 50, y: 125, width: 320, height: 320))
        neatColorPicker.delegate = self as? ChromaColorPickerDelegate //ChromaColorPickerDelegate
        neatColorPicker.padding = -15
        neatColorPicker.stroke = 20
        neatColorPicker.hexLabel.textColor = UIColor.black
      
        view.addSubview(neatColorPicker)
        colorpicker = neatColorPicker
        //конец colorPicker
        
    }
    
   /*
    @IBAction func press(_ sender: Any) {
        print(colorpicker?.hexLabel.text)
    }
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  

   
}




extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
}

extension ViewController : UIPickerViewDelegate {
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var strColor = colorpicker?.hexLabel.text
        var color1 = hexStringToUIColor(hex: strColor!)
        label1.backgroundColor = color1
         textLabel1.text = colorpicker?.hexLabel.text
        switch picker.selectedRow(inComponent: 0) {
     //analogous
        case 0:
            label2.backgroundColor = color1.analagous1
            
            textLabel2.text = label2.backgroundColor?.hexString
            
    //triadic
        case 2:
            label2.backgroundColor = color1.triadic0
            label3.backgroundColor = color1.triadic1
            
            textLabel2.text = label2.backgroundColor?.hexString
            textLabel3.text = label3.backgroundColor?.hexString
           
            
    //tetradic
        case 3:
            label2.backgroundColor = color1.tetradic0
            label3.backgroundColor = color1.tetradic1
            label4.backgroundColor = color1.tetradic2
           
            
            textLabel2.text = label2.backgroundColor?.hexString
            textLabel3.text = label3.backgroundColor?.hexString
          textLabel4.text = label4.backgroundColor?.hexString
        
        
    //neutral
        case 4:
            label2.backgroundColor = color1.neutral1
            label3.backgroundColor = color1.neutral2
            label4.backgroundColor = color1.neutral3
            label5.backgroundColor = color1.neutral4
            label6.backgroundColor = color1.neutral5
            
            textLabel2.text = label2.backgroundColor?.hexString
            textLabel3.text = label3.backgroundColor?.hexString
            textLabel4.text = label4.backgroundColor?.hexString
            textLabel5.text = label5.backgroundColor?.hexString
            textLabel6.text = label6.backgroundColor?.hexString
            
     //shades
        case 5:
            label2.backgroundColor = color1.darker(by: 10)
            label3.backgroundColor = color1.darker(by: 20)
            label4.backgroundColor = color1.darker(by: 30)
            label5.backgroundColor = color1.darker(by: 40)
            label6.backgroundColor = color1.darker(by: 50)
            
           
            // label7.backgroundColor = color1.darker(by: 60)
        //label8.backgroundColor = color1.darker(by: 70)
            
            
            textLabel2.text = label2.backgroundColor?.hexString
            textLabel3.text = label3.backgroundColor?.hexString
            textLabel4.text = label4.backgroundColor?.hexString
            textLabel5.text = label5.backgroundColor?.hexString
            textLabel6.text = label6.backgroundColor?.hexString
            
    //tints
        case 6:
            label2.backgroundColor = color1.lighter(by: 10)
            label3.backgroundColor = color1.lighter(by: 20)
            label4.backgroundColor = color1.lighter(by: 30)
            label5.backgroundColor = color1.lighter(by: 40)
            label6.backgroundColor = color1.lighter(by: 50)
            //label7.backgroundColor = color1.lighter(by: 60)
        //label8.backgroundColor = color1.lighter(by: 70)
            
            textLabel2.text = label2.backgroundColor?.hexString
            textLabel3.text = label3.backgroundColor?.hexString
            textLabel4.text = label4.backgroundColor?.hexString
            textLabel5.text = label5.backgroundColor?.hexString
            textLabel6.text = label6.backgroundColor?.hexString
            
     //tones
        case 7:
            label2.backgroundColor = color1.withHueSaturation(satur: 15).darker(by: 40)
            label3.backgroundColor = color1.withHueSaturation(satur: 20).darker(by: 40)
            label4.backgroundColor = color1.withHueSaturation(satur: 30).darker(by: 40)
            label5.backgroundColor = color1.withHueSaturation(satur: 40).darker(by: 40)
            label6.backgroundColor = color1.withHueSaturation(satur: 50).darker(by: 40)
            //label7.backgroundColor = color1.withHueSaturation(satur: 55).darker(by: 40)
            //label8.backgroundColor = color1.withHueSaturation(satur: 60).darker(by: 40)
            
            textLabel2.text = label2.backgroundColor?.hexString
            textLabel3.text = label3.backgroundColor?.hexString
            textLabel4.text = label4.backgroundColor?.hexString
            textLabel5.text = label5.backgroundColor?.hexString
            textLabel6.text = label6.backgroundColor?.hexString
            
   //complementary // case 2
        case 8:
            label2.backgroundColor =  color1.complement
            
             textLabel2.text = label2.backgroundColor?.hexString
            
        default:
            label2.backgroundColor = UIColor.white
            label3.backgroundColor = UIColor.white
            label4.backgroundColor = UIColor.white
            label5.backgroundColor = UIColor.white
            label6.backgroundColor = UIColor.white
            
            textLabel2.text = ""
            textLabel3.text = ""
            textLabel4.text = ""
            textLabel5.text = ""
            textLabel6.text = ""
            
        }
        
        
    }
}

    


