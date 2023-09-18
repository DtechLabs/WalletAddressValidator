//
// CryptographyError.swift
// CryptoAddressValidator
//
// Using Swift 5.0
// Created by Yury Dryhin on 17.09.2023
// email: yuri.drigin@icloud.com
// LinkedIn: https://www.linkedin.com/in/dtechlabs/
// Copyright © 2023  DTechLabs. All rights reserved.
//
        

import Foundation

enum CryptographyError: Error {
    
    case nonBase58Character
    case hashingError
    
}
