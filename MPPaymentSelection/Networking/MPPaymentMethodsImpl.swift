//
//  MPPaymentMethodsImpl.swift
//  MPPaymentSelection
//
//  Created by Gerlandio Da Silva Lucena on 14/07/2018.
//  Copyright © 2018 GerlandioLucena. All rights reserved.
//

import Foundation
import Moya

typealias MPPaymentMethodsCallbackFunction = (Result<[MPPayment]>) -> Void

class MPPaymentMethodsImpl: NSObject {
    
    func fetchPaymentMethods(_ callback: @escaping MPPaymentMethodsCallbackFunction) {
        let repositoriesProvider = MoyaProvider<MPRepositorieService>()
        
        repositoriesProvider.request(.fetchPaymentMethods()) { (result) in
            switch result {
            case .success(let successResult):
                do {
                    let jsonDecoder = JSONDecoder()
                    let response = try jsonDecoder.decode([MPPayment].self, from: successResult.data)
                    callback(.success(response))
                } catch let error {
                    callback(.error(error.localizedDescription))
                }
            case .failure(let error):
                callback(.error(error.localizedDescription))
            }
        }
    }
}
