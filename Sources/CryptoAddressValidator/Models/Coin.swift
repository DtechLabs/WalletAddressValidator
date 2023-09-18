//
// Coin.swift
// CryptoAddressValidator.self
//
// Using Swift 5.0
// Created by Yury Dryhin on 17.09.2023
// email: yuri.drigin@icloud.com
// LinkedIn: https://www.linkedin.com/in/dtechlabs/
// Copyright © 2023  DTechLabs. All rights reserved.
//
        
import Foundation

public struct Coin {

    public let name: String
    public let symbol: String
    
    var hashFunction: BlockchainHashFunction?
    var expectedLength: Int?
    public var regex: String?
    var addressTypes: [NetworkType: [String]]?
    var iAddressTypes: [NetworkType: [String]]?
    var bech32Hrp: [NetworkType: [String]]?
    let validator: CoinAddressValidator.Type
    var maxLength: Int?
    var minLength: Int?
    
}

let COINS = [
    Coin(
        name: "Bitcoin",
        symbol: "btc",
        addressTypes: [.mainnet: ["00", "05"], .testnet: ["6f", "c4", "3c", "26"]],
        bech32Hrp: [.mainnet: ["bc"], .testnet: ["tb"]],
        validator: BitcoinAddressValidator.self.self
    ),
    Coin(
        name: "BitcoinCash",
        symbol: "bch",
        regex: "^[qQpP]{1}[0-9a-zA-Z]{41}$",
        addressTypes: [.mainnet: ["00", "05"], .testnet: ["6f", "c4"]],
        validator: BCHAddressValidator.self
    ),
    Coin(
        name: "Bitcoin SV",
        symbol: "bsv",
        regex: "^[qQ]{1}[0-9a-zA-Z]{41}$",
        addressTypes: [.mainnet: ["00", "05"], .testnet: ["6f", "c4"]],
        validator: BCHAddressValidator.self
    ),
    Coin(
        name: "LiteCoin",
        symbol: "ltc",
        addressTypes: [.mainnet: ["30", "05", "32"], .testnet: ["6f", "c4", "3a"]],
        bech32Hrp: [.mainnet: ["ltc"], .testnet: ["tltc"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "PeerCoin",
        symbol: "ppc",
        addressTypes: [.mainnet: ["37", "75"], .testnet: ["6f", "c4"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "DogeCoin",
        symbol: "doge",
        addressTypes: [.mainnet: ["1e", "16"], .testnet: ["71", "c4"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "BeaverCoin",
        symbol: "bvc",
        addressTypes: [.mainnet: ["19", "05"], .testnet: ["6f", "c4"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "FreiCoin",
        symbol: "frc",
        addressTypes: [.mainnet: ["00", "05"], .testnet: ["6f", "c4"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "ProtoShares",
        symbol: "pts",
        addressTypes: [.mainnet: ["38", "05"], .testnet: ["6f", "c4"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "MegaCoin",
        symbol: "mec",
        addressTypes: [.mainnet: ["32", "05"], .testnet: ["6f", "c4"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "PrimeCoin",
        symbol: "xpm",
        addressTypes: [.mainnet: ["17", "53"], .testnet: ["6f", "c4"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "AuroraCoin",
        symbol: "aur",
        addressTypes: [.mainnet: ["17", "05"], .testnet: ["6f", "c4"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "NameCoin",
        symbol: "nmc",
        addressTypes: [.mainnet: ["34"], .testnet: []],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "BioCoin",
        symbol: "bio",
        addressTypes: [.mainnet: ["19", "14"], .testnet: ["6f", "c4"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "GarliCoin",
        symbol: "grlc",
        addressTypes: [.mainnet: ["26", "05"], .testnet: ["6f", "c4"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "VertCoin",
        symbol: "vtc",
        addressTypes: [.mainnet: ["", "47", "71", "05"], .testnet: ["6f", "c4"]],
        bech32Hrp: [.mainnet: ["vtc"], .testnet: ["tvtc"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "BitcoinGold",
        symbol: "btg",
        addressTypes: [.mainnet: ["26", "17"], .testnet: ["6f", "c4"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "Komodo",
        symbol: "kmd",
        addressTypes: [.mainnet: ["3c", "55"], .testnet: ["0", "5"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "BitcoinZ",
        symbol: "btcz",
        expectedLength: 26,
        addressTypes: [.mainnet: ["1cb8", "1cbd"], .testnet: ["1d25", "1cba"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "BitcoinPrivate",
        symbol: "btcp",
        expectedLength: 26,
        addressTypes: [.mainnet: ["1325", "13af"], .testnet: ["1957", "19e0"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "Hush",
        symbol: "hush",
        expectedLength: 26,
        addressTypes: [.mainnet: ["1cb8", "1cbd"], .testnet: ["1d25", "1cba"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "SnowGem",
        symbol: "sng",
        expectedLength: 26,
        addressTypes: [.mainnet: ["1c28", "1c2d"], .testnet: ["1d25", "1cba"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "ZCash",
        symbol: "zec",
        expectedLength: 26,
        addressTypes: [.mainnet: ["1cb8", "1cbd"], .testnet: ["1d25", "1cba"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "ZClassic",
        symbol: "zcl",
        expectedLength: 26,
        addressTypes: [.mainnet: ["1cb8", "1cbd"], .testnet: ["1d25", "1cba"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "ZenCash",
        symbol: "zen",
        expectedLength: 26,
        addressTypes: [.mainnet: ["2089", "2096"], .testnet: ["2092", "2098"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "VoteCoin",
        symbol: "vot",
        expectedLength: 26,
        addressTypes: [.mainnet: ["1cb8", "1cbd"], .testnet: ["1d25", "1cba"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "Decred",
        symbol: "dcr",
        hashFunction: .blake256,
        expectedLength: 26,
        addressTypes: [.mainnet: ["073f", "071a"], .testnet: ["0f21", "0efc"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "GameCredits",
        symbol: "game",
        addressTypes: [.mainnet: ["26", "05"], .testnet: []],
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "PIVX",
        symbol: "pivx",
        addressTypes: [.mainnet: ["1e", "0d"], .testnet: []],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "SolarCoin",
        symbol: "slr",
        addressTypes: [.mainnet: ["12", "05"], .testnet: []],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "MonaCoin",
        symbol: "mona",
        addressTypes: [.mainnet: ["32", "37"], .testnet: []],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "DigiByte",
        symbol: "dgb",
        addressTypes: [.mainnet: ["1e", "3f"], .testnet: []],
        bech32Hrp: [.mainnet: ["dgb", "S"], .testnet: []],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "Tether",
        symbol: "usdt",
        addressTypes: [.mainnet: ["00", "05"], .testnet: ["6f", "c4"]],
        validator: USDTAddressValidator.self
    ),
    Coin(
        name: "Ripple",
        symbol: "xrp",
        validator: XRPAddressValidator.self
    ),
    Coin(
        name: "Dash",
        symbol: "dash",
        addressTypes: [.mainnet: ["4c", "10"], .testnet: ["8c", "13"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "Neo",
        symbol: "neo",
        addressTypes: [.mainnet: ["17"], .testnet: []],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "NeoGas",
        symbol: "gas",
        addressTypes: [.mainnet: ["17"], .testnet: []],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "Qtum",
        symbol: "qtum",
        addressTypes: [.mainnet: ["3a", "32"], .testnet: ["78", "6e"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "Waves",
        symbol: "waves",
        hashFunction: .blake256keccak256,
        expectedLength: 26,
        regex: "^[a-zA-Z0-9]{35}$",
        addressTypes: [.mainnet: ["0157"], .testnet: ["0154"]],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "Ethereum",
        symbol: "eth",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "EthereumPow",
        symbol: "ethw",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "EtherZero",
        symbol: "etz",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "EthereumClassic",
        symbol: "etc",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Callisto",
        symbol: "clo",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Bankex",
        symbol: "bkx",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Cardano",
        symbol: "ada",
        bech32Hrp: [.mainnet: ["addr"], .testnet: ["addr"]],
        validator: ADAAddressValidator.self
    ),
    Coin(
        name: "Aragon",
        symbol: "ant",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Basic Attention Token",
        symbol: "bat",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Bancor",
        symbol: "bnt",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Civic",
        symbol: "cvc",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "District0x",
        symbol: "dnt",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Gnosis",
        symbol: "gno",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Golem (GNT)",
        symbol: "gnt",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Golem",
        symbol: "glm",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Matchpool",
        symbol: "gup",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Melon",
        symbol: "mln",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Numeraire",
        symbol: "nmr",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "OmiseGO",
        symbol: "omg",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "TenX",
        symbol: "pay",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Ripio Credit Network",
        symbol: "rcn",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Augur",
        symbol: "rep",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "iExec RLC",
        symbol: "rlc",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Salt",
        symbol: "salt",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Status",
        symbol: "snt",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Storj",
        symbol: "storj",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Swarm City",
        symbol: "swt",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "TrueUSD",
        symbol: "tusd",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Wings",
        symbol: "wings",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "",
        symbol: "zrx",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Expanse",
        symbol: "exp",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Viberate",
        symbol: "vib",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Odyssey",
        symbol: "ocn",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Polymath",
        symbol: "poly",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Storm",
        symbol: "storm",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Nano",
        symbol: "nano",
        validator: NANOAddressValidator.self
    ),
    Coin(
        name: "RaiBlocks",
        symbol: "xrb",
        validator: NANOAddressValidator.self
    ),
    Coin(
        name: "Siacoin",
        symbol: "sc",
        validator: SCAddressValidator.self
    ),
    Coin(
        name: "HyperSpace",
        symbol: "xsc",
        validator: SCAddressValidator.self
    ),
    Coin(
        name: "loki",
        symbol: "loki",
        addressTypes: [.mainnet: ["114", "115", "116"], .testnet: []],
        iAddressTypes: [.mainnet: ["115"], .testnet: []],
        validator: XMRAddressValidator.self
    ),
    Coin(
        name: "LBRY Credits",
        symbol: "lbc",
        addressTypes: [.mainnet: ["55"], .testnet: []],
        validator: BitcoinAddressValidator.self
    ),
    Coin(
        name: "Tron",
        symbol: "trx",
        addressTypes: [.mainnet: ["41"], .testnet: ["a0"]],
        validator: TRXAddressValidator.self
    ),
    Coin(
        name: "Nem",
        symbol: "xem",
        validator: NEMAddressValidator.self
    ),
    Coin(
        name: "Lisk",
        symbol: "lsk",
        validator: LSKAddressValidator.self
    ),
    Coin(
        name: "Stellar",
        symbol: "xlm",
        validator: XLMAddressValidator.self
    ),
    Coin(
        name: "BTU Protocol",
        symbol: "btu",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Crypto.com Coin",
        symbol: "cro",
        bech32Hrp: [.mainnet: ["cro"], .testnet: ["tcro"]],
        validator: BIP173AddressValidator.self
    ),
    Coin(
        name: "Multi-collateral DAI",
        symbol: "dai",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Enjin Coin",
        symbol: "enj",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "HedgeTrade",
        symbol: "hedg",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Cred",
        symbol: "lba",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Chainlink",
        symbol: "link",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Loom Network",
        symbol: "loom",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Maker",
        symbol: "mkr",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Metal",
        symbol: "mtl",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Ocean Protocol",
        symbol: "ocean",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Quant",
        symbol: "qnt",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Synthetix Network",
        symbol: "snx",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "SOLVE",
        symbol: "solve",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Spendcoin",
        symbol: "spnd",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "TEMCO",
        symbol: "temco",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "EOS",
        symbol: "eos",
        validator: EOSAddressValidator.self
    ),
    Coin(
        name: "Tezos",
        symbol: "xtz",
        validator: XTZAddressValidator.self
    ),
    Coin(
        name: "VeChain",
        symbol: "vet",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "StormX",
        symbol: "stmx",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "AugurV2",
        symbol: "repv2",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "FirmaChain",
        symbol: "fct",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "BlockTrade",
        symbol: "btt",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Quantum Resistant Ledger",
        symbol: "qrl",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Serve",
        symbol: "serv",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Tap",
        symbol: "xtp",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Compound",
        symbol: "comp",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Paxos",
        symbol: "pax",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "USD Coin",
        symbol: "usdc",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "CUSD",
        symbol: "cusd",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Algorand",
        symbol: "algo",
        validator: AlgoAddressValidator.self
    ),
    Coin(
        name: "Polkadot",
        symbol: "dot",
        validator: DotAddressValidator.self
    ),
    Coin(
        name: "Uniswap Coin",
        symbol: "uni",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Aave Coin",
        symbol: "aave",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Matic",
        symbol: "matic",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Decentraland",
        symbol: "mana",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Solana",
        symbol: "sol",
        validator: Base58AddressValidator.self,
        maxLength: 44,
        minLength: 43
    ),
    Coin(
        name: "Binance",
        symbol: "bnb",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Avalanche",
        symbol: "avax",
        validator: ETHAddressValidator.self
    ),
    Coin(
        name: "Flare",
        symbol: "flr",
        validator: ETHAddressValidator.self
    )
]
