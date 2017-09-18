//
//  AlteracaoDadosCad2ViewController.swift
//  PickerView
//
//  Created by Jade Silveira on 18/09/17.
//  Copyright © 2017 Jade. All rights reserved.
//

import UIKit
import Foundation

class AlteracaoDadosCad2ViewController : AlteracaoDadosViewController {
    
    var customView: AlteracaoDadosCad2View = AlteracaoDadosCad2View.instanceFromNib()
    
    override func viewDidLoad() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        view.addGestureRecognizer(tap)
        
        self.view.addSubview(self.customView)
        customView.setup(cadastro)
    }
    
    override func updateObject(){
        super.cadastro.telefone = customView.telefone.text
        super.cadastro.telCelular = customView.celular.text
        super.cadastro.email = customView.email.text
        super.cadastro.cpfCnpj = super.cadastro.convertCNPJParaSAP(customView.cnpj.text!)
        
        if(super.pictureTaken != nil && customView.pictureText.text != self.LocalizeResourceString("services.dadoscadastrais.imagemNaoCarregada")){
            super.cadastro.foto = Base64.encode(super.pictureTaken);
        }
    }
    
    override func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        super.imagePickerController(picker, didFinishPickingMediaWithInfo: info)
        customView.pictureText.text = self.LocalizeResourceString("services.dadoscadastrais.imagemCarregadaComSucesso")
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
