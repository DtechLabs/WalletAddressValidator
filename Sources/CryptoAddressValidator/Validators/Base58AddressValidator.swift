//
// Base58AddressValidator.swift
// CryptoAddressValidator
//
// Using Swift 5.0
// Created by Yury Dryhin on 18.09.2023
// email: yuri.drigin@icloud.com
// LinkedIn: https://www.linkedin.com/in/dtechlabs/
// Copyright © 2023  DTechLabs. All rights reserved.
//
        

import Foundation

struct Base58AddressValidator: CoinAddressValidator {
    
    static func isValid(_ address: String, coin: Coin, network: NetworkType) throws -> Bool {
        guard !address.isEmpty else {
            return false
        }

        if let minLength = coin.minLength, address.count < minLength {
            return false
        }

        if let maxLength = coin.maxLength, address.count > maxLength {
            return false
        }
        
        let decoded = Base58.decode(address)
        return !decoded.isEmpty
    }
    
}
