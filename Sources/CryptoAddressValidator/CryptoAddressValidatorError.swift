//
// CryptoAddressValidatorError.swift
// CryptoAddressValidator
//
// Using Swift 5.0
// Created by Yury Dryhin on 16.09.2023
// email: yuri.drigin@icloud.com
// LinkedIn: https://www.linkedin.com/in/dtechlabs/
// Copyright © 2023  DTechLabs. All rights reserved.
//

import Foundation

enum CryptoAddressValidatorError: Error {
    
    case unsupportedBlockchain
    case invalidAddress
    case addressType
    case addressLength
    case missedAddressPrefix
    case unknownCoinSymbol
    
}
