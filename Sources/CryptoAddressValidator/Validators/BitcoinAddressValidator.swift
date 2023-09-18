//
// BitcoinAddressValidator.swift
// CryptoAddressValidator
//
// Using Swift 5.0
// Created by Yury Dryhin on 17.09.2023
// email: yuri.drigin@icloud.com
// LinkedIn: https://www.linkedin.com/in/dtechlabs/
// Copyright © 2023  DTechLabs. All rights reserved.
//
import Foundation

struct BitcoinAddressValidator: CoinAddressValidator {
    
    static func addressType(_ address: String, expectedLength: Int?) throws -> String {
        let expectedLength = expectedLength ?? 25
        let decoded = Base58.decode(address)
        
        guard decoded.count == expectedLength else {
            throw CryptoAddressValidatorError.addressLength
        }
        
        return Data(decoded.prefix(expectedLength - 24)).toHexString()
    }

    static func addressType(_ address: String, coin: Coin) throws -> String {
        let expectedLength = coin.expectedLength ?? 25
        let hashFunction = coin.hashFunction ?? .sha256
        let decoded = Base58.decode(address)
        
        guard decoded.count == expectedLength else {
            throw CryptoAddressValidatorError.addressLength
        }
        
        if let regexStr = coin.regex {
            guard address.wholeMatch(of: try Regex(regexStr)) != nil else {
                throw CryptoAddressValidatorError.invalidAddress
            }
        }
        
        let checksum = Array(decoded.suffix(4))
        let body: [UInt8] = decoded.dropLast(4)
        let goodChecksum = try getChecksum(hashFunction, body)
        
        guard checksum == goodChecksum else {
            throw CryptoAddressValidatorError.invalidAddress
        }
        
        return Data(decoded.prefix(expectedLength - 24)).toHexString()
    }
    
    static func getChecksum(_ hashFunction: BlockchainHashFunction, _ payload: [UInt8]) throws -> [UInt8] {
        // Each currency may implement different hashing algorithm
        switch hashFunction {
            case .blake256keccak256:
                return try Utils.keccak256Checksum(payload.blake2b256().map { $0 })
            case .blake256:
                return try Utils.blake256Checksum(payload)
            case .keccak256:
                return Utils.keccak256Checksum(payload)
            case .sha256:
                fallthrough
            default:
                return Utils.sha256Checksum(payload)
        }
    }
    
    static func isValid(_ address: String, coin: Coin, network: NetworkType) throws -> Bool {
        let addressType = try addressType(address, coin: coin)
        guard let prefixes = coin.addressTypes?[network] else {
            throw CryptoAddressValidatorError.missedAddressPrefix
        }
        
        return prefixes.contains(addressType)
    }
    
}
