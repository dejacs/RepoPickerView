//
//  PickerViewController.swift
//  PickerView
//
//  Created by Jade Silveira on 18/09/17.
//  Copyright © 2017 Jade. All rights reserved.
//

import UIKit
import Foundation

class PickerViewController : UIView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var genericView : UIView = UIView()
    
    var pickerViews: [PickerView] = []
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerViews[pickerView.tag].items.count
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.pickerViews[pickerView.tag].didSelectRow(row, genericView: genericView)
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let pickerViewLabel : UILabel = UILabel()
        
        pickerViewLabel.text = self.pickerViews[pickerView.tag].textForRow(row)
        
        pickerViewLabel.textAlignment = NSTextAlignment.Center
        
        pickerViewLabel.adjustsFontSizeToFitWidth = true
        
        return pickerViewLabel
    }
}

class PickerView: NSObject {
    
    var items: [AnyObject] = []
    
    override init() { }
    
    func didSelectRow(row: Int, genericView: UIView) { }
    
    func textForRow(row: Int) -> String { return "" }
    
    func valueForRow(row: Int) -> String { return "" }
    
    func selectIndexForValue(valueInRow: String) -> Int { return 0 }
    
    func selectIndexForText (textInRow: String) -> Int { return 0 }
}
