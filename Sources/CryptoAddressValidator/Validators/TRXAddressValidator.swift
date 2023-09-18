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
    
    static func decodeBase58Address(_ source: String) -> [UInt8]? {
        guard source.count > 4 else {
            return nil
        }

        var address = Base58.decode(source)

        let checkSum = Data(address.suffix(4))
        address = address.dropLast(4)
        let hash0 = Data(address).sha256()
        let hash1 = hash0.sha256()
        let checkSum1 = Data(hash1.prefix(4))
        guard checkSum == checkSum1 else {
            return nil
        }

        return address
    }
    
    static func isValid(_ address: String, coin: Coin, network: NetworkType) throws -> Bool {
        guard
            let address = decodeBase58Address(address),
            address.count == 21
        else {
            return false
        }
        
        if var prefix = coin.addressTypes?[network]?.first {
            return address.toHexString().hasPrefix(prefix)
        } else {
            return true
        }
    }
    
}
