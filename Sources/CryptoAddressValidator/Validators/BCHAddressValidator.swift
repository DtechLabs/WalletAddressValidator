//
// BCHValidator.swift
// CryptoAddressValidator
//
// Using Swift 5.0
// Created by Yury Dryhin on 18.09.2023
// email: yuri.drigin@icloud.com
// LinkedIn: https://www.linkedin.com/in/dtechlabs/
// Copyright © 2023  DTechLabs. All rights reserved.
//
        
import Foundation
import Base32

struct BCHAddressValidator: CoinAddressValidator {
    
    static func isValid(_ address: String, coin: Coin, network: NetworkType) throws -> Bool {
        let prefix = network == .testnet ? "bchtest" :  "bitcoincash"
        let rawAddress = address.hasPrefix("bitcoincash:") ? String(address.dropFirst(12)) : address
        
        if !address.hasPrefix(prefix) {
            // Validate as bitcoin
            let addressTypes = try BitcoinAddressValidator.addressType(address, expectedLength: coin.expectedLength)
            
            guard let prefixes = coin.addressTypes?[network] else {
                throw CryptoAddressValidatorError.missedAddressPrefix
            }
            
            return prefixes.contains(addressTypes)
        }
        
        if let regexStr = coin.regex {
            let regex = try Regex(regexStr)
            
            guard rawAddress.wholeMatch(of: regex) != nil else {
                return false
            }
        }

        var decoder = Base32Decoder()
        decoder.decode(rawAddress)
        let decoded = decoder.finalize() as [UInt8]
        return Bech32.verifyChecksum(humanReadablePart: prefix, data: Data(decoded))
    }
    
}
