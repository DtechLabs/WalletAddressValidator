//
// Chains.swift
// Package:  CryptoAddressValidator
//
// Created by Yury Dryhin on 16.09.2023
// email: yuri.drigin@icloud.com
// LinkedIn: https://www.linkedin.com/in/dtechlabs/
// Copyright © 2023  DTechLabs. All rights reserved.
//
        

import Foundation

extension CryptoAddressValidator {
    
    public enum Blockchain: Int {
        case Bitcoin = 0
        case Ethereum = 1
        case Vechain = 3
        case Tron = 4
        case Icon = 5
        case Binance = 6
        case Ripple = 7
        case Tezos = 8
        case Nimiq = 9
        case Stellar = 10
        case Aion = 11
        case Cosmos = 12
        case Theta = 13
        case Ontology = 14
        case Zilliqa = 15
        case IoTeX = 16
        case EOS = 17
        case Nano = 18
        case NULS = 19
        case Waves = 20
        case Aeternity = 21
        case Nebulas = 22
        case FIO = 23
        case Solana = 24
        case Harmony = 25
        case NEAR = 26
        case Algorand = 27
        case Polkadot = 29
        case Cardano = 30
        case NEO = 31
        case Filecoin = 32
        case MultiversX = 33
        case OasisNetwork = 34
        case Decred = 35 // Bitcoin
        case Zcash = 36 // Bitcoin
        case Groestlcoin = 37 // Bitcoin
        case Thorchain = 38 // Cosmos
        case Ronin = 39 // Ethereum
        case Kusama = 40 // Polkadot
        case Nervos = 41
        case Everscale = 42
        case Aptos = 43 // Aptos
        case Hedera = 44 // Hedera
        case TheOpenNetwork = 45
        case Sui = 46
        
        var validator: CoinAddressValidator.Type {
            switch self {
                case .Bitcoin: return BitcoinAddressValidator.self
                case .Ethereum: return ETHAddressValidator.self
                case .Tron: return TRXAddressValidator.self
                default:
                    return BitcoinAddressValidator.self
            }
        }
    }
}


