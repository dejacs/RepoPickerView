//
//  AlteracaoDadosCad1ViewController.swift
//  PickerView
//
//  Created by Jade Silveira on 18/09/17.
//  Copyright © 2017 Jade. All rights reserved.
//

import UIKit
import Foundation

class AlteracaoDadosCad1ViewController : AlteracaoDadosViewController {
    
    var pickerViewController: PickerViewController = PickerViewController()
    
    var customView: AlteracaoDadosCad1View = AlteracaoDadosCad1View.instanceFromNib()
    
    override func viewDidLoad() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
        self.customView.frame.size = self.view.bounds.size
        
        scrollViewControl()
        
        self.view.addSubview(self.customView)
        setPickerViewController()
        customView.setup(cadastro)
    }
    
    override func updateObject(){
        super.cadastro.telefone = customView.telefone.text
        super.cadastro.celular = customView.celular.text
        super.cadastro.email = customView.email.text
        super.cadastro.filiacao1 = customView.filiacao1.text
        super.cadastro.filiacao2 = customView.filiacao2.text
        super.cadastro.dataNascimento = customView.dataNascText.text
        super.cadastro.numeroDocumento = customView.numDoc.text
        super.cadastro.orgaoEmissor = customView.orgaoEmissor.text
        super.cadastro.cpfCnpj = super.cadastro.convertCPFParaSAP(customView.cpf.text!)
        super.cadastro.tipoDoc = PickerViewTipoDoc().valueForRow(PickerViewTipoDoc().selectIndexForText(customView.tipoDocsText.text!))
        super.cadastro.uf = PickerViewUF().textForRow(PickerViewUF().selectIndexForValue(customView.ufsText.text!))
        super.cadastro.pais = PickerViewPais().valueForRow(PickerViewPais().selectIndexForText(customView.paisesText.text!))
        
        if(super.pictureTaken != nil && customView.pictureText.text != self.LocalizeResourceString("services.dadoscadastrais.imagemNaoCarregada")){
            super.cadastro.foto = Base64.encode(super.pictureTaken);
        }
    }
    
    override func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        super.imagePickerController(picker, didFinishPickingMediaWithInfo: info)
        customView.pictureText.text = self.LocalizeResourceString("services.dadoscadastrais.imagemCarregadaComSucesso")
    }
    
    func setPickerViewController() {
        pickerViewController.pickerViews = [PickerViewTipoDoc(), PickerViewUF(), PickerViewPais()]
        
        customView.pickerDocuments.delegate = pickerViewController
        customView.pickerDocuments.dataSource = pickerViewController
        customView.pickerDocuments.tag = 0
        
        customView.pickerUfs.delegate = pickerViewController
        customView.pickerUfs.dataSource = pickerViewController
        customView.pickerUfs.tag = 1
        
        customView.pickerCountries.delegate = pickerViewController
        customView.pickerCountries.dataSource = pickerViewController
        customView.pickerCountries.tag = 2
        
        pickerViewController.genericView = customView
    }
    
    func scrollViewControl() {
        let viewHeight = self.customView.frame.height
        let tabBarHeight = self.tabBarController?.tabBar.frame.height
        let navigationTabHeight = self.navigationController?.tabBarController?.tabBar.frame.height
        let buttonViewHeight = self.customView.buttonsView.frame.height
        let titleHeight = self.customView.titleView.frame.height
        
        let height = viewHeight - tabBarHeight! - buttonViewHeight - titleHeight - navigationTabHeight!
        
        self.customView.heightScrollConstraint.constant = height
        self.customView.layoutIfNeeded()
    }
    
    @IBAction override func choosePicture(sender: UIButton!){
        super.choosePicture(sender)
    }
    
    @IBAction override func saveData() {
        super.saveData()
    }
    
    @IBAction override func cleanData() {
        customView.setup(cadastro)
    }
}
