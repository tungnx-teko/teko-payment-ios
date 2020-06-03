//
//  PaymentService.swift
//  PaymentSDK
//
//  Created by Tung Nguyen on 5/20/20.
//

import Foundation
import Networking

enum Result<T, V> {
    case success(T)
    case failed(V)
}

public class PaymentService {
    
    let router = Router<PaymentEndpoint>()
    
    func createTransaction(payload: Payload,
                    onSuccess: @escaping (Transaction) -> (),
                    onError: @escaping (PSError) -> ()) {
        router.request(.createTransaction(payload: payload), responseType: ApiResult<Transaction>.self) { (object, error) in
            if let object = object {
                let result = self.handleApiResult(object)
                switch result {
                case .success(let data):
                    onSuccess(data)
                case .failed(let error):
                    onError(error)
                }
            } else {
                onError(PSError(error?.rawValue ?? "Unexpected"))
            }
        }
    }
    
    func generateQR(payload: Payload,
                    onSuccess: @escaping (Transaction) -> (),
                    onError: @escaping (PSError) -> ()) {
        router.request(.generateQR(payload: payload), responseType: ApiResult<Transaction>.self) { (object, error) in
            if let object = object {
                let result = self.handleApiResult(object)
                switch result {
                case .success(let data):
                    onSuccess(data)
                case .failed(let error):
                    onError(error)
                }
            } else {
                onError(PSError(error?.rawValue ?? "Unexpected"))
            }
        }
    }
    
    private func handleApiResult<T>(_ result: ApiResult<T>) -> Result<T, PSError> {
        switch result.code {
        case 200:
            return result.data.map { .success($0) } ?? .failed(PSError("No Data"))
        default:
            return .failed(PSError(result.message))
        }
    }
    
}
