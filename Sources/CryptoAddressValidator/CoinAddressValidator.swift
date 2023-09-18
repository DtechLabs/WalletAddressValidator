
public protocol CoinAddressValidator {

    static func isValid(_ address: String, coin: Coin, network: NetworkType) throws -> Bool
    
}
