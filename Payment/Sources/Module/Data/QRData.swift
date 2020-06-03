//
//  QRData.swift
//  PaymentSDK
//
//  Created by Tung Nguyen on 5/22/20.
//

import Foundation

public class Transaction: Decodable {
    public var transactionCode: String?
    public var qrContent: String?
    
    enum CodingKeys: String, CodingKey {
        case transactionCode = "psTransactionCode"
        case qrContent = "qrcontent"
    }
}
