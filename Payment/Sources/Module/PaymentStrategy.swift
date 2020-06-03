//
//  PaymentStrategy.swift
//  PaymentSDK
//
//  Created by Tung Nguyen on 5/20/20.
//

import Foundation

protocol PaymentStrategy {
    var methodCode: String { get }
    var bankCode: String { get }
    var partnerCode: String { get }
    
    func process(service: PaymentService, order: OrderObject,
                 onSuccess: @escaping (PaymentEvent) -> (), onError: @escaping (PSError) -> ())
}

extension PaymentStrategy {
    
    func generatePayload(order: OrderObject) -> [String: Any] {
        var dict = [String: Any]()
        dict["clientCode"] = Payment.configs.clientCode
        dict["terminalCode"] = Payment.configs.terminalCode
        dict["serviceCode"] = Payment.configs.serviceCode
        dict["returnUrl"] = Payment.configs.returnUrl
        dict["cancelUrl"] = Payment.configs.cancelUrl
        dict["partnerCode"] = partnerCode
        dict["bankCode"] = bankCode
        dict["methodCode"] = methodCode
        dict["clientTransactionCode"] = UUID().uuidString.lowercased()
        dict["orderId"] = order.orderId
        dict["orderCode"] = order.orderCode
        dict["orderDescription"] = order.orderDescription
        dict["amount"] = order.amount
        dict["clientRequestTime"] = DateUtils.toString(date: Date())
        dict["checksum"] = MD5Encryptor.encrypt(text: Payment.configs.secretKey + dict.stringify)
        return dict
    }
}

class BaseStrategy: PaymentStrategy {
    
    var partnerCode: String
    var methodCode: String
    var bankCode: String
    
    init(methodCode: String, bankCode: String, partnerCode: String) {
        self.methodCode = methodCode
        self.bankCode = bankCode
        self.partnerCode = partnerCode
    }
    
    func process(service: PaymentService,
                 order: OrderObject,
                 onSuccess: @escaping (PaymentEvent) -> (),
                 onError: @escaping (PSError) -> ()) {}
    
}

class VNPay: BaseStrategy {
    
    override
    func process(service: PaymentService, order: OrderObject,
                 onSuccess: @escaping (PaymentEvent) -> (), onError: @escaping (PSError) -> ()) {
        service.generateQR(payload: generatePayload(order: order),
                           onSuccess: { tran in onSuccess(.transactionCreated(tran)) },
                           onError: { error in onError(error) })
    }
    
}

class PayGate: BaseStrategy {
    
    override
    func process(service: PaymentService, order: OrderObject,
                 onSuccess: @escaping (PaymentEvent) -> (), onError: @escaping (PSError) -> ()) {
        service.generateQR(payload: generatePayload(order: order),
                           onSuccess: { tran in onSuccess(.transactionCreated(tran)) },
                           onError: { error in onError(error) })
    }
    
}

class TPay: BaseStrategy {
    
    override
    func process(service: PaymentService, order: OrderObject,
                 onSuccess: @escaping (PaymentEvent) -> (), onError: @escaping (PSError) -> ()) {
        service.generateQR(payload: generatePayload(order: order),
                           onSuccess: { tran in onSuccess(.transactionCreated(tran)) },
                           onError: { error in onError(error) })
    }
    
    
}

class TPayConfirm: BaseStrategy {
    
    override
    func process(service: PaymentService, order: OrderObject,
                 onSuccess: @escaping (PaymentEvent) -> (), onError: @escaping (PSError) -> ()) {
        service.generateQR(payload: generatePayload(order: order),
                           onSuccess: { tran in onSuccess(.transactionCreated(tran)) },
                           onError: { error in onError(error) })
    }
    
    
}
