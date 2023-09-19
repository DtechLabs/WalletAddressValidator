//
// USDTAddressValidator.swift
// CryptoAddressValidator
//
// Using Swift 5.0
// Created by Yury Dryhin on 18.09.2023
// email: yuri.drigin@icloud.com
// LinkedIn: https://www.linkedin.com/in/dtechlabs/
// Copyright © 2023  DTechLabs. All rights reserved.
//
        

import Foundation

struct USDTAddressValidator: CoinAddressValidator {
    
    static func isValid(_ address: String, coin: Coin, network: NetworkType) throws -> Bool {
        // Potentially there can be ERC20, TOR or omni
        if (try? ETHAddressValidator.isValid(address, coin: coin, network: network)) ?? false {
            return true
        } else {
            return try BitcoinAddressValidator.isValid(address, coin: coin, network: network)
        }
    }
    
}
