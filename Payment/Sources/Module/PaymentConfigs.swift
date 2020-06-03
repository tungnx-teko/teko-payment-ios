//
//  PaymentConfigs.swift
//  PaymentSDK
//
//  Created by Tung Nguyen on 5/20/20.
//

import Foundation

public class PaymentConfigs {
    var clientCode: String
    var terminalCode: String
    var serviceCode: String
    var secretKey: String
    var baseUrl: String
    var returnUrl: String
    var cancelUrl: String
    
    init(clientCode: String, terminalCode: String, serviceCode: String, secretKey: String, baseUrl: String, returnUrl: String, cancelUrl: String) {
        self.clientCode = clientCode
        self.terminalCode = terminalCode
        self.serviceCode = serviceCode
        self.secretKey = secretKey
        self.baseUrl = baseUrl
        self.returnUrl = returnUrl
        self.cancelUrl = cancelUrl
    }
}

public class PaymentConfigsBuilder {
    var clientCode: String = ""
    var terminalCode: String = ""
    var serviceCode: String = ""
    var partnerCode: String = ""
    var secretKey: String = ""
    var baseUrl: String = ""
    var returnUrl: String = ""
    var cancelUrl: String = ""
    
    public init() {}
    
    public func clientCode(_ clientCode: String) -> PaymentConfigsBuilder {
        self.clientCode = clientCode
        return self
    }
    
    public func terminalCode(_ terminalCode: String) -> PaymentConfigsBuilder {
        self.terminalCode = terminalCode
        return self
    }
    
    public func serviceCode(_ serviceCode: String) -> PaymentConfigsBuilder {
        self.serviceCode = serviceCode
        return self
    }
    
    public func secretKey(_ secretKey: String) -> PaymentConfigsBuilder {
        self.secretKey = secretKey
        return self
    }
    
    public func baseUrl(_ baseUrl: String) -> PaymentConfigsBuilder {
        self.baseUrl = baseUrl
        return self
    }
    
    public func returnUrl(_ returnUrl: String) -> PaymentConfigsBuilder {
        self.returnUrl = returnUrl
        return self
    }
    
    public func cancelUrl(_ cancelUrl: String) -> PaymentConfigsBuilder {
        self.cancelUrl = cancelUrl
        return self
    }
    
    public func build() -> PaymentConfigs {
        return PaymentConfigs(clientCode: clientCode,
                              terminalCode: terminalCode,
                              serviceCode: serviceCode,
                              secretKey: secretKey,
                              baseUrl: baseUrl,
                              returnUrl: returnUrl,
                              cancelUrl: cancelUrl)
    }
}
