//
//  PaymentTransaction.swift
//  PaymentSDK
//
//  Created by Tung Nguyen on 5/20/20.
//

import Foundation

public struct PaymentTransaction {
    public var amount: Double?
    public var message: String?
    public var ref: String?
    public var status: String?
    public var transactionId: String?
    
    public var isSuccess: Bool {
        return status == "000"
    }
    
    init(fromDict dict: NSDictionary) {
        self.amount = dict["amount"] as? Double
        self.message = dict["message"] as? String
        self.ref = dict["ref"] as? String
        self.status = dict["status"] as? String
        self.transactionId = dict["transaction_id"] as? String
    }
}
