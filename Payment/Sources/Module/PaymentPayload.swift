//
//  PaymentPayload.swift
//  PaymentSDK
//
//  Created by Tung Nguyen on 5/20/20.
//

import Foundation

public class OrderObject {
    public var orderId: String
    public var orderCode: String
    public var orderDescription: String
    public var amount: Int
    
    public init(orderId: String, orderCode: String, orderDescription: String, amount: Int) {
        self.orderId = orderId
        self.orderCode = orderCode
        self.orderDescription = orderDescription
        self.amount = amount
    }
}
