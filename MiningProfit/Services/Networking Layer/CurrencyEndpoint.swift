//
//  CurrencyEndpoint.swift
//  MiningProfit
//
//  Created by Alexandr Rodionov on 28.08.22.
//

// Пример нашего запроса
// https://www.coincalculators.io/api?hashrate=100000000&power=230&powercost=0.1&difficultytime=6&algorithm=Ethash
// https://www.coincalculators.io/api?name=ethereum&hashrate=40000000&power=230&poolfee=0&powercost=0.1&difficultytime=6

import Foundation

enum CurrencyEndpoint: Endpoint {
    
case fetchAllCurrencies(hashrate: Int = 100000000, power: Int = 230, powerCost: Double = 0.1, difficultyTime: Int = 6, algorithm: String = "Ethash")
case fetchSpecificCurrency(currencyName: String = "ethereum", hashrate: Int = 40000000, power: Int = 230, poolFee: Int = 0, powerCost: Double = 0.1, difficultyTime: Int = 6)
    
    var scheme: String {
        return "https"
    }
    
    var baseUrl: String {
        return "www.coincalculators.io"
    }
    
    var path: String {
        return "/api"
    }
    
    var parameters: [URLQueryItem] {
        switch self {

        case .fetchAllCurrencies(hashrate: let hashrate, power: let power, powerCost: let powerCost, difficultyTime: let difficultyTime, algorithm: let algorithm):
            return [URLQueryItem(name: "hashrate", value: "\(hashrate)"),
                    URLQueryItem(name: "power", value: "\(power)"),
                    URLQueryItem(name: "powercost", value: "\(powerCost)"),
                    URLQueryItem(name: "difficultytime", value: "\(difficultyTime)"),
                    URLQueryItem(name: "algorithm", value: "\(algorithm)")]

        case .fetchSpecificCurrency(currencyName: let currencyName, hashrate: let hashrate, power: let power, poolFee: let poolFee, powerCost: let powerCost, difficultyTime: let difficultyTime):
            return [URLQueryItem(name: "name", value: "\(currencyName)"),
                    URLQueryItem(name: "hashrate", value: "\(hashrate)"),
                    URLQueryItem(name: "power", value: "\(power)"),
                    URLQueryItem(name: "poolfee", value: "\(poolFee)"),
                    URLQueryItem(name: "powercost", value: "\(powerCost)"),
                    URLQueryItem(name: "difficultytime", value: "\(difficultyTime)")]
        }
    }
    
    var method: String {
        return "GET"
    }
    
    var headers: [String : String] {
        return [:]
    }
    
    var body: [String : Any]? {
        return [:]
    }
    
    
}

//
//case .fetchFriends(offset: let offset):
//    return  [URLQueryItem(name: "user_id", value: "\(Session.shared.userId ?? 0)"),
//             URLQueryItem(name: "order", value: "random"),
//             URLQueryItem(name: "count", value: "20"),
//             URLQueryItem(name: "fields", value: "online, city, photo_100, country, contacts, bdate"),
//             URLQueryItem(name: "offset", value: "\(offset)"),
//             URLQueryItem(name: "access_token", value: Session.shared.token),
//             URLQueryItem(name: "v", value: "5.131")]
