//
//  Cadastro.swift
//  PickerView
//
//  Created by Jade Silveira on 18/09/17.
//  Copyright © 2017 Jade. All rights reserved.
//

import Foundation

class Cadastro {
    
    var telefone : String
    var celular : String
    var email : String
    var filiacao1 : String
    var filiacao2 : String
    var dataNasc : String
    var tipoDoc : String
    var numDoc : String
    var orgaoEmissor : String
    var uf : String
    var pais : String
    var cpfCnpj : String
    var foto : String
    
    init(abreviacao: String, nomeCompleto: String) {
        self.telefone = ""
        self.celular = ""
        self.email = ""
        self.filiacao1 = ""
        self.filiacao2 = ""
        self.dataNasc = ""
        self.tipoDoc = ""
        self.numDoc = ""
        self.orgaoEmissor = ""
        self.uf = ""
        self.pais = ""
        self.cpfCnpj = ""
        self.foto = ""
    }
    
    func convertTelParaTela (telefoneSAP: String) -> String {
        
        if telefoneSAP.isEmpty {
            return telefoneSAP
        }
        let ddd = telefoneSAP.substringToIndex(telefoneSAP.startIndex.advancedBy(2))
        
        var separacaoNumeros = 0
        
        if telefoneSAP.characters.count == 10 {
            
            separacaoNumeros = 5
            
        } else if telefoneSAP.characters.count == 11 {
            
            separacaoNumeros = 6
            
        } else {
            return telefoneSAP
        }
        
        let tel4nums = telefoneSAP.substringWithRange(telefoneSAP.startIndex.advancedBy(2) ... telefoneSAP.startIndex.advancedBy(separacaoNumeros))
        
        let tel8nums = telefoneSAP.substringWithRange(telefoneSAP.startIndex.advancedBy(separacaoNumeros + 1) ... telefoneSAP.endIndex.advancedBy(-1))
        
        return "(" + ddd + ") " + tel4nums + "-" + tel8nums
    }
    
    func convertCPFParaTela (cpfSAP: String) -> String {
        
        if cpfSAP.isEmpty{
            return cpfSAP
        }
        if cpfSAP.characters.count <= 11 {
            let diferenca = 11 - cpfSAP.characters.count
            
            var cpfCompleto = ""
            
            var array = Array(count: diferenca, repeatedValue: "0")
            array.append(cpfSAP)
            
            for objeto in array {
                cpfCompleto += objeto
            }
            
            let primeiros3nums = cpfCompleto.substringToIndex(cpfCompleto.startIndex.advancedBy(3))
            
            let segundos3nums = cpfSAP.substringWithRange(cpfCompleto.startIndex.advancedBy(3) ... cpfCompleto.startIndex.advancedBy(5))
            
            let terceiros3nums = cpfCompleto.substringWithRange(cpfCompleto.startIndex.advancedBy(6) ... cpfCompleto.startIndex.advancedBy(8))
            
            let ultimos2nums = cpfCompleto.substringWithRange(cpfCompleto.startIndex.advancedBy(9) ... cpfCompleto.endIndex.advancedBy(-1))
            
            return primeiros3nums + "." + segundos3nums + "." + terceiros3nums + "-" + ultimos2nums
        } else {
            return cpfSAP
        }
    }
    
    func convertCPFParaSAP (cpfTela: String) -> String {
        
        if cpfTela.isEmpty{
            return cpfTela
        }
        return cpfTela.stringByReplacingOccurrencesOfString("\\-|\\.", withString: "", options: .RegularExpressionSearch , range: nil)
        
    }
    
    func convertCNPJParaTela (cnpjSAP: String) -> String {
        
        if cnpjSAP.isEmpty{
            return cnpjSAP
        }
        if cnpjSAP.characters.count <= 14 {
            let diferenca = 14 - cnpjSAP.characters.count
            
            var cnpjCompleto = ""
            
            var array = Array(count: diferenca, repeatedValue: "0")
            array.append(cnpjSAP)
            
            for objeto in array {
                cnpjCompleto += objeto
            }
            
            let primeiros2nums = cnpjCompleto.substringToIndex(cnpjCompleto.startIndex.advancedBy(2))
            
            let segundos3nums = cnpjCompleto.substringWithRange(cnpjCompleto.startIndex.advancedBy(2) ... cnpjCompleto.startIndex.advancedBy(4))
            
            let terceiros3nums = cnpjCompleto.substringWithRange(cnpjCompleto.startIndex.advancedBy(5) ... cnpjCompleto.startIndex.advancedBy(7))
            
            let quartos4nums = cnpjCompleto.substringWithRange(cnpjCompleto.startIndex.advancedBy(8) ... cnpjCompleto.startIndex.advancedBy(11))
            
            let ultimos2nums = cnpjCompleto.substringWithRange(cnpjCompleto.startIndex.advancedBy(12) ... cnpjCompleto.endIndex.advancedBy(-1))
            
            return primeiros2nums + "." + segundos3nums + "." + terceiros3nums + "/" + quartos4nums + "-" + ultimos2nums
        } else {
            return cnpjSAP
        }
    }
    
    func convertCNPJParaSAP (cnpjTela: String) -> String {
        
        if cnpjTela.isEmpty{
            return cnpjTela
        }
        return cnpjTela.stringByReplacingOccurrencesOfString("\\-|\\.|\\/", withString: "", options: .RegularExpressionSearch , range: nil)
    }
    
    func formatDateNumber (data : Int) -> String {
        
        if String(data).isEmpty{
            return String(data)
        }
        return (data.description.characters.count == 1 ? "0" + data.description : data.description)
    }
    
    func dateFormatSAP(datePicker: UIDatePicker) -> String {
        
        let unitFlags: NSCalendarUnit = [.Hour, .Day, .Month, .Year]
        
        let dataComponents = datePicker.calendar.components(unitFlags, fromDate:datePicker.date)
        
        let dia = formatDateNumber(dataComponents.day)
        
        let mes = formatDateNumber(dataComponents.month)
        
        let ano = dataComponents.year
        
        let slash = "/"
        
        return dia + slash + mes + slash + ano.description
    }
    
    func dateFormatTela(date: String) -> String {
        
        if date.isEmpty{
            return date
        }
        if date.characters.count <= 10 {
            let ano = date.substringToIndex(date.startIndex.advancedBy(4))
            
            let mes = date.substringWithRange(date.startIndex.advancedBy(4) ... date.startIndex.advancedBy(5))
            
            let dia = date.substringWithRange(date.startIndex.advancedBy(6) ... date.endIndex.advancedBy(-1))
            
            let dataCompleta = dia + "/" + mes + "/" + ano
            
            return dataCompleta
        } else {
            return date
        }
    }
}
