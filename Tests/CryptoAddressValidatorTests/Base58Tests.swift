//
//  Base58Tests.swift
// CryptoAddressValidator
//
// Using Swift 5.0
// Created by Yury Dryhin on 16.09.2023
// email: yuri.drigin@icloud.com
// LinkedIn: https://www.linkedin.com/in/dtechlabs/
// Copyright © 2023  DTechLabs. All rights reserved.
//

import XCTest
@testable import CryptoAddressValidator

final class Base58Tests: XCTestCase {

    let invalidStrings = [
      "0",
      "O",
      "I",
      "l",
      "3mJr0",
      "O3yxU",
      "3sNI",
      "4kl8",
      "0OIl",
      "!@#$%^&*()-_=+~`"
    ]
    
    let validString = [
      ("", ""),
      (" ", "Z"),
      ("-", "n"),
      ("0", "q"),
      ("1", "r"),
      ("-1", "4SU"),
      ("11", "4k8"),
      ("abc", "ZiCa"),
      ("1234598760", "3mJr7AoUXx2Wqd"),
      ("abcdefghijklmnopqrstuvwxyz", "3yxU3u1igY8WkgtjK92fbJQCd4BZiiT1v25f"),
      ("00000000000000000000000000000000000000000000000000000000000000",
       "3sN2THZeE9Eh9eYrwkvZqNstbHGvrxSAM7gXUXvyFQP8XvQLUqNCS27icwUeDT7ckHm4FUHM2mTVh1vbLmk7y")
    ]
    
    func testBase58Invalid() throws {
        for text in invalidStrings {
            XCTAssertThrowsError(try Base58.decode(text)) { error in
                XCTAssertEqual(error as? CryptographyError, CryptographyError.nonBase58Character)
            }
        }
    }
    
    func testBase58Decode() throws {
        for (decoded, encoded) in validString {
            let bytes = try Base58.decode(encoded)
            let result = String(bytes: bytes, encoding: .utf8)
            XCTAssertEqual(result, decoded)
        }
    }

}
