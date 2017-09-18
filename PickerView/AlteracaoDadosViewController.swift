//
//  AlteracaoDadosViewController.swift
//  PickerView
//
//  Created by Jade Silveira on 18/09/17.
//  Copyright © 2017 Jade. All rights reserved.
//

import UIKit
import Foundation

class AlteracaoDadosViewController : UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIGestureRecognizerDelegate {
    
    var cadastro: Cadastro1!;
    
    var pictureTaken : NSData?;
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func saveData() {
        self.updateObject()
        self.updateData()
    }
    
    func cleanData() { }
    
    func updateObject() { }
    
    func updateData() {
        PreferenceManager.unsetTouchedSolicita()
        showLoadingHUD()
        
        let cadastroClient = CadastroClient()
        
        cadastroClient.updateRegister(self, cadastro: cadastro, conclusao: { protocolo, erro in
            
            if(erro == nil) {
                self.showOKWithMessage("Dados enviados com sucesso!", details: "O número do seu protocolo de atendimento é: " + protocolo + ".")
            }
            else {
                self.showErrorWithMessage(self.LocalizeResourceString("error.generic.title"), details: (erro?.mensagemErro)!);
                return
            }
        })
    }
    
    func choosePicture(sender: UIButton!){
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary)) {
            let imag = UIImagePickerController()
            imag.delegate = self
            imag.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
            imag.allowsEditing = false
            
            self.presentViewController(imag, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let originalImage: UIImage? = info["UIImagePickerControllerOriginalImage"] as? UIImage;
        var calculedScale : CGFloat = 1;
        var sizeToScale : CGFloat = 1;
        if(originalImage!.size.width > originalImage!.size.height ){
            sizeToScale = originalImage!.size.width;
        }
        else{
            sizeToScale = originalImage!.size.height;
        }
        
        if(sizeToScale > 800){
            calculedScale = (sizeToScale / 800);
        }
        
        let resizedImage = UIImage(CGImage: originalImage!.CGImage!, scale: calculedScale, orientation: UIImageOrientation.Up);
        
        self.pictureTaken =  UIImageJPEGRepresentation(resizedImage,  0.5);
        
        picker.dismissViewControllerAnimated(true, completion: nil);
    }
}
