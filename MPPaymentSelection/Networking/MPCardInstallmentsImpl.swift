//
//  MPCardInstallmentsImpl.swift
//  MPPaymentSelection
//
//  Created by Gerlandio Da Silva Lucena on 14/07/2018.
//  Copyright © 2018 GerlandioLucena. All rights reserved.
//

import UIKit
import Moya

typealias MPCardInstallmentsCallbackFunction = (Result<[MPPaymentCost]>) -> Void

class MPCardInstallmentsImpl: NSObject {
    
    func fetchCardIssuers(amount: Double, paymentMethod: String, issuerId: String, _ callback: @escaping MPCardInstallmentsCallbackFunction) {
        let repositoriesProvider = MoyaProvider<MPRepositorieService>()
        
        repositoriesProvider.request(.fetchInstallments(amount: amount, paymentMethod: paymentMethod, issuerId: issuerId)) { (result) in
            switch result {
            case .success(let successResult):
                do {
                    let jsonDecoder = JSONDecoder()
                    let response = try jsonDecoder.decode([MPPaymentCost].self, from: successResult.data)
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
