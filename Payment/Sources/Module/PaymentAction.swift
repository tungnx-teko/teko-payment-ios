//
//  PaymentAction.swift
//  PaymentSDK
//
//  Created by Tung Nguyen on 5/22/20.
//

import Foundation

public enum PaymentAction {
    case vnpayCreate(methodCode: String, bankCode: String, partnerCode: String)
    case gateCreate(methodCode: String, bankCode: String, partnerCode: String)
    case tpayCreate(methodCode: String, bankCode: String, partnerCode: String)
    case tpayConfirm(methodCode: String, bankCode: String, partnerCode: String)
    
    var strategy: PaymentStrategy {
        switch self {
        case .vnpayCreate(let methodCode, let bankCode, let partnerCode):
            return VNPay(methodCode: methodCode, bankCode: bankCode, partnerCode: partnerCode)
        case .gateCreate(let methodCode, let bankCode, let partnerCode):
            return PayGate(methodCode: methodCode, bankCode: bankCode, partnerCode: partnerCode)
        case .tpayCreate(let methodCode, let bankCode, let partnerCode):
            return TPay(methodCode: methodCode, bankCode: bankCode, partnerCode: partnerCode)
        case .tpayConfirm(let methodCode, let bankCode, let partnerCode):
            return TPayConfirm(methodCode: methodCode, bankCode: bankCode, partnerCode: partnerCode)
        }
    }
}
