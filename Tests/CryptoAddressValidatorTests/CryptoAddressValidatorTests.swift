import XCTest
@testable import CryptoAddressValidator

final class CryptoAddressValidatorTests: XCTestCase {
    
    func throwError(_ address: String, coin: Coin, error: CryptoAddressValidatorError) {
        XCTAssertThrowsError(try CryptoAddressValidator.isValid(address, coin: coin)) { validationError in
            XCTAssertEqual(error, validationError as? CryptoAddressValidatorError)
        }
    }
    
    func valid(_ address: String, coin: Coin, network: NetworkType = .mainnet) {
        XCTAssertTrue(try CryptoAddressValidator.isValid(address, coin: coin, network: network))
    }
    
    func valid(_ address: String, symbol: String, network: NetworkType = .mainnet) {
        XCTAssertTrue(try CryptoAddressValidator.isValid(address, symbol: symbol, network: network))
    }
    
    func invalid(
        _ address: String,
        coin: Coin,
        network: NetworkType = .mainnet,
        blockchain: CryptoAddressValidator.Blockchain? = nil
    ) {
        XCTAssertFalse(
            try CryptoAddressValidator.isValid(address, coin: coin, network: network, blockchain: blockchain))
    }
    
    func invalid(_ address: String, symbol: String, network: NetworkType = .mainnet) {
        XCTAssertFalse(try CryptoAddressValidator.isValid(address, symbol: symbol, network: network))
    }
    
    func testFindCoin() {
        let coin = CryptoAddressValidator.coin(withSymbol: "xrp")
        XCTAssertNotNil(coin)
        XCTAssertEqual(coin?.name, "Ripple")
        XCTAssertEqual(coin?.symbol, "xrp")
        
        let usdt = CryptoAddressValidator.coin(withName: "Tether")
        XCTAssertNotNil(usdt)
        XCTAssertEqual(usdt?.name, "Tether")
        XCTAssertEqual(usdt?.symbol, "usdt")
    }
    
    
    
    func testBitcoinAddress() {
        let coin = CryptoAddressValidator.coin(withName: "Bitcoin")!
        
        XCTAssertTrue(try CryptoAddressValidator.isValid("12KYrjTdVGjFMtaxERSk3gphreJ5US8aUP", coin: coin))
        XCTAssertTrue(try CryptoAddressValidator.isValid("12QeMLzSrB8XH8FvEzPMVoRxVAzTr5XM2y", coin: coin))
        XCTAssertTrue(try CryptoAddressValidator.isValid("12QeMLzSrB8XH8FvEzPMVoRxVAzTr5XM2y", symbol: "BTC"))
        XCTAssertTrue(try CryptoAddressValidator.isValid("12QeMLzSrB8XH8FvEzPMVoRxVAzTr5XM2y", symbol: "btc"))
        XCTAssertTrue(try CryptoAddressValidator.isValid("15uwigGExiNQxTNr1QSZYPXJMp9Px2YnVU", coin: coin))
        XCTAssertTrue(try CryptoAddressValidator.isValid("3FyVFsEyyBPzHjD3qUEgX7Jsn4tcHNZFkn", coin: coin))
        XCTAssertTrue(try CryptoAddressValidator.isValid("38mKdURe1zcQyrFqRLzR8PRao3iLGEPVsU", coin: coin))
        XCTAssertTrue(try CryptoAddressValidator.isValid("1oNLrsHnBcR6dpaBpwz3LSwutbUNkNSjs", coin: coin))
        XCTAssertTrue(try CryptoAddressValidator.isValid("mzBc4XEFSdzCDcTxAgf6EZXgsZWpztRhef", coin: coin, network: .testnet))
        XCTAssertTrue(try CryptoAddressValidator.isValid("1HVDCg2KrPBH1Mg5SK9fGjAR9KVqyMMdBC", symbol: "BTC"))

        // p2sh addresses
        XCTAssertTrue(try CryptoAddressValidator.isValid("3NJZLcZEEYBpxYEUGewU4knsQRn1WM5Fkt", coin: coin))
        XCTAssertTrue(try CryptoAddressValidator.isValid("2MxKEf2su6FGAUfCEAHreGFQvEYrfYNHvL7", coin: coin, network: .testnet))

        // regtest
        valid("GSa5espVLNseXEfKt46zEdS6jrPkmFghBU", coin: coin, network: .testnet)

        // segwit addresses
//        valid("BC1QW508D6QEJXTDG4Y5R3ZARVARY0C5XW7KV8F3T4", coin: coin)
//        valid("bc1q2t63ewm3mvh0ztmnmezxm7s0tefknenxlrlwrk", coin: coin)

//        valid("tb1qrp33g0q5c5txsp9arysrx4k6zdkfs4nce4xj0gdcccefvpysxf3q0sl5k7", coin: coin, network: .testnet)
//        valid("tb1qqqqqp399et2xygdj5xreqhjjvcmzhxw4aywxecjdzew6hylgvsesrxh6hy", coin: coin, network: .testnet)

        throwError("bc1gmk9yu", coin: coin, error: .addressLength)
        throwError("tb1qrp33g0q5c5txsp9arysrx4k6zdkfs4nce4xj0gdcccefvpysxf3pjxtptv", coin: coin, error: .addressLength)
        throwError("bc1zw508d6qejxtdg4y5r3zarvaryvqyzf3du", coin: coin, error: .addressLength)
        throwError("BC1QR508D6QEJXTDG4Y5R3ZARVARYV98GJ9P", coin: coin, error: .addressLength)
        throwError("tc1qw508d6qejxtdg4y5r3zarvary0c5xw7kg3g4ty", coin: coin, error: .addressLength)
        throwError("bc1pw508d6qejxtdg4y5r3zarvary0c5xw7kw508d6qejxtdg4y5r3zarvary0c5xw7k7grplx", coin: coin, error: .addressLength)
        throwError("BC1SW50QA3JX3S", coin: coin, error: .addressLength)
        throwError("bc1zw508d6qejxtdg4y5r3zarvaryvg6kdaj", coin: coin, error: .addressLength)
        throwError("bc1qw508d6qejxtdg4y5r3zarvary0c5xw7kv8f3t5", coin: coin, error: .addressLength)
    }
    
