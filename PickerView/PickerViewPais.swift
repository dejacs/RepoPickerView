//
//  PickerViewPais.swift
//  PickerView
//
//  Created by Jade Silveira on 18/09/17.
//  Copyright © 2017 Jade. All rights reserved.
//

import UIKit
import Foundation

class PickerViewPais : PickerView {
    
    override init() {
        super.init()
        
        loadPaises()
        
        //        if let paises = self.items as? [Pais] {
        //            self.items = paises.sort { $0.nomeCompleto.localizedCaseInsensitiveCompare($1.nomeCompleto) == NSComparisonResult.OrderedAscending }
        //        }
    }
    
    override func didSelectRow(row: Int, genericView: UIView) {
        if let view = genericView as? AlteracaoDadosCad1View {
            view.habilitaUF(self.items, row: row)
            view.paisesText.text = self.textForRow(row)
        }
    }
    
    override func textForRow(row: Int) -> String {
        if let pais = self.items[row] as? Pais {
            return pais.nomeCompleto
        } else {
            return ""
        }
    }
    
    override func valueForRow(row: Int) -> String {
        if let pais = self.items[row] as? Pais {
            return pais.abreviacao
        } else {
            return ""
        }
    }
    
    override func selectIndexForText (textInRow: String) -> Int {
        
        var index = 0
        
        if let paises = self.items as? [Pais] {
            
            for position in 0...self.items.count - 1 {
                
                if paises[position].nomeCompleto == textInRow {
                    index = position
                    
                    break
                }
            }
        }
        return index
    }
    
    override func selectIndexForValue (valueInRow: String) -> Int {
        
        var index = 0
        
        if let paises = self.items as? [Pais] {
            
            for position in 0...self.items.count - 1 {
                
                if paises[position].abreviacao == valueInRow {
                    index = position
                    
                    break
                }
            }
        }
        return index
    }
    
