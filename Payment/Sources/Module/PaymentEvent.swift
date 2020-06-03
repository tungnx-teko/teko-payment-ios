//
//  PaymentEvent.swift
//  PaymentSDK
//
//  Created by Tung Nguyen on 5/20/20.
//

import Foundation

public enum PaymentEvent {
    case transactionCreated(_ transaction: Transaction)
    case qrGenerated(_ transaction: Transaction)
    case tpayCreated(_ data: TPayTransaction)
}
