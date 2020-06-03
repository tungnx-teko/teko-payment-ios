//
//  Payment.swift
//  PaymentSDK
//
//  Created by Tung Nguyen on 5/20/20.
//

import Foundation
import FirebaseDatabase
import FirebasePlugin

public class Payment {
    
    static var configs: PaymentConfigs = PaymentConfigsBuilder().build()
    private static let generator = PayloadGenerator.shared
    private static let service = PaymentService()
    
    public static func setConfigs(_ configs: PaymentConfigs) {
        Payment.configs = configs
    }
    
    public static func generateQR(order: OrderObject,
                                  method: PaymentMethod,
                                  onEvent: @escaping (PaymentEvent) -> (),
                                  onError: @escaping (PSError) -> ()) throws {
        try validateConfigs(configs: configs)
        
        let payload = generator.generateTranCreatePayload(order: order, method: method)
        service.generateQR(payload: payload,
                           onSuccess: { tran in onEvent(.transactionCreated(tran)) },
                           onError: { error in onError(error) })
    }
    
    public static func createTransaction(order: OrderObject,
                                         method: PaymentMethod,
                                         onEvent: @escaping (PaymentEvent) -> (),
                                         onError: @escaping (PSError) -> ()) throws {
        try validateConfigs(configs: configs)
        
        let payload = generator.generateTranCreatePayload(order: order, method: method)
        service.createTransaction(payload: payload,
                                  onSuccess: { tran in onEvent(.transactionCreated(tran)) },
                                  onError: { error in onError(error) })
    }
    
    private static func validateConfigs(configs: PaymentConfigs) throws {
        guard configs.clientCode.isNotEmpty else { throw PaymentError.missingClientCode }
        guard configs.terminalCode.isNotEmpty else { throw PaymentError.missingTerminalCode }
        guard configs.serviceCode.isNotEmpty else { throw PaymentError.missingServiceCode }
        guard configs.secretKey.isNotEmpty else { throw PaymentError.missingServiceCode }
    }
    
}
