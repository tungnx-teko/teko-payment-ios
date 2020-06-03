//
//  PaymentError.swift
//  PaymentSDK
//
//  Created by Tung Nguyen on 5/20/20.
//

import Foundation

public enum PaymentError: Error {
    case missingClientCode
    case missingTerminalCode
    case missingServiceCode
    case missingSecretKey
    case databaseNotConfigured
    case missingToken
}
