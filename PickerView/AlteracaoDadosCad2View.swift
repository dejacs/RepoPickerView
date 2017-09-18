//
//  AlteracaoDadosCad2View.swift
//  PickerView
//
//  Created by Jade Silveira on 18/09/17.
//  Copyright © 2017 Jade. All rights reserved.
//

import UIKit

class AlteracaoDadosCad2View : UIView {
    
    @IBOutlet weak var telefone: UITextField!
    @IBOutlet weak var celular: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var cnpj: UITextField!
    @IBOutlet weak var pictureText: UILabel!
    
    class func instanceFromNib() -> AlteracaoDadosCad2View {
        return UINib(nibName: "AlteracaoDadosCad2", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! AlteracaoDadosCad2View
    }
    
    func setup(cadastro: Cadastro) {
        self.telefone.text = cadastro.convertTelParaTela(cadastro.telefone!)
        self.celular.text = cadastro.convertTelParaTela(cadastro.telefone!)
        self.email.text = cadastro.email
        self.cnpj.text = cadastro.convertCNPJParaTela(cadastro.cpfCnpj!)
        self.pictureText.text = "*Informe o nº do documento de identificação oficial com foto."
    }
}
