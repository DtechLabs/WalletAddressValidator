//
// TRXAddressValidator.swift
// CryptoAddressValidator
//
// Using Swift 5.0
// Created by Yury Dryhin on 18.09.2023
// email: yuri.drigin@icloud.com
// LinkedIn: https://www.linkedin.com/in/dtechlabs/
// Copyright © 2023  DTechLabs. All rights reserved.
//
        

import Foundation

struct TRXAddressValidator: CoinAddressValidator {
    
    static func decodeBase58Address(_ source: String) -> String? {
        guard source.count > 4 else {
            return nil
        }

        var address = Base58.decode(source)

        let len = address.count
        let checkSum = address.suffix(4)
        address = address.dropLast(4)
        var hash0 = address.toHexString().sha256()
        var hash1 = hash0.sha256()
        var checkSum1 = hash1.hexBytes.prefix(4)
        guard checkSum == checkSum1 else {
            return nil
        }

        return address.toHexString()
    }
    
    static func isValid(_ address: String, coin: Coin, network: NetworkType) throws -> Bool {
        guard
            let address = decodeBase58Address(address),
            address.count == 21
        else {
            return false
        }
        
        if let prefix = coin.addressTypes?[network]?.first {
            return address.hasPrefix(prefix)
        } else {
            return true
        }
    }
    
}
