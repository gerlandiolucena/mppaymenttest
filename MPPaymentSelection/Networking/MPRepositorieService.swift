//
//  MPRepositorieService.swift
//  MPPaymentSelection
//
//  Created by Gerlandio Da Silva Lucena on 14/07/2018.
//  Copyright © 2018 GerlandioLucena. All rights reserved.
//

import UIKit
import Moya

enum Result<T> {
    case success(T)
    case error(String)
}

enum MPRepositorieService {
    case fetchPaymentMethods()
    case fetchCardIssuers(paymentMethod: String)
    case fetchInstallments(amount: Double, paymentMethod: String, issuerId: String)
}

extension MPRepositorieService: TargetType {
    
    var baseURL: URL{ return URL(string:"https://api.mercadopago.com/")! }
    var publicKey: String { return "444a9ef5-8a6b-429f-abdf-587639155d88" }
    
    var method: Moya.Method {
        switch self {
        case .fetchPaymentMethods(), .fetchCardIssuers(_), .fetchInstallments(_, _ , _):
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .fetchPaymentMethods():
            return "v1/payment_methods"
        case .fetchCardIssuers(_):
            return "v1/payment_methods/card_issuers"
        case .fetchInstallments(_, _ , _):
            return "v1/payment_methods/installments"
        }
    }
    
    var task: Task {
        switch self {
        case .fetchPaymentMethods():
            return .requestParameters(parameters: ["public_key": publicKey], encoding: URLEncoding.queryString)
        case .fetchCardIssuers(let paymentMethod):
            return .requestParameters(parameters: ["public_key": publicKey, "payment_method_id": paymentMethod], encoding: URLEncoding.queryString)
        case .fetchInstallments(let amount, let paymentMethod, let issuerId):
            return .requestParameters(parameters: ["public_key": publicKey, "payment_method_id": paymentMethod, "amount": amount, "issuer.id": issuerId], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json",
                "Accept"      : "application/json"]
    }
    
    
    var sampleName: String {
        switch self {
        case .fetchPaymentMethods():
            return "paymentMethods"
        case .fetchCardIssuers(_):
            return "cardIssuers"
        case .fetchInstallments(_, _ , _):
            return "installments"
        }
    }
    
    var sampleData: Data {
        return sampleDataForRequest(sampleType: sampleName)
    }
    
    private func sampleDataForRequest(sampleType: String) -> Data {
        if let pathJson = Bundle.main.path(forResource:sampleType, ofType: "json") {
            let fileUrl = URL(fileURLWithPath: pathJson)
            if let jsonData = try? Data(contentsOf: fileUrl, options: .mappedIfSafe) {
                return jsonData
            }
        }
        return Data()
    }
}

