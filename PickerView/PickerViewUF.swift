//
//  PickerViewUF.swift
//  PickerView
//
//  Created by Jade Silveira on 18/09/17.
//  Copyright © 2017 Jade. All rights reserved.
//

import UIKit
import Foundation

class PickerViewUF : PickerView {
    
    override init() {
        super.init()
        
        loadUFs()
        
        //        if let ufs = self.items as? [String] {
        //            self.items = ufs.sort { $0.localizedCaseInsensitiveCompare($1) == NSComparisonResult.OrderedAscending }
        //        }
    }
    
    override func didSelectRow(row: Int, genericView: UIView) {
        if let view = genericView as? AlteracaoDadosCad1View {
            view.ufsText.text = self.textForRow(row)
        }
    }
    
    override func textForRow(row: Int) -> String {
        if let uf = self.items[row] as? String {
            return uf
        } else {
            return ""
        }
    }
    
    override func selectIndexForValue (valueInRow: String) -> Int {
        
        var index = 0
        
        let ufs = self.items
        
        for position in 0...self.items.count - 1 {
            
            if let uf = ufs[position] as? String where uf == valueInRow {
                index = position
                
                break
            }
        }
        return index
    }
    
    func loadUFs() {
        self.items = ["Escolha", "AC", "AL", "AP", "AM", "BA", "CE", "DF", "ES", "GO", "MA", "MG", "MS", "MT", "PA", "PB", "PR", "PE", "PI", "RJ", "RN", "RS", "RO", "RR", "SC", "SP", "SE", "TO"]
    }
}