    func testEthereum() throws {
        let eth = COINS.first(where: { $0.symbol == "eth" })!
        
        valid("0x7fA08353908cD70b4f64efD7884482D22B3ef144", coin: eth)
        XCTAssertTrue(try ETHAddressValidator.isValid("0x3404cd68aD5C2511980D4f33B4D0A1Bd5b21CA21", coin: eth))
        XCTAssertTrue(try ETHAddressValidator.isValid("0xb4A5897e1Ea52E5B3cbFa0d8D09b63a135B9FE75", coin: eth))
        XCTAssertTrue(try ETHAddressValidator.isValid("0x6eb27A009283bc70B7189819111105AF61eed630", coin: eth))
        XCTAssertTrue(try ETHAddressValidator.isValid("0xED7b9C6a4eF2a7338F8CE174774Cbffd03DA9e7d", coin: eth))
        
        XCTAssertFalse(try ETHAddressValidator.isValid("vitalik", coin: eth))
    }
    
    func testBitcoinCache() throws {
        let BCH = CryptoAddressValidator.coin(withName: "bitcoincash")!
        let BTC = CryptoAddressValidator.coin(withName: "Bitcoin")!
        
        valid("12KYrjTdVGjFMtaxERSk3gphreJ5US8aUP", coin: BCH)
        valid("12QeMLzSrB8XH8FvEzPMVoRxVAzTr5XM2y", coin: BCH)
        valid("12QeMLzSrB8XH8FvEzPMVoRxVAzTr5XM2y", symbol: "BCH")
        valid("12QeMLzSrB8XH8FvEzPMVoRxVAzTr5XM2y", coin: BTC)
        valid("12QeMLzSrB8XH8FvEzPMVoRxVAzTr5XM2y", symbol: "bch")
        valid("12QeMLzSrB8XH8FvEzPMVoRxVAzTr5XM2y", symbol: "bch")
        valid("1oNLrsHnBcR6dpaBpwz3LSwutbUNkNSjs", coin: BCH)
        valid("mzBc4XEFSdzCDcTxAgf6EZXgsZWpztRhef", coin: BCH, network: .testnet)

        // p2sh addresses
        valid("3NJZLcZEEYBpxYEUGewU4knsQRn1WM5Fkt", coin: BCH)
        valid("2MxKEf2su6FGAUfCEAHreGFQvEYrfYNHvL7", coin: BCH, network: .testnet)

        valid("bitcoincash:qq4v32mtagxac29my6gwj6fd4tmqg8rysu23dax807", symbol: "BCH")
    }
    
    func testUSDT() throws {
        let USDT = CryptoAddressValidator.coin(withName: "tether")!
        
        valid("3MbYQMMmSkC3AgWkj9FMo5LsPTW1zBTwXL", symbol: "usdt")
        valid("1KdXaqcBeoMAFVAPwTmYvDbEq6RnvNPF6J", coin: USDT)
        valid("0xF6f6ebAf5D78F4c93Baf856d3005B7395CCC272e", coin: USDT)
        valid("0x9ec7d40d627ec59981446a6e5acb33d51afcaf8a", coin: USDT)
        valid("3MbYQMMmSkC3AgWkj9FMo5LsPTW1zBTwXL", coin: USDT)
        valid("0x9ec7d40d627ec59981446a6e5acb33d51afcaf8a", coin: USDT)
        
        throwError("1KdXaqcBeoMAFVAPwTmYvDbEq6RnvNPF6Jp", coin: USDT, error: .addressLength)
        throwError("0xF6f6ebAf5D78F4c93Baf856d3005B7395CCC272eT", coin: USDT, error: .addressLength)
        invalid("3MbYQMMmSkC3AgWkj9FMo5LsPTW1zBTwXL", coin: USDT, blockchain: .Ethereum)
    }
    
    func testTRX() throws {
        let TRX = CryptoAddressValidator.coin(withSymbol: "trx")!
        
        valid("TNDzfERDpxLDS2w1q6yaFC7pzqaSQ3Bg3r", coin: TRX)
        valid("27bLJCYjbH6MT8DBF9xcrK6yZnm43vx7MNQ", coin: TRX, network: .testnet)
    }
}
