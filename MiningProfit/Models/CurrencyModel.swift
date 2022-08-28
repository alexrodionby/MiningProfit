//
//  CurrencyModel.swift
//  MiningProfit
//
//  Created by Alexandr Rodionov on 28.08.22.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let allCurrencies = try? newJSONDecoder().decode(AllCurrencies.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.allCurrencyTask(with: url) { allCurrency, response, error in
//     if let allCurrency = allCurrency {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - AllCurrency
struct AllCurrencys: Codable {
    let name: String?
    let tag: JSONNull?
    let algorithm, image: String?
    let blockTime, blockReward: Double?
    let lastBlock: Int?
    let priceUsd, priceBtc, highestBid, lowestAsk: Double?
    let volumeUsd, totalSupply: Double?
    let marketCapUSD, percentChange1H: Int?
    let percentChange24H: Double?
    let percentChange7D: Int?
    let symbol: String?
    let nethash24, nethash6, nethash3, currentNethash: Double?
    let difficulty24, difficulty6, difficulty3, currentDifficulty: Double?
    let powerWatt, kWhPriceUSD: Int?
    let rewardsInHour, rewardsInDay, rewardsInWeek, rewardsInMonth: Double?
    let rewardsInYear, revenueInHourUSD, revenueInDayUSD, revenueInWeekUSD: Double?
    let revenueInMonthUSD, revenueInYearUSD, profitInHourUSD, profitInDayUSD: Double?
    let profitInWeekUSD, profitInMonthUSD, profitInYearUSD: Double?
    let yourHashrate: Int?
    let exchanges: [Exchange]?
    let deactive: Bool?
    let lastUpdate: Int?

    enum CodingKeys: String, CodingKey {
        case name, tag, algorithm, image, blockTime, blockReward, lastBlock
        case priceUsd = "price_usd"
        case priceBtc = "price_btc"
        case highestBid, lowestAsk
        case volumeUsd = "volume_usd"
        case totalSupply, marketCapUSD
        case percentChange1H = "percentChange_1h"
        case percentChange24H = "percentChange_24h"
        case percentChange7D = "percentChange_7d"
        case symbol, nethash24, nethash6, nethash3, currentNethash, difficulty24, difficulty6, difficulty3, currentDifficulty, powerWatt, kWhPriceUSD, rewardsInHour, rewardsInDay, rewardsInWeek, rewardsInMonth, rewardsInYear, revenueInHourUSD, revenueInDayUSD, revenueInWeekUSD, revenueInMonthUSD, revenueInYearUSD, profitInHourUSD, profitInDayUSD, profitInWeekUSD, profitInMonthUSD, profitInYearUSD, yourHashrate, exchanges, deactive, lastUpdate
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.exchangeTask(with: url) { exchange, response, error in
//     if let exchange = exchange {
//       ...
//     }
//   }
//   task.resume()


struct BaseResponse<T: Codable>: Codable {
    let response: T
}

// MARK: - Exchange
struct Exchange: Codable {
    let name: Name?
    let base: Base?
    let quote: String?
    let price, priceInBase, volume, change: Double?
    let buyPrice, sellPrice: Double?
    let lastUpdate: Int?

    enum CodingKeys: String, CodingKey {
        case name, base, quote, price
        case priceInBase = "price_in_base"
        case volume, change, buyPrice, sellPrice, lastUpdate
    }
}

enum Base: String, Codable {
    case btc = "BTC"
    case eth = "ETH"
    case ltc = "LTC"
    case usd = "USD"
    case usdc = "USDC"
    case usdt = "USDT"
}

enum Name: String, Codable {
    case abcc = "ABCC"
    case bibox = "Bibox"
    case binance = "Binance"
    case bitrue = "Bitrue"
    case bittrex = "Bittrex"
    case btcAlpha = "Btc-Alpha"
    case coinTiger = "CoinTiger"
    case crex24 = "Crex24"
    case exmo = "Exmo"
    case gateIo = "Gate.io"
    case graviex = "Graviex"
    case hitbtc = "Hitbtc"
    case kucoin = "Kucoin"
    case poloniex = "Poloniex"
    case safeTrade = "Safe.trade"
    case southXchange = "SouthXchange"
    case stex = "Stex"
    case tokok = "Tokok"
    case tradeogre = "Tradeogre"
}

typealias AllCurrencies = [AllCurrencys]

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func allCurrenciesTask(with url: URL, completionHandler: @escaping (AllCurrencies?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
