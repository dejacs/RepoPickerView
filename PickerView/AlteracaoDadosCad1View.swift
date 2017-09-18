//
//  AlteracaoDadosCad1View.swift
//  PickerView
//
//  Created by Jade Silveira on 18/09/17.
//  Copyright © 2017 Jade. All rights reserved.
//

import UIKit

class AlteracaoDadosCad1View : UIView {
    
    @IBOutlet weak var telefone: UITextField!
    @IBOutlet weak var celular: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var filiacao1: UITextField!
    @IBOutlet weak var filiacao2: UITextField!
    @IBOutlet weak var dataNascText: UITextField!
    @IBOutlet weak var numDoc: UITextField!
    @IBOutlet weak var orgaoEmissor: UITextField!
    @IBOutlet weak var cpf: UITextField!
    @IBOutlet weak var pictureText: UILabel!
    @IBOutlet weak var tipoDocsText: UITextField!
    @IBOutlet weak var ufsText: UITextField!
    @IBOutlet weak var paisesText: UITextField!
    
    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var titleView: UIView!
    
    @IBOutlet weak var heightScrollConstraint: NSLayoutConstraint!
    
    let pickerDocuments = UIPickerView()
    let pickerUfs = UIPickerView()
    let pickerCountries = UIPickerView()
    
    class func instanceFromNib() -> AlteracaoDadosCad1View {
        return UINib(nibName: "AlteracaoDadosCad1", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! AlteracaoDadosCad1View
    }
    
    func setup(cadastro: Cadastro) {
        self.telefone.text = cadastro.convertTelParaTela(cadastro.telefone!)
        self.celular.text = cadastro.convertTelParaTela(cadastro.celular!)
        self.email.text = cadastro.email
        self.filiacao1.text = cadastro.filiacao1
        self.filiacao2.text = cadastro.filiacao2
        self.dataNascText.text = cadastro.dateFormatTela(cadastro.dataNasc!)
        self.numDoc.text = cadastro.numDoc
        self.orgaoEmissor.text = cadastro.orgaoEmissor
        self.cpf.text = cadastro.convertCPFParaTela(cadastro.cpfCnpj!)
        self.tipoDocsText.text = PickerViewTipoDoc().textForRow(PickerViewTipoDoc().selectIndexForValue(cadastro.tipoDoc!))
        self.ufsText.text = PickerViewUF().textForRow( PickerViewUF().selectIndexForValue(cadastro.uf!))
        self.paisesText.text = PickerViewPais().textForRow(PickerViewPais().selectIndexForValue(cadastro.pais!))
        self.pictureText.text = "*Informe o nº do documento de identificação oficial com foto."
        
        if self.paisesText.text != "Brasil" {
            self.ufsText.userInteractionEnabled = false
            self.ufsText.textColor = UIColor.lightGrayColor()
        }
    }
    
    @IBAction func textFieldDidBeginEditing(textField: UITextField) {
        
        let inputView = UIView(frame: CGRectMake(0, 0, self.frame.width, 240))
        
        let doneButton = createButton()
        doneButton.addTarget(self, action: #selector(AlteracaoDadosCad1View.doneButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        inputView.addSubview(doneButton)
        
        if textField == dataNascText {
            let datePicker = createDatePicker(textField.text!)
            inputView.addSubview(datePicker)
            
            datePicker.addTarget(self, action: #selector(AlteracaoDadosCad1View.handleDatePicker(_:)), forControlEvents: UIControlEvents.ValueChanged)
            
            handleDatePicker(datePicker)
        } else if textField == tipoDocsText {
            pickerDocuments.frame = CGRectMake(0, 40, self.frame.width, 200)
            pickerDocuments.selectRow(PickerViewTipoDoc().selectIndexForText(textField.text!), inComponent: 0, animated: false)
            inputView.addSubview(pickerDocuments)
        } else if textField == ufsText {
            pickerUfs.frame = CGRectMake(0, 40, self.frame.width, 200)
            pickerUfs.selectRow(PickerViewUF().selectIndexForValue(textField.text!), inComponent: 0, animated: false)
            inputView.addSubview(pickerUfs)
        } else if textField == paisesText {
            pickerCountries.frame = CGRectMake(0, 40, self.frame.width, 200)
            pickerCountries.selectRow(PickerViewPais().selectIndexForText(textField.text!), inComponent: 0, animated: false)
            inputView.addSubview(pickerCountries)
        }
        textField.inputView = inputView
    }
    
    func createDatePicker(data: String) -> UIDatePicker {
        let datePicker = UIDatePicker(frame: CGRectMake(0, 40, 0, 0))
        datePicker.date = dateFormatToPicker(data)
        datePicker.datePickerMode = UIDatePickerMode.Date
        datePicker.locale = NSLocale.init(localeIdentifier: "pt_BR")
        
        return datePicker
    }
    
    func createButton() -> UIButton {
        let doneButton = UIButton(frame: CGRectMake((self.frame.size.width/2) - (100/2), 0, 100, 50))
        doneButton.setTitle("OK", forState: UIControlState.Normal)
        doneButton.setTitle("OK", forState: UIControlState.Highlighted)
        doneButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        doneButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
        
        return doneButton
    }
    
    func handleDatePicker(datePicker: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        self.dataNascText.text = dateFormatter.stringFromDate(datePicker.date)
    }
    
    func doneButton(sender:UIButton)
    {
        self.dataNascText.resignFirstResponder()
        self.tipoDocsText.resignFirstResponder()
        self.ufsText.resignFirstResponder()
        self.paisesText.resignFirstResponder()
    }
    
    func habilitaUF(arrayGenerico : [AnyObject], row: Int) {
        
        var habilitaUF = false
        
        if let paises = arrayGenerico as? [Pais] {
            if paises[row].nomeCompleto != "Brasil" {
                habilitaUF = false
            } else {
                habilitaUF = true
            }
        }
        if !habilitaUF {
            self.ufsText.text = "Escolha"
            self.ufsText.textColor = UIColor.lightGrayColor()
        } else {
            self.ufsText.textColor = UIColor.blackColor()
        }
        self.ufsText.userInteractionEnabled = habilitaUF
    }
    
    func dateFormatToPicker(data: String) -> NSDate {
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        return (dateFormatter.dateFromString(data) == nil ? NSDate.distantPast() : dateFormatter.dateFromString(data)!)
    }
}
