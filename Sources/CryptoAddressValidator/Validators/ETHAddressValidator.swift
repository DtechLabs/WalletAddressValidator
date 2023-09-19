//
// ETHAddressValidator.swift
// CryptoAddressValidator
//
// Using Swift 5.0
// Created by Yury Dryhin on 16.09.2023
// email: yuri.drigin@icloud.com
// LinkedIn: https://www.linkedin.com/in/dtechlabs/
// Copyright © 2023  DTechLabs. All rights reserved.
//
        
import Foundation
import CryptoSwift

struct ETHAddressValidator: CoinAddressValidator {
    
    static func isValid(_ address: String, coin: Coin, network: NetworkType = .mainnet) throws -> Bool {
        // Check if it has the basic requirements of an address
        let regex = try Regex("^0x[0-9a-fA-F]{40}$")
        guard address.wholeMatch(of: regex) != nil else {
            return false
        }
        
        // If it's all small caps or all all caps, return true
        let regexSmall = try Regex("^0x[0-9a-f]{40}$")
        let regexCaps = try Regex("^0x[0-9A-F]{40}$")
        
        if address.wholeMatch(of: regexSmall) != nil || address.wholeMatch(of: regexCaps) != nil {
            return true
        } else {
            return verifyChecksum(address)
        }
    }
    
    static func verifyChecksum(_ address: String) -> Bool {
        let address = address.hasPrefix("0x") ? String(address.dropFirst(2)) : address
        let addressHash = address.lowercased().bytes.sha3(.keccak256).toHexString()
        
        for i in 0..<40 {
            let hashCharacter = addressHash[addressHash.index(addressHash.startIndex, offsetBy: i)]
            let addressCharacter = address[address.index(address.startIndex, offsetBy: i)]
            
            if (Int(String(hashCharacter), radix: 16) ?? 0 > 7 && addressCharacter.uppercased() != String(addressCharacter)) ||
                (Int(String(hashCharacter), radix: 16) ?? 0 <= 7 && addressCharacter.lowercased() != String(addressCharacter)) {
                return false
            }
        }
        
        return true
    }
    
}
