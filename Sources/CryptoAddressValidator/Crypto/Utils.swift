//
// Utils.swift
// CryptoAddressValidator
//
// Using Swift 5.0
// Created by Yury Dryhin on 17.09.2023
// email: yuri.drigin@icloud.com
// LinkedIn: https://www.linkedin.com/in/dtechlabs/
// Copyright © 2023  DTechLabs. All rights reserved.
//
        
import Foundation
import CryptoSwift
import CryptoKit

enum Utils {
    
    static func sha256Checksum(_ data: [UInt8]) -> [UInt8] {
        data.sha256().sha256().prefix(4).map { $0 }
    }
    
    static func keccak256Checksum(_ data: [UInt8]) -> [UInt8] {
        data.sha3(.keccak256).prefix(4).map { $0 }
    }
    
    static func blake256Checksum(_ data: [UInt8]) throws -> [UInt8] {
        try data.blake2b256().blake2b256().prefix(4).map { $0 }
    }
    
    
    
}
