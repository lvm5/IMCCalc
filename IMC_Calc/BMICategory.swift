//
//  BMICategory.swift
//  IMC_Calc
//
//  Created by Leandro Morais on 2025-07-19.
//

import Foundation

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
