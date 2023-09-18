//
// CryptoAddressValidator.swift
// CryptoAddressValidator
//
// Using Swift 5.0
// Created by Yury Dryhin on 18.09.2023
// email: yuri.drigin@icloud.com
// LinkedIn: https://www.linkedin.com/in/dtechlabs/
// Copyright © 2023  DTechLabs. All rights reserved.
//
        

import Foundation

public enum CryptoAddressValidator {
    
    public static func coin(withSymbol symbol: String) -> Coin? {
        COINS.first {
            symbol.caseInsensitiveCompare($0.symbol) == .orderedSame
        }
    }
    
    public static func coin(withName name: String) -> Coin? {
        COINS.first {
            name.caseInsensitiveCompare($0.name) == .orderedSame
        }
    }
    
    public static func coin(name: String, symbol: String) -> Coin? {
        COINS.first {
            name.caseInsensitiveCompare($0.name) == .orderedSame ||
            symbol.caseInsensitiveCompare($0.symbol) == .orderedSame
        }
    }

    public static func isValid(
        _ address: String,
        coin: Coin,
        network: NetworkType = .mainnet,
        blockchain: Blockchain? = nil
    ) throws -> Bool {
        if let blockchain = blockchain {
            return try blockchain.validator.isValid(address, coin: coin, network: network)
        } else {
            return try coin.validator.isValid(address, coin: coin, network: network)
        }
    }

    public static func isValid(_ address: String, symbol: String, network: NetworkType = .mainnet) throws -> Bool {
        guard let coin = coin(withSymbol: symbol) else {
            throw CryptoAddressValidatorError.unknownCoinSymbol
        }
        return try coin.validator.isValid(address, coin: coin, network: network)
    }
    
}
