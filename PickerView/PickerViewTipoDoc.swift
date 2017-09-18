//
//  PickerViewTipoDoc.swift
//  PickerView
//
//  Created by Jade Silveira on 18/09/17.
//  Copyright © 2017 Jade. All rights reserved.
//

import UIKit
import Foundation

class PickerViewTipoDoc : PickerView {
    
    override init() {
        super.init()
        
        self.loadTipoDocs()
        
        //        if let tipoDocs = self.items as? [TipoDoc] {
        //            self.items = tipoDocs.sort { $0.descricao.localizedCaseInsensitiveCompare($1.descricao) == NSComparisonResult.OrderedAscending }
        //        }
    }
    
    override func didSelectRow(row: Int, genericView: UIView) {
        if let view = genericView as? AlteracaoDadosCad1View {
            view.tipoDocsText.text = self.textForRow(row)
        }
    }
    
    override func textForRow(row: Int) -> String {
        if let tipoDoc = self.items[row] as? TipoDoc {
            return tipoDoc.descricao
        } else {
            return ""
        }
    }
    
    override func valueForRow(row: Int) -> String {
        if let tipoDoc = self.items[row] as? TipoDoc {
            return tipoDoc.nomeNoSap
        } else {
            return ""
        }
    }
    
    override func selectIndexForText (textInRow: String) -> Int {
        
        var index = 0
        
        if let tipoDocs = self.items as? [TipoDoc] {
            
            for position in 0...self.items.count - 1 {
                
                if tipoDocs[position].descricao == textInRow {
                    index = position
                    
                    break
                }
            }
        }
        return index
    }
    
    override func selectIndexForValue (valueInRow: String) -> Int {
        
        var index = 0
        
        if let tipoDocs = self.items as? [TipoDoc] {
            
            for position in 0...self.items.count - 1 {
                
                if tipoDocs[position].nomeNoSap == valueInRow {
                    index = position
                    
                    break
                }
            }
        }
        return index
    }
    
    func loadTipoDocs() {
        self.items = [
            TipoDoc(nomeNoSap: "", descricao: "Escolha"),
            TipoDoc(nomeNoSap: "1", descricao: "Passaporte"),
            TipoDoc(nomeNoSap: "2", descricao: "Carteira Profissional"),
            TipoDoc(nomeNoSap: "3", descricao: "Registro de Conselho de Classe"),
            TipoDoc(nomeNoSap: "4", descricao: "Carteira de Identidade"),
            TipoDoc(nomeNoSap: "5", descricao: "Registro de Estrangeiros"),
            TipoDoc(nomeNoSap: "6", descricao: "Carteira Nacional de Habilitação")
        ]
    }
}
