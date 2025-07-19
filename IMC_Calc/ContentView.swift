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
    @ObservedObject private var bmiModel = BMIModel()
    
    var body: some View {
        
        ZStack {
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
            .ignoresSafeArea()
            
            
            VStack {
                
                Text("Calcule seu IMC")
                    .multilineTextAlignment(.leading)
                    .font(.title)
                    .bold()
                
                
                TextField("Peso", text: $bmiModel.weight)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.center)
                    .font(.default)
                    .bold()
                    .padding(.vertical, 25)
                    .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 16))
                
                
                TextField("Altura", text: $bmiModel.height)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.center)
                    .font(.default)
                    .bold()
                    .padding(.vertical, 25)
                    .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 16))
                
                Spacer()
                
                Text("""

Seu IMC atual é \(String(format: "%.2f", bmiModel.resultCalc)) e sua 
categoria é \(BMI.category(massIndex: bmiModel.resultCalc).description())

"""
                )
                .multilineTextAlignment(.center)
                .font(.title2)
                .bold()
                
                Spacer()
                
                Button("Calcular") {
                    bmiModel.calc()
                }
                .disabled(bmiModel.height.isEmpty)
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

