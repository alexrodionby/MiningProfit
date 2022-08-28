//
//  Endpoint.swift
//  MiningProfit
//
//  Created by Alexandr Rodionov on 28.08.22.
//

// Пример нашего запроса
// https://www.coincalculators.io/api?hashrate=100000000&power=230&powercost=0.1&difficultytime=6&algorithm=Ethash
// https://www.coincalculators.io/api?name=ethereum&hashrate=40000000&power=230&poolfee=0&powercost=0.1&difficultytime=6

import Foundation

protocol Endpoint {
    
    // https
    var scheme: String { get }
    
    // coincalculators.io
    var baseUrl: String { get }
    
    // /api
    var path: String { get }
    
    // parameters
    var parameters: [URLQueryItem] { get }
    
    // GET
    var method: String { get }
    
    // headers
    var headers: [String: String] { get }
    
    // body
    var body: [String: Any]? { get }
    
}
