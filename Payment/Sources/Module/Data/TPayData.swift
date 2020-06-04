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

public class TPayConfirmResponse: Decodable {
    public var code: Int?
    public var success: Bool?
    public var message: String?
    public var data: PaymentTPayConfirmData?
    public var error: PaymentTPayError?
}

public struct PaymentTPayConfirmData: Decodable {
    public var psTransactionCode: String?
    public var amount: Double = 0
}

public struct PaymentTPayError: Decodable {
    private var code: String?
    public var message: String?
    public var phone: String?
    
    public var errorCode: TPayErrorCode? {
        return TPayErrorCode(code: code)
    }
}

public enum TPayErrorCode: String {
    case overtimes          = "502"
    case requiredOTP        = "503"
    case wrongOTP           = "504"
    case expiredOTP         = "505"
    case notEnoughMoney     = "506"
    case failed             = "499"
    case processingWithOM   = "878"
    case other              = "999"
    
    public init?(code: String?) {
        guard let code = code else { return nil }
        if let error = TPayErrorCode(rawValue: code) {
            self = error
        } else {
            self = .other
        }
    }
}
