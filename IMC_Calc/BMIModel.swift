//
//  Calcs.swift
//  IMC_Calc
//
//  Created by Leandro Morais on 2025-07-19.
//

import Foundation
import Combine


class BMIModel: ObservableObject {
    @Published  var weight: String = ""
    @Published  var height: String = ""
    @Published  var resultCalc: Double = 0.0
    
    func calc() {
        // Tenta converter a String para Double
        guard let doubleWeight = Double(weight.replacingOccurrences(of: ",", with: ".")) else { // replacing faz troca de  virgula por ponto
            print("❌ Erro valor")
            return
        }
        guard let doubleHeight = Double(height.replacingOccurrences(of: ",", with: ".")) else {
            print("❌ Erro valor")
            return
        }
        let resultFinal: Double = doubleWeight / pow(doubleHeight, 2) // pow eleva o numero
        
        resultCalc = resultFinal
    }
}

