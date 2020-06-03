//
//  PaymentMethod.swift
//  Pods
//
//  Created by Tung Nguyen on 6/3/20.
//

import Foundation

public struct PaymentMethod {
    var partnerCode: String
    var bankCode: String
    var methodCode: String
    
    public init(partnerCode: String, bankCode: String, methodCode: String) {
        self.partnerCode = partnerCode
        self.bankCode = bankCode
        self.methodCode = methodCode
    }
}
