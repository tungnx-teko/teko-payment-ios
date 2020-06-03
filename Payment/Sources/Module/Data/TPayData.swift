//
//  TPayData.swift
//  PaymentSDK
//
//  Created by Tung Nguyen on 5/22/20.
//

import Foundation

public class TPayTransaction: Decodable {
    public var url: String?
    public var transactionCode: String?
    private var link: Int?
    
    public var isLinked: Bool {
        return link != nil && link != 0
    }
    
    enum CodingKeys: String, CodingKey {
        case url, link
        case transactionCode = "psTransactionCode"
    }
}
