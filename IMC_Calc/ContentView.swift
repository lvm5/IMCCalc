//  APLICANDO O CONCEITOS APRENDIDOS EM AULA
//
//  ContentView.swift
//  IMCCalc
//
//  Created by Leandro Morais on 2025-07-17.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var resultCalc: Double = 0.0
    
    func calc() {
        // Tenta converter a String para Double
        guard let doubleWeight = Double(weight) else {
            print("❌ Erro valor")
            return
        }
        guard let doubleHeight = Double(height) else {
            print("❌ Erro valor")
            return
        }
        let resultFinal: Double = doubleWeight / pow(doubleHeight, 2) // pow eleva o numero
        
        resultCalc = resultFinal
    }
    
    
    enum BMI: String {
        case thinnessIII
        case thinnessII
        case thinnessI
        
        case regular
        case preObesity
        
        case obesityI
        case obesityII
        case obesityIII
        
        
        
        static func category(massIndex: Double) -> BMI {
            switch massIndex {
            case    ..<16.0:       return .thinnessIII
            case    16.0 ..< 17.0: return .thinnessII
            case    17.0 ..< 18.5: return .thinnessI
            case    18.5 ..< 25.0: return .regular
            case    25.0 ..< 30.0: return .preObesity
            case    30.0 ..< 35.0: return .obesityI
            case    35.0 ..< 40.0: return .obesityII
            default:               return .obesityIII
            }
        }
        
        func description() -> String {
            switch self {
            case .thinnessI: return "magreza grau I"
            case .thinnessII: return "magreza grau II"
            case .thinnessIII: return "magreza grau III"
                
            case .regular: return "normal"
            case .preObesity: return "pré-obesidade"
                
            case .obesityI: return "obesidade moderada grau I"
            case .obesityII: return "obesidade severa grau II"
            default: return "obesidade muito severa grau III"
            }
        }
    }
    
    var body: some View {
        
        ZStack {
            // Fundo com gradiente que muda conforme o modo claro/escuro
            LinearGradient(
                colors: colorScheme == .dark
                ? [
                    Color(red: 0.12, green: 0.16, blue: 0.20).opacity(0.6), // Grafite suave
                    Color(red: 0.07, green: 0.32, blue: 0.27).opacity(0.4)  // Verde petróleo
                ]
                : [
                    Color(red: 0.87, green: 0.95, blue: 0.91).opacity(0.9), // Verde claro
                    Color(red: 0.54, green: 0.78, blue: 0.90).opacity(0.85), // Azul leve
                    Color(red: 1.00, green: 0.83, blue: 0.55).opacity(0.9)   // Amarelo suave
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea() // Faz o fundo ocupar toda a tela
            
            
            VStack {
                
                Text("Calcule seu IMC")
                    .multilineTextAlignment(.leading)
                    .font(.title)
                    .bold()
                
                
                TextField("Peso", text: $weight)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.center)
                    .font(.default)
                    .bold()
                    .padding(.vertical, 25)
                    .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 16))
                
                
                TextField("Altura", text: $height)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.center)
                    .font(.default)
                    .bold()
                    .padding(.vertical, 25)
                    .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 16))
                        
                Spacer()
                
                Text("""

Seu IMC atual é \(String(format: "%.2f", resultCalc)) e sua 
categoria é \(BMI.category(massIndex: resultCalc).description())

"""
                )
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .bold()
                //                }
                
                Spacer()
                
                Button("Calcular") {
                    calc()
                }
                .disabled(height.isEmpty)
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(width: 250, height: 60)
                .padding()
                .glassEffect(.regular.tint(.green).interactive())
                
            }
            .padding()
            //.navigationTitle("Quantos litros?")
            .foregroundColor(colorScheme == .dark ? .white.opacity(0.8) : .black)
            
        }
    }
}

#Preview {
    ContentView()
}
