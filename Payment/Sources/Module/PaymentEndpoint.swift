//
//  PaymentEndpoint.swift
//  PaymentSDK
//
//  Created by Tung Nguyen on 5/20/20.
//

import Foundation
import Networking

typealias Payload = [String: Any]

enum PaymentEndpoint {
    case generateQR(payload: Payload)
    case createTransaction(payload: Payload)
    case createTpayTransaction(payload: Payload)
    case confirmTpay(payload: Payload)
}

extension PaymentEndpoint: EndPointType {
    
    var baseURL: URL {
        return URL(string: Payment.configs.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .generateQR:
            return "/transactions/genqr"
        case .createTransaction:
            return "/transactions/pay"
        case .createTpayTransaction:
            return "/transactions/tpay"
        case .confirmTpay:
            return "/transactions/confirm"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .post
    }
    
    var task: HTTPTask {
        switch self {
        case .generateQR(let payload), .createTpayTransaction(let payload), .confirmTpay(let payload):
            print(payload)
            return .requestParametersAndHeaders(bodyParameters: payload,
                                                bodyEncoding: .jsonEncoding,
                                                urlParameters: nil,
                                                additionHeaders: headers)
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        let headers = ["Content-Type": "application/json", "Accept": "application/json", "Authorization": Payment.token]
        return headers
    }
    
}