    func loadPaises() {
        self.items = [
            Pais(abreviacao: "", nomeCompleto: "Escolha"),
            Pais(abreviacao: "AD", nomeCompleto: "Andorra"),
            Pais(abreviacao: "AE", nomeCompleto: "EmirÁrabUnids"),
            Pais(abreviacao: "AF", nomeCompleto: "Afeganistão"),
            Pais(abreviacao: "AG", nomeCompleto: "Antígua/Barbuda"),
            Pais(abreviacao: "AI", nomeCompleto: "Anguilla"),
            Pais(abreviacao: "AL", nomeCompleto: "Albânia"),
            Pais(abreviacao: "AM", nomeCompleto: "Armênia"),
            Pais(abreviacao: "AN", nomeCompleto: "AntilhasHoland"),
            Pais(abreviacao: "AO", nomeCompleto: "Angola"),
            Pais(abreviacao: "AQ", nomeCompleto: "Antártica"),
            Pais(abreviacao: "AR", nomeCompleto: "Argentina"),
            Pais(abreviacao: "AS", nomeCompleto: "Samoa Americana"),
            Pais(abreviacao: "AT", nomeCompleto: "Áustria"),
            Pais(abreviacao: "AU", nomeCompleto: "Austrália"),
            Pais(abreviacao: "AW", nomeCompleto: "Aruba"),
            Pais(abreviacao: "AZ", nomeCompleto: "Azerbaijão"),
            Pais(abreviacao: "BA", nomeCompleto: "Bósnia-Herzeg"),
            Pais(abreviacao: "BB", nomeCompleto: "Barbados"),
            Pais(abreviacao: "BD", nomeCompleto: "Bangladesh"),
            Pais(abreviacao: "BE", nomeCompleto: "Bélgica"),
            Pais(abreviacao: "BF", nomeCompleto: "Burquina Faso"),
            Pais(abreviacao: "BG", nomeCompleto: "Bulgária"),
            Pais(abreviacao: "BH", nomeCompleto: "Barein"),
            Pais(abreviacao: "BI", nomeCompleto: "Burundi"),
            Pais(abreviacao: "BJ", nomeCompleto: "Benin"),
            Pais(abreviacao: "BL", nomeCompleto: "Saint-Barthélem"),
            Pais(abreviacao: "BM", nomeCompleto: "Bermudas"),
            Pais(abreviacao: "BN", nomeCompleto: "Brunei"),
            Pais(abreviacao: "BO", nomeCompleto: "Bolívia"),
            Pais(abreviacao: "BR", nomeCompleto: "Brasil"),
            Pais(abreviacao: "BS", nomeCompleto: "Bahamas"),
            Pais(abreviacao: "BT", nomeCompleto: "Butão"),
            Pais(abreviacao: "BV", nomeCompleto: "Ilhas Bouvet"),
            Pais(abreviacao: "BW", nomeCompleto: "Botsuana"),
            Pais(abreviacao: "BY", nomeCompleto: "Bielo-Rússia"),
            Pais(abreviacao: "BZ", nomeCompleto: "Belize"),
            Pais(abreviacao: "CA", nomeCompleto: "Canadá"),
            Pais(abreviacao: "CC", nomeCompleto: "Ilhas Coco"),
            Pais(abreviacao: "CD", nomeCompleto: "República Congo"),
            Pais(abreviacao: "CF", nomeCompleto: "RepCentroAfric"),
            Pais(abreviacao: "CG", nomeCompleto: "Congo"),
            Pais(abreviacao: "CH", nomeCompleto: "Suíça"),
            Pais(abreviacao: "CI", nomeCompleto: "Costa do Marfim"),
            Pais(abreviacao: "CK", nomeCompleto: "Ilha Cook"),
            Pais(abreviacao: "CL", nomeCompleto: "Chile"),
            Pais(abreviacao: "CM", nomeCompleto: "Camarões"),
            Pais(abreviacao: "CN", nomeCompleto: "China"),
            Pais(abreviacao: "CO", nomeCompleto: "Colômbia"),
            Pais(abreviacao: "CR", nomeCompleto: "Costa Rica"),
            Pais(abreviacao: "CS", nomeCompleto: "Sérvia/Montngro"),
            Pais(abreviacao: "CU", nomeCompleto: "Cuba"),
            Pais(abreviacao: "CV", nomeCompleto: "Cabo Verde"),
            Pais(abreviacao: "CX", nomeCompleto: "Ilha Christmas"),
            Pais(abreviacao: "CY", nomeCompleto: "Chipre"),
            Pais(abreviacao: "CZ", nomeCompleto: "RepúblicaTcheca"),
            Pais(abreviacao: "DE", nomeCompleto: "Alemanha"),
            Pais(abreviacao: "DJ", nomeCompleto: "Djibuti"),
            Pais(abreviacao: "DK", nomeCompleto: "Dinamarca"),
            Pais(abreviacao: "DM", nomeCompleto: "Dominica"),
            Pais(abreviacao: "DO", nomeCompleto: "Rep.Dominicana"),
            Pais(abreviacao: "DZ", nomeCompleto: "Argélia"),
            Pais(abreviacao: "EC", nomeCompleto: "Equador"),
            Pais(abreviacao: "EE", nomeCompleto: "Estônia"),
            Pais(abreviacao: "EG", nomeCompleto: "Egito"),
            Pais(abreviacao: "EH", nomeCompleto: "Saara Ocidental"),
            Pais(abreviacao: "ER", nomeCompleto: "Eritréia"),
            Pais(abreviacao: "ES", nomeCompleto: "Espanha"),
            Pais(abreviacao: "ET", nomeCompleto: "Etiópia"),
            Pais(abreviacao: "EU", nomeCompleto: "União Européia"),
            Pais(abreviacao: "FI", nomeCompleto: "Finlândia"),
            Pais(abreviacao: "FJ", nomeCompleto: "Fiji"),
            Pais(abreviacao: "FK", nomeCompleto: "Ilhas Malvinas"),
            Pais(abreviacao: "FM", nomeCompleto: "Micronésia"),
            Pais(abreviacao: "FO", nomeCompleto: "Ilhas Faroé"),
            Pais(abreviacao: "FR", nomeCompleto: "França"),
            Pais(abreviacao: "GA", nomeCompleto: "Gabão"),
            Pais(abreviacao: "GB", nomeCompleto: "Reino Unido"),
            Pais(abreviacao: "GD", nomeCompleto: "Granada"),
            Pais(abreviacao: "GE", nomeCompleto: "Geórgia"),
            Pais(abreviacao: "GF", nomeCompleto: "Guiana Francesa"),
            Pais(abreviacao: "GH", nomeCompleto: "Gana"),
            Pais(abreviacao: "GI", nomeCompleto: "Gibraltar"),
            Pais(abreviacao: "GL", nomeCompleto: "Groenlândia"),
            Pais(abreviacao: "GM", nomeCompleto: "Gâmbia"),
            Pais(abreviacao: "GN", nomeCompleto: "Guiné"),
            Pais(abreviacao: "GP", nomeCompleto: "Guadalupe"),
            Pais(abreviacao: "GQ", nomeCompleto: "Guiné Equator"),
            Pais(abreviacao: "GR", nomeCompleto: "Grécia"),
            Pais(abreviacao: "GS", nomeCompleto: "Ilhas Sandwich"),
            Pais(abreviacao: "GT", nomeCompleto: "Guatemala"),
            Pais(abreviacao: "GU", nomeCompleto: "Guam"),
            Pais(abreviacao: "GW", nomeCompleto: "Guiné Bissau"),
            Pais(abreviacao: "GY", nomeCompleto: "Guiana"),
            Pais(abreviacao: "HK", nomeCompleto: "Hong Kong"),
            Pais(abreviacao: "HM", nomeCompleto: "Heard/Ilh.McDon"),
            Pais(abreviacao: "HN", nomeCompleto: "Honduras"),
            Pais(abreviacao: "HR", nomeCompleto: "Croácia"),
            Pais(abreviacao: "HT", nomeCompleto: "Haiti"),
            Pais(abreviacao: "HU", nomeCompleto: "Hungria"),
            Pais(abreviacao: "ID", nomeCompleto: "Indonésia"),
            Pais(abreviacao: "IE", nomeCompleto: "Irlanda"),
            Pais(abreviacao: "IL", nomeCompleto: "Israel"),
            Pais(abreviacao: "IN", nomeCompleto: "Índia"),
            Pais(abreviacao: "IO", nomeCompleto: "Terr.Brit.Oc.In"),
            Pais(abreviacao: "IQ", nomeCompleto: "Iraque"),
            Pais(abreviacao: "IR", nomeCompleto: "Irã"),
            Pais(abreviacao: "IS", nomeCompleto: "Islândia"),
            Pais(abreviacao: "IT", nomeCompleto: "Itália"),
            Pais(abreviacao: "JM", nomeCompleto: "Jamaica"),
            Pais(abreviacao: "JO", nomeCompleto: "Jordânia"),
            Pais(abreviacao: "JP", nomeCompleto: "Japão"),
            Pais(abreviacao: "KE", nomeCompleto: "Quênia"),
            Pais(abreviacao: "KG", nomeCompleto: "Quirguistão"),
            Pais(abreviacao: "KH", nomeCompleto: "Camboja"),
            Pais(abreviacao: "KI", nomeCompleto: "Kiribati"),
            Pais(abreviacao: "KM", nomeCompleto: "Comores"),
            Pais(abreviacao: "KN", nomeCompleto: "S.Crist.e Névis"),
            Pais(abreviacao: "KP", nomeCompleto: "Coréia do Norte"),
            Pais(abreviacao: "KR", nomeCompleto: "Coréia do Sul"),
            Pais(abreviacao: "KW", nomeCompleto: "Kuaite"),
            Pais(abreviacao: "KY", nomeCompleto: "Ilhas Cayman"),
            Pais(abreviacao: "KZ", nomeCompleto: "Cazaquistão"),
            Pais(abreviacao: "LA", nomeCompleto: "Laos"),
            Pais(abreviacao: "LB", nomeCompleto: "Líbano"),
            Pais(abreviacao: "LC", nomeCompleto: "Santa Lúcia"),
            Pais(abreviacao: "LI", nomeCompleto: "Liechtenstein"),
            Pais(abreviacao: "LK", nomeCompleto: "Sri Lanka"),
            Pais(abreviacao: "LR", nomeCompleto: "Libéria"),
            Pais(abreviacao: "LS", nomeCompleto: "Lesoto"),
            Pais(abreviacao: "LT", nomeCompleto: "Lituânia"),
            Pais(abreviacao: "LU", nomeCompleto: "Luxemburgo"),
            Pais(abreviacao: "LV", nomeCompleto: "Letônia"),
            Pais(abreviacao: "LY", nomeCompleto: "Líbia"),
            Pais(abreviacao: "MA", nomeCompleto: "Marrocos"),
            Pais(abreviacao: "MC", nomeCompleto: "Mônaco"),
            Pais(abreviacao: "MD", nomeCompleto: "Moldova"),
            Pais(abreviacao: "MG", nomeCompleto: "Madagascar"),
            Pais(abreviacao: "MH", nomeCompleto: "Ilhas Marshall"),
            Pais(abreviacao: "MK", nomeCompleto: "Macedônia"),
            Pais(abreviacao: "ML", nomeCompleto: "Mali"),
            Pais(abreviacao: "MM", nomeCompleto: "Myanmar"),
            Pais(abreviacao: "MN", nomeCompleto: "Mongólia"),
            Pais(abreviacao: "MO", nomeCompleto: "Macau"),
            Pais(abreviacao: "MP", nomeCompleto: "I.Marianas Nrt."),
            Pais(abreviacao: "MQ", nomeCompleto: "Martinica"),
            Pais(abreviacao: "MR", nomeCompleto: "Mauritânia"),
            Pais(abreviacao: "MS", nomeCompleto: "Montserrat"),
            Pais(abreviacao: "MT", nomeCompleto: "Malta"),
            Pais(abreviacao: "MU", nomeCompleto: "Maurício"),
            Pais(abreviacao: "MV", nomeCompleto: "Maldivas"),
            Pais(abreviacao: "MW", nomeCompleto: "Maláwi"),
            Pais(abreviacao: "MX", nomeCompleto: "México"),
            Pais(abreviacao: "MY", nomeCompleto: "Malásia"),
            Pais(abreviacao: "MZ", nomeCompleto: "Moçambique"),
            Pais(abreviacao: "NA", nomeCompleto: "Namíbia"),
            Pais(abreviacao: "NC", nomeCompleto: "Nova Caledônia"),
            Pais(abreviacao: "NE", nomeCompleto: "Níger"),
            Pais(abreviacao: "NF", nomeCompleto: "Ilha Norfolk"),
            Pais(abreviacao: "NG", nomeCompleto: "Nigéria"),
            Pais(abreviacao: "NI", nomeCompleto: "Nicarágua"),
            Pais(abreviacao: "NL", nomeCompleto: "Países Baixos"),
            Pais(abreviacao: "NO", nomeCompleto: "Noruega"),
            Pais(abreviacao: "NP", nomeCompleto: "Nepal"),
            Pais(abreviacao: "NR", nomeCompleto: "Nauru"),
            Pais(abreviacao: "NU", nomeCompleto: "Niue"),
            Pais(abreviacao: "NZ", nomeCompleto: "Nova Zelândia"),
            Pais(abreviacao: "OM", nomeCompleto: "Omã"),
            Pais(abreviacao: "OR", nomeCompleto: "Alaranjado"),
            Pais(abreviacao: "PA", nomeCompleto: "Panamá"),
            Pais(abreviacao: "PE", nomeCompleto: "Peru"),
            Pais(abreviacao: "PF", nomeCompleto: "PolinésiaFranc"),
            Pais(abreviacao: "PG", nomeCompleto: "Papua NovaGuiné"),
            Pais(abreviacao: "PH", nomeCompleto: "Filipinas"),
            Pais(abreviacao: "PK", nomeCompleto: "Paquistão"),
            Pais(abreviacao: "PL", nomeCompleto: "Polônia"),
            Pais(abreviacao: "PM", nomeCompleto: "S.Pedro,Miquel"),
            Pais(abreviacao: "PN", nomeCompleto: "Ilha Pitcairn"),
            Pais(abreviacao: "PR", nomeCompleto: "Porto Rico"),
            Pais(abreviacao: "PS", nomeCompleto: "Palestina"),
            Pais(abreviacao: "PT", nomeCompleto: "Portugal"),
            Pais(abreviacao: "PW", nomeCompleto: "Palau"),
            Pais(abreviacao: "PY", nomeCompleto: "Paraguai"),
            Pais(abreviacao: "QA", nomeCompleto: "Catar"),
            Pais(abreviacao: "RE", nomeCompleto: "Reunião"),
            Pais(abreviacao: "RO", nomeCompleto: "Romênia"),
            Pais(abreviacao: "RU", nomeCompleto: "Federação Russa"),
            Pais(abreviacao: "RW", nomeCompleto: "Ruanda"),
            Pais(abreviacao: "SA", nomeCompleto: "Arábia Saudita"),
            Pais(abreviacao: "SB", nomeCompleto: "Ilhas Salomão"),
            Pais(abreviacao: "SC", nomeCompleto: "Seicheles"),
            Pais(abreviacao: "SD", nomeCompleto: "Sudão"),
            Pais(abreviacao: "SE", nomeCompleto: "Suécia"),
            Pais(abreviacao: "SG", nomeCompleto: "Cingapura"),
            Pais(abreviacao: "SH", nomeCompleto: "Santa Helena"),
            Pais(abreviacao: "SI", nomeCompleto: "Eslovênia"),
            Pais(abreviacao: "SJ", nomeCompleto: "Svalbard"),
            Pais(abreviacao: "SK", nomeCompleto: "Eslováquia"),
            Pais(abreviacao: "SL", nomeCompleto: "Serra Leoa"),
            Pais(abreviacao: "SM", nomeCompleto: "San Marino"),
            Pais(abreviacao: "SN", nomeCompleto: "Senegal"),
            Pais(abreviacao: "SO", nomeCompleto: "Somália"),
            Pais(abreviacao: "SR", nomeCompleto: "Suriname"),
            Pais(abreviacao: "ST", nomeCompleto: "S.Tomé,Príncipe"),
            Pais(abreviacao: "SV", nomeCompleto: "El Salvador"),
            Pais(abreviacao: "SY", nomeCompleto: "Síria"),
            Pais(abreviacao: "SZ", nomeCompleto: "Suazilandia"),
            Pais(abreviacao: "TC", nomeCompleto: "I.Turcas,Caicos"),
            Pais(abreviacao: "TD", nomeCompleto: "Chade"),
            Pais(abreviacao: "TF", nomeCompleto: "TerMerid.França"),
            Pais(abreviacao: "TG", nomeCompleto: "Togo"),
            Pais(abreviacao: "TH", nomeCompleto: "Tailândia"),
            Pais(abreviacao: "TJ", nomeCompleto: "Tadjiquistão"),
            Pais(abreviacao: "TK", nomeCompleto: "Ilhas Toquelau"),
            Pais(abreviacao: "TL", nomeCompleto: "Timor Leste"),
            Pais(abreviacao: "TM", nomeCompleto: "Turcomenistão"),
            Pais(abreviacao: "TN", nomeCompleto: "Tunísia"),
            Pais(abreviacao: "TO", nomeCompleto: "Tonga"),
            Pais(abreviacao: "TP", nomeCompleto: "Timor Leste"),
            Pais(abreviacao: "TR", nomeCompleto: "Turquia"),
            Pais(abreviacao: "TT", nomeCompleto: "Trinidad,Tobago"),
            Pais(abreviacao: "TV", nomeCompleto: "Tuvalu"),
            Pais(abreviacao: "TW", nomeCompleto: "Taiwan"),
            Pais(abreviacao: "TZ", nomeCompleto: "Tanzânia"),
            Pais(abreviacao: "UA", nomeCompleto: "Ucrânia"),
            Pais(abreviacao: "UG", nomeCompleto: "Uganda"),
            Pais(abreviacao: "UM", nomeCompleto: "I.Menores EUA"),
            Pais(abreviacao: "US", nomeCompleto: "EUA"),
            Pais(abreviacao: "UY", nomeCompleto: "Uruguai"),
            Pais(abreviacao: "UZ", nomeCompleto: "Uzbequistão"),
            Pais(abreviacao: "VA", nomeCompleto: "Vaticano"),
            Pais(abreviacao: "VC", nomeCompleto: "São Vicente"),
            Pais(abreviacao: "VE", nomeCompleto: "Venezuela"),
            Pais(abreviacao: "VG", nomeCompleto: "I.Virgens Brit."),
            Pais(abreviacao: "VI", nomeCompleto: "I.Virgens Amer."),
            Pais(abreviacao: "VN", nomeCompleto: "Vietnã"),
            Pais(abreviacao: "VU", nomeCompleto: "Vanuato"),
            Pais(abreviacao: "WF", nomeCompleto: "Wallis,Futuna"),
            Pais(abreviacao: "WS", nomeCompleto: "Samoa Ocidental"),
            Pais(abreviacao: "YE", nomeCompleto: "Iêmen"),
            Pais(abreviacao: "YT", nomeCompleto: "Mayotte"),
            Pais(abreviacao: "ZA", nomeCompleto: "África do Sul"),
            Pais(abreviacao: "ZM", nomeCompleto: "Zâmbia"),
            Pais(abreviacao: "ZW", nomeCompleto: "Zimbábue")
        ]
    }
}
