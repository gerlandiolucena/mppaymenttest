//
//  MPCardIssuersImpl.swift
//  MPPaymentSelection
//
//  Created by Gerlandio Da Silva Lucena on 14/07/2018.
//  Copyright © 2018 GerlandioLucena. All rights reserved.
//

import Foundation
import Moya

typealias MPCardIssuersCallbackFunction = (Result<[MPCardIssuer]>) -> Void

class MPCardIssuersImpl: NSObject {
    
    func fetchCardIssuers(paymentMethod: String, _ callback: @escaping MPCardIssuersCallbackFunction) {
        let repositoriesProvider = MoyaProvider<MPRepositorieService>()
        
        repositoriesProvider.request(.fetchCardIssuers(paymentMethod: paymentMethod)) { (result) in
            switch result {
            case .success(let successResult):
                do {
                    let jsonDecoder = JSONDecoder()
                    let response = try jsonDecoder.decode([MPCardIssuer].self, from: successResult.data)
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
